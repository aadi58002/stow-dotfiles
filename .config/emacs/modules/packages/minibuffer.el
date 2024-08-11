;;; minibuffer.el -*- lexical-binding: t; -*-

;; Enable vertico
(use-package vertico
  :after consult
  :init
  (vertico-mode 1)
  (vertico-multiform-mode 1)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize nil)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t)
  :config
  (setq vertico-buffer-display-action '(display-buffer-in-side-window
                                        (side . right)
                                        (window-width . 0.3))
        vertico-multiform-commands '((consult-line buffer)
                                     (consult-ripgrep buffer)
                                     (consult-fd buffer))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

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

;; Example configuration for Consult
(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind (:map consult-narrow-map ("?" . consult-narrow-help))
  :init
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window))

(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package marginalia
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package embark
  :config
  (setq prefix-help-command #'embark-prefix-help-command
        embark-mixed-indicator-delay 0.1
        embark-verbose-indicator-display-action '(display-buffer-at-bottom)
        embark-quit-after-action nil))

(use-package embark-consult)

(provide 'minibuffer-pkg-setup)
