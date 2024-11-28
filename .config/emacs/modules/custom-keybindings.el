;;; custom-keybindings.el -*- lexical-binding: t; -*-

(global-set-key (kbd "C-;") #'embark-act)

(defvar-keymap +leader-buffer-keymap
  :doc "Buffer keymap under Leader Key"
  "k" #'kill-current-buffer
  "b" #'switch-to-buffer-other-window)

(defvar-keymap +leader-code-keymap
  :doc "Code keymap under Leader Key"
  "a" #'eglot-code-actions
  "r" #'eglot-rename
  "s" #'eglot
  "f" #'eglot-format
  "e" #'flymake-show-buffer-diagnostics)

(defvar-keymap +leader-file-keymap
  :doc "File keymap under Leader Key"
  "r" #'recentf-open-files)

(defvar-keymap +leader-project-keymap
  :doc "Project keymap under Leader Key"
  "d" 'project-dired
  "c" 'project-compile
  "s" '+project-save-all-buffers
  "k" 'project-kill-buffers
  "p" 'project-switch-project)

(defvar-keymap +leader-read-feed-keymap
  :doc "Feed keymap under Leader Key"
  "r" #'elfeed)

(defvar-keymap +leader-notes-keymap
  :doc "Notes keymap under Leader Key"
  "c" #'org-capture
  "p" #'org-cliplink
  "f" #'consult-denote-find
  "r" #'consult-denote-grep
  "a" #'org-agenda
  "m" #'+denote/mark-asarchive-task)

(defvar-keymap +leader-search-keymap
  :doc "Search keymap under Leader Key"
  "l" #'consult-line
  "L" #'consult-line-multi
  "r" #'consult-ripgrep
  "o" #'consult-outline
  "i" #'imenu
  "I" #'consult-imenu-multi
  "f" #'consult-fd)

(defvar-keymap +treesit-fold-keymap
  :doc "Buffer keymap under Leader Key"
  "z" #'treesit-fold-toggle
  "c" #'treesit-fold-close
  "C" #'treesit-fold-close-all
  "o" #'treesit-fold-open
  "O" #'treesit-fold-open-all
  "r" #'treesit-fold-open-recursively)

;; Define the key bindings under C-c
(define-key mode-specific-map (kbd "b") +leader-buffer-keymap)
(define-key mode-specific-map (kbd "c") +leader-code-keymap)
(define-key mode-specific-map (kbd "f") +leader-file-keymap)
(define-key mode-specific-map (kbd "n") +leader-notes-keymap)
(define-key mode-specific-map (kbd "p") +leader-project-keymap)
(define-key mode-specific-map (kbd "r") +leader-read-feed-keymap)
(define-key mode-specific-map (kbd "s") +leader-search-keymap)

(define-key mode-specific-map (kbd "<return>") #'denote-silo-extras-open-or-create)

(define-key mode-specific-map (kbd "x") #'consult-register-load)
(define-key mode-specific-map (kbd "z") #'consult-register-store)

(define-key minibuffer-mode-map (kbd "M-h") 'consult-history)
;; Vundo
(define-key vundo-mode-map (kbd "<escape>") #'vundo-quit)

(provide 'custom-keybindings)
