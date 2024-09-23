;;; custom-keybindings.el -*- lexical-binding: t; -*-

;; Helpful Docs - https://github.com/noctuid/evil-guide?tab=readme-ov-file#keybindings-in-emacs,
;;                https://evil.readthedocs.io/en/latest/keymaps.html#leader-keys

(global-set-key (kbd "C-;") #'embark-act)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defvar-keymap +leader-buffer-keymap
  :doc "Buffer keymap under Leader Key"
  "k" #'kill-current-buffer
  "b" #'consult-buffer-other-window)

(defvar-keymap +leader-code-keymap
  :doc "Code keymap under Leader Key"
  "a" #'eglot-code-actions
  "r" #'eglot-rename
  "s" #'eglot
  "f" #'eglot-format
  "e" #'consult-flymake)

(defvar-keymap +leader-file-keymap
  :doc "File keymap under Leader Key"
  "r" #'consult-recent-file)

(defvar-keymap +leader-git-keymap
  :doc "Git keymap under Leader Key"
  "g" #'magit)

(defvar-keymap +leader-notes-keymap
  :doc "Notes keymap under Leader Key"
  "c" #'org-capture
  "p" #'org-cliplink
  "f" #'consult-denote-find
  "r" #'consult-denote-grep
  "a" #'org-agenda
  "m" #'+denote/mark-asarchive-task)

(defvar-keymap +leader-project-keymap
  :doc "Project keymap under Leader Key"
  "b" #'consult-project-buffer)

(defvar-keymap +leader-search-keymap
  :doc "Search keymap under Leader Key"
  "l" #'consult-line
  "r" #'consult-ripgrep
  "i" #'consult-imenu
  "f" #'consult-fd)

(defvar-keymap +leader-keymap
  :doc "Leader Keymap"
  "b" +leader-buffer-keymap
  "c" +leader-code-keymap
  "f" +leader-file-keymap
  "g" +leader-git-keymap
  "n" +leader-notes-keymap
  "p" +leader-project-keymap
  "s" +leader-search-keymap

  "<return>" #'denote-silo-extras-open-or-create
  "<SPC>" #'find-file
  "x" #'consult-register-load
  "z" #'consult-register-store)

(defvar-keymap +treesit-fold-keymap
  :doc "Buffer keymap under Leader Key"
  "z" #'treesit-fold-toggle
  "c" #'treesit-fold-close
  "C" #'treesit-fold-close-all
  "o" #'treesit-fold-open
  "O" #'treesit-fold-open-all
  "r" #'treesit-fold-open-recursively)

(dolist (state '(normal visual motion operator emacs))
  (evil-set-leader state (kbd "SPC"))

  (evil-define-key state 'global
    (kbd "<leader>") +leader-keymap
    (kbd "z") +treesit-fold-keymap

    (kbd ",") #'async-shell-command
    (kbd "C-,") #'kitty-async-process

    (kbd "gw") #'avy-goto-word-0
    (kbd "gc") #'avy-goto-word-1

    (kbd "K") #'helpful-at-point
    (kbd "C-/") #'evilnc-comment-or-uncomment-lines)

  ;;(evil-define-key state 'org-mode-map (kbd "<return>") #'org-return)

  (evil-define-key state org-agenda-mode-map
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line))

(evil-define-key 'normal 'dired-mode-map (kbd "<leader>") +leader-keymap)

(define-key minibuffer-mode-map (kbd "M-h") 'consult-history)
(define-key minibuffer-mode-map (kbd "C-S-v") #'evil-paste-after)
(define-key isearch-mode-map (kbd "C-S-v") #'isearch-yank-pop-only)
;; Vundo
(define-key vundo-mode-map (kbd "<escape>") #'vundo-quit)

;; Navigation
(dolist (state '(normal motion operator emacs))
  (evil-define-key state 'global
    (kbd "<") #'(lambda () (interactive) (evil-previous-line 10))
    (kbd ">") #'(lambda () (interactive) (evil-next-line 10))))

(evil-define-key 'visual 'global (kbd ">") '+evil-shift-right)
(evil-define-key 'visual 'global (kbd "<") '+evil-shift-left)

(provide 'custom-keybindings)
