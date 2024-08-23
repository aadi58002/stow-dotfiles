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
  (setq random-themes '(ef-duo-dark ef-bio ef-deuteranopia-dark ef-winter ef-night ef-duo-dark))
  (defun random-color-theme ()
    (interactive)
    (load-theme (nth (random (length random-themes)) random-themes) t))
  (run-with-timer 0 (* 5 60) 'random-color-theme))

(provide 'ui-pkg-setup)
