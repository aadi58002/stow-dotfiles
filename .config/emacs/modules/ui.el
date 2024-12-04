;;; ui.el -*- lexical-binding: t; -*-

(setq mode-line-format (delq 'mode-line-modes mode-line-format))
(setq mode-line-percent-position nil)
;; Dynamic calculation of line number width leads to window shift to right on scroll down
(setq display-line-numbers-width-start t)

;; Modus theme
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)

;; Keep the border but make it the same color as the background of the
;; mode line (thus appearing borderless).  The difference with the
;; above is that this version is a bit thicker because the border are
;; still there.
(setq modus-themes-common-palette-overrides
      '((border-mode-line-active bg-mode-line-active)
        (border-mode-line-inactive bg-mode-line-inactive)))

(load-theme 'modus-vivendi :no-confirm)

(provide 'ui)
