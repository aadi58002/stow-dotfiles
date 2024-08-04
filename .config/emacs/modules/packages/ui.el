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
           :default-family "Noto Sans Mono"
           :default-weight normal)))
  (fontaine-set-preset 'regular))

(use-package helpful)

(use-package ef-themes)

(use-package theme-buffet
  :after (ef-themes)  ; add your favorite themes here
  :init
  ;; variable below needs to be set when you just want to use the timers mins/hours
  (setq theme-buffet-end-user
          '(:night     (ef-bio ef-winter ef-duo-dark)
            :morning   (ef-deuteranopia-dark)
            :afternoon (ef-night ef-winter)
            :evening   (ef-winter ef-duo-dark))
        theme-buffet-menu 'end-user) ; changing default value from built-in to modus-ef
  :config
  (theme-buffet-end-user)
  (theme-buffet-a-la-carte)
  (theme-buffet-timer-mins 20))

(provide 'ui-pkg-setup)
