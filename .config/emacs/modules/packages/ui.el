;;; ui.el -*- lexical-binding: t; -*-

(use-package fontaine
  :config
  (setq fontaine-presets
        '((regular
           :default-height 100)
          (medium
           :default-weight semilight
           :default-height 140)
          (large
           :default-weight semilight
           :default-height 180
           :bold-weight extrabold)
          (t ; our shared fallback properties
           :default-family "Noto Sans Mono"
           :default-weight normal)))
  (fontaine-set-preset 'regular))

(use-package helpful)

(use-package ef-themes
  :config
  (load-theme 'ef-night t))

(provide 'ui-pkg-setup)
