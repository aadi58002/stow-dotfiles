;;; ui.el -*- lexical-binding: t; -*-

(use-package fontaine
  :config
  (setq fontaine-presets
        '((regular
           :default-height 90)
          (medium
           :default-weight semilight
           :default-height 140)
          (large
           :default-weight semilight
           :default-height 180
           :bold-weight extrabold)
          (t ; our shared fallback properties
           :default-family "CaskaydiaCove Nerd Font"
           :default-weight normal)))
  (fontaine-set-preset 'regular))

(use-package helpful
  :config
  (global-set-key [remap describe-callable] #'helpful-callable)
  (global-set-key [remap describe-variable] #'helpful-variable)
  (global-set-key [remap describe-key] #'helpful-key)
  (global-set-key [remap describe-command] #'helpful-command)
  (global-set-key [remap describe-function] #'helpful-function))

(use-package ef-themes
  :config
  (defun +ef-themes-mode-line ()
    "Tweak the style of the mode lines."
    (ef-themes-with-colors
      (custom-set-faces
      `(mode-line ((,c :background ,bg-mode-line :foreground ,fg-mode-line)))
      `(mode-line-inactive ((,c))))))

  (add-hook 'ef-themes-post-load-hook #'+ef-themes-mode-line)

  ;; They are nil by default...
  (setq ef-themes-mixed-fonts t
        ef-themes-variable-pitch-ui t)

  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'ef-duo-dark t))
  ;; (run-with-timer 0 (* 5 60) (lambda () (ef-themes-load-random 'dark))))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t))

(use-package which-key
  :config
  (which-key-mode))

(use-package tab-bar
  :ensure nil
  :bind
  (("C-<iso-lefttab>" . tab-line-switch-to-prev-tab)
   ("C-<tab>" . tab-line-switch-to-next-tab))
  :config
  (global-tab-line-mode 1)
  (setq tab-line-new-button-show nil
        tab-line-close-button-show nil))

(provide 'ui-pkg-setup)
