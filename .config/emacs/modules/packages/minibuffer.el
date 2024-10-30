;;; minibuffer.el -*- lexical-binding: t; -*-

;; Enable vertico
(use-package vertico
  :after consult
  :init
  (vertico-mode 1)
  ;; (vertico-multiform-mode 1)
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20
  ;; Grow and shrink the Vertico minibuffer
        vertico-resize nil
  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
        vertico-cycle t))
  ;; :config
  ;; (setq vertico-buffer-display-action '(display-buffer-in-side-window
  ;;                                       (side . right)
  ;;                                       (window-width . 0.3))
  ;;       vertico-multiform-commands '((consult-ripgrep buffer)
  ;;                                    (consult-fd buffer))))

;; A few more useful configurations...
(use-package emacs
  :ensure nil
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :config
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic flex)
        ;; completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :ensure (consult :host github :repo "minad/consult")
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind (;; Navigation
         ([remap bookmark-jump]                    .  #'consult-bookmark)
         ([remap goto-line]                        .  #'consult-goto-line)
         ([remap locate]                           .  #'consult-locate)
         ([remap recentf-open-files]               .  #'consult-recent-file)
         ([remap imenu]                            .  #'consult-imenu)

         ;; Coding
         ([remap project-search]                   . #'consult-ripgrep)
         ([remap project-find-file]                . #'consult-fd)
         ([remap project-find-regexp]              . #'consult-fd)
         ([remap flymake-show-buffer-diagnostics]  . #'consult-flymake)
         ([remap xref-show-xrefs-function]         . #'consult-xref)
         ([remap xref-show-definitions-function]   . #'consult-xref)

         ;; Project
         ([remap project-switch-to-buffer]         .  #'consult-project-buffer)

         ;; Buffer
         ([remap switch-to-buffer]                 .  #'consult-buffer)
         ([remap switch-to-buffer-other-window]    .  #'consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame]     .  #'consult-buffer-other-frame)

         ;; Misc
         ([remap command-history]                  .  #'consult-history)
         ([remap load-theme]                       .  #'consult-theme)
         ([remap Info-search]                      .  #'consult-info)
         ([remap man]                              .  #'consult-man)
         ([remap yank-pop]                         .  #'consult-yank-pop))
  :init
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window)
  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  ;; Ref: https://github.com/doomemacs/doomemacs/blob/master/modules/completion/vertico/config.el
  (setq consult-narrow-key "<"
        consult-line-numbers-widen t
        consult-async-min-input 2
        consult-async-refresh-delay  0.15
        consult-async-input-throttle 0.2
        consult-async-input-debounce 0.1
        consult-fd-args
        '((if (executable-find "fdfind" 'remote) "fdfind" "fd")
          "--color=never"
          ;; https://github.com/sharkdp/fd/issues/839
          "--full-path --absolute-path"
          "--hidden --exclude .git"
          (if (featurep :system 'windows) "--path-separator=/"))))

(use-package consult-dir
  :after (embark)
  :bind (([remap project-switch-project] .  #'consult-dir)
         ("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file))
  :config
  (setq consult-dir-shadow-filenames nil
        consult-dir-jump-file-command 'consult-fd))


(use-package marginalia
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package embark-consult)
(use-package embark
  :after (which-key)
  :bind (([remap> describe-bindings] . embark-bindings)
          ("C-;" . embark-act))
  :config
  (setq prefix-help-command #'embark-prefix-help-command
        embark-mixed-indicator-delay 0.1
        embark-quit-after-action '((kill-buffer . t) (t . nil))
        embark-verbose-indicator-display-action '(display-buffer-at-bottom)
        embark-quit-after-action nil)

  ;; Embark which key integration. Ref: https://github.com/oantolin/embark/wiki/Additional-Configuration#use-which-key-like-a-key-menu-prompt
  (defun embark-which-key-indicator ()
    "An embark indicator that displays keymaps using which-key.
  The which-key help message will show the type and value of the
  current target followed by an ellipsis if there are further
  targets."
    (lambda (&optional keymap targets prefix)
      (if (null keymap)
          (which-key--hide-popup-ignore-command)
        (which-key--show-keymap
        (if (eq (plist-get (car targets) :type) 'embark-become)
            "Become"
          (format "Act on %s '%s'%s"
                  (plist-get (car targets) :type)
                  (embark--truncate-target (plist-get (car targets) :target))
                  (if (cdr targets) "…" "")))
        (if prefix
            (pcase (lookup-key keymap prefix 'accept-default)
              ((and (pred keymapp) km) km)
              (_ (key-binding prefix 'accept-default)))
          keymap)
        nil nil t (lambda (binding)
                    (not (string-suffix-p "-argument" (cdr binding))))))))

  (setq embark-indicators
    '(embark-which-key-indicator
      embark-highlight-indicator
      embark-isearch-highlight-indicator))

  (defun embark-hide-which-key-indicator (fn &rest args)
    "Hide the which-key indicator immediately when using the completing-read prompter."
    (which-key--hide-popup-ignore-command)
    (let ((embark-indicators
          (remq #'embark-which-key-indicator embark-indicators)))
        (apply fn args)))

  (advice-add #'embark-completing-read-prompter
              :around #'embark-hide-which-key-indicator))

(provide 'minibuffer-pkg-setup)
