;;; custom-keybindings.el -*- lexical-binding: t; -*-

;;; custom-keybindings.el -*- lexical-binding: t; -*-

;; Helpful Docs - https://github.com/noctuid/evil-guide?tab=readme-ov-file#keybindings-in-emacs,
;;                https://evil.readthedocs.io/en/latest/keymaps.html#leader-keys

(global-set-key (kbd "C-;") #'embark-act)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(which-key-add-key-based-replacements
  "<SPC> b" "buffers"
  "<SPC> c" "code"
  "<SPC> f" "files"
  "<SPC> g" "git"
  "<SPC> n" "notes"
  "<SPC> p" "project"
  "<SPC> s" "search")

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

(defvar-keymap +leader-git-keymap
  :doc "Git keymap under Leader Key"
  "b" #'magit-blame-addition
  "g" #'magit)

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

(defvar-keymap +leader-keymap
  :doc "Leader Keymap"
  "b" +leader-buffer-keymap
  "c" +leader-code-keymap
  "f" +leader-file-keymap
  "g" +leader-git-keymap
  "n" +leader-notes-keymap
  "p" +leader-project-keymap
  "s" +leader-search-keymap

  "<return>" #'denote-silo-open-or-create
  "<SPC>" #'find-file
  "x" #'consult-register-load
  "z" #'consult-register-store)

(dolist (state '(normal visual motion operator emacs))
  (evil-set-leader state (kbd "SPC"))

  (evil-define-key state 'global
    (kbd "<leader>") +leader-keymap

    (kbd ",") #'async-shell-command
    (kbd "C-,") #'terminal-async-process

    (kbd "gw") #'avy-goto-word-0
    (kbd "gc") #'avy-goto-word-1

    (kbd "K") #'helpful-at-point
    (kbd "C-/") #'evilnc-comment-or-uncomment-lines)

  ;;(evil-define-key state 'org-mode-map (kbd "<return>") #'org-return)

  (evil-define-key state org-agenda-mode-map
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line))

(evil-define-key 'normal 'dired-mode-map (kbd "<SPC>") +leader-keymap)
(evil-define-key 'normal 'eglot-mode-map (kbd "M-p") 'flymake-goto-prev-error)
(evil-define-key 'normal 'eglot-mode-map (kbd "M-n") 'flymake-goto-next-error)

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
