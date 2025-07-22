;;; minibuffer.el -*- lexical-binding: t; -*-

;; Enable vertico
(use-package vertico
  :after consult
  :init
  (setq vertico-count 20
        vertico-resize nil
        vertico-cycle t)
  (vertico-mode))

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

  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; TAB cycle if there are only few candidates
  ;; (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)


  ;; Emacs 30 and newer: Disable Ispell completion function. As an alternative,
  ;; try `cape-dict'.
  (setq text-mode-ispell-word-completion nil)


  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :config
  (setq completion-styles '(orderless basic flex)
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
         ([remap list-buffers]                 .  #'consult-buffer)
         ([remap switch-to-buffer-other-window]    .  #'consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame]     .  #'consult-buffer-other-frame)

         ;; Misc
         ([remap command-history]                  .  #'consult-history)
         ([remap load-theme]                       .  #'consult-theme)
         ([remap Info-search]                      .  #'consult-info)
         ([remap man]                              .  #'consult-man)
         ([remap yank-pop]                         .  #'consult-yank-pop))
  :init
  (defun consult--orderless-regexp-compiler (input type &rest _config)
    (setq input (cdr (orderless-compile input)))
    (cons
    (mapcar (lambda (r) (consult--convert-regexp r type)) input)
    (lambda (str) (orderless--highlight input t str))))

  ;; OPTION 1: Activate globally for all consult-grep/ripgrep/find/...
  (setq consult--regexp-compiler #'consult--orderless-regexp-compiler)

  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window)
  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  ;; Ref: https://github.com/doomemacs/doomemacs/blob/master/modules/completion/vertico/config.el
  (setq consult-fd-args
        '((if (executable-find "fdfind" 'remote) "fdfind" "fd")
          "--hidden --full-path --color=never")))

(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package marginalia
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init 
  (setq marginalia-align 'center)
  (marginalia-mode))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package embark
  :after (which-key)
  :bind (([remap> describe-bindings] . embark-bindings)
          ("C-;" . embark-act))
  :config
  (setq prefix-help-command #'embark-prefix-help-command
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
