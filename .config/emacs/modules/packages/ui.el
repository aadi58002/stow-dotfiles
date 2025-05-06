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
  (fontaine-set-preset 'medium))

(use-package helpful
  :config
  (global-set-key [remap describe-callable] #'helpful-callable)
  (global-set-key [remap describe-variable] #'helpful-variable)
  (global-set-key [remap describe-key] #'helpful-key)
  (global-set-key [remap describe-command] #'helpful-command)
  (global-set-key [remap describe-function] #'helpful-function))

(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package indent-bars
  :hook ((tsx-ts-mode typescript-ts-mode) . indent-bars-mode))

;;(use-package ef-themes
;;  :config
;;  (setq random-themes '(ef-bio ef-cherie ef-dark ef-deuteranopia-dark ef-duo-dark ef-maris-dark ef-night))
;;
;;  (defun +ef-themes-mode-line ()
;;    "Tweak the style of the mode lines."
;;    (ef-themes-with-colors
;;     (custom-set-faces
;;      `(mode-line ((,c :background ,bg-mode-line :foreground ,fg-mode-line)))
;;      `(mode-line-inactive ((,c))))))
;;  (add-hook 'ef-themes-post-load-hook #'+ef-themes-mode-line)
;;
;;  (defun random-color-theme ()
;;    (interactive)
;;    (load-theme (nth (random (length random-themes)) random-themes) t))
;;  (random-color-theme))
;; (run-with-timer 0 (* 10 60) 'random-color-theme))

(provide 'ui-pkg-setup)
