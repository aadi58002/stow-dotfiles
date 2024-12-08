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

(use-package which-key
  :config
  (which-key-mode))

(provide 'ui-pkg-setup)
