;;; editor.el -*- lexical-binding: t; -*-

;; keep undo history
(use-package undo-fu)

;; keep file's undo history between emacs sessions
(use-package undo-fu-session
  :config
  (undo-fu-session-global-mode))

;; make undo history a tree on-the-fly
(use-package vundo
  :ensure (vundo :host github :repo "casouri/vundo"))

; Auto Save buffers
(auto-save-visited-mode 1);

;; Ref: https://github.com/jamescherti/minimal-emacs.d
;; Auto-revert in Emacs is a feature that automatically updates the
;; contents of a buffer to reflect changes made to the underlying file
;; on disk.
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

;; recentf is an Emacs package that maintains a list of recently
;; accessed files, making it easier to reopen files you have worked on
;; recently.
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode))

;; save-place-mode enables Emacs to remember the last location within a file
;; upon reopening. This feature is particularly beneficial for resuming work at
;; the precise point where you previously left off.
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; savehist is an Emacs feature that preserves the minibuffer history between
;; sessions. It saves the history of inputs in the minibuffer, such as commands,
;; search strings, and other prompts, to a file. This allows users to retain
;; their minibuffer history across Emacs restarts.
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init
  (setq savehist-ignored-variables '(extended-command-history)))

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(provide 'editor-pkg-setup)
