;;; ui.el -*- lexical-binding: t; -*-

(setq mode-line-format (delq 'mode-line-modes mode-line-format))
(setq mode-line-percent-position nil)
;; Dynamic calculation of line number width leads to window shift to right on scroll down
(setq display-line-numbers-width-start t)
