;;; editor.el -*- lexical-binding: t; -*-

;; keep undo history
(use-package undo-fu
  :config
  (setq evil-undo-system 'undo-fu))

;; keep file's undo history between emacs sessions
(use-package undo-fu-session
  :config
  (undo-fu-session-global-mode))

;; make undo history a tree on-the-fly
(use-package vundo
  :ensure (vundo :host github :repo "casouri/vundo"))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(provide 'editor-pkg-setup)
