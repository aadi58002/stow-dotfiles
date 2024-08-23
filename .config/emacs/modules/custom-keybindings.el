;;; custom-keybindings.el -*- lexical-binding: t; -*-

;; Helpful Docs - https://github.com/noctuid/evil-guide?tab=readme-ov-file#keybindings-in-emacs,
;;                https://evil.readthedocs.io/en/latest/keymaps.html#leader-keys

(global-set-key (kbd "C-;") #'embark-act)

(dolist (state '(normal visual motion operator emacs))
  (evil-set-leader state (kbd "SPC"))
  (evil-define-key state 'global
    (kbd "<leader>fr") #'consult-recent-file

    (kbd "<leader><return>") #'denote-silo-extras-open-or-create
    (kbd "<leader><SPC>") #'find-file

    (kbd "<leader>bk") #'kill-this-buffer
    (kbd "<leader>bb") #'consult-buffer-other-window

    (kbd "<leader>gg") #'magit

    ;; Coding
    (kbd "<leader>ca") #'eglot-code-actions
    (kbd "<leader>cr") #'eglot-rename
    (kbd "<leader>cs") #'eglot
    (kbd "<leader>cf") #'eglot-format
    (kbd "<leader>ce") #'consult-flymake

    ;; Notes
    (kbd "<leader>nc") #'org-capture
    (kbd "<leader>np") #'org-cliplink
    (kbd "<leader>nf") #'consult-denote-find
    (kbd "<leader>nr") #'consult-denote-grep
    (kbd "<leader>na") #'org-agenda
    (kbd "<leader>nm") #'+denote/mark-asarchive-task

    ;; Project
    (kbd "<leader>pb") #'consult-project-buffer

    ;; Search
    (kbd "<leader>sl") #'consult-line
    (kbd "<leader>sr") #'consult-ripgrep
    (kbd "<leader>si") #'consult-imenu
    (kbd "<leader>sf") #'consult-fd

    ;; Registers
    (kbd "<leader>x") #'consult-register-load
    (kbd "<leader>z") #'consult-register-store

    (kbd ",") #'kitty-async-process

    (kbd "gw") #'avy-goto-word-0
    (kbd "gc") #'avy-goto-word-1

    (kbd "K") #'helpful-at-point
    (kbd "C-/") #'evilnc-comment-or-uncomment-lines)

  (evil-define-key state eglot-mode-map
    ;; Coding
    (kbd "<leader>ca") #'eglot-code-actions
    (kbd "<leader>cr") #'eglot-rename
    (kbd "<leader>cs") #'eglot
    (kbd "<leader>cf") #'eglot-format
    (kbd "<leader>ce") #'consult-flymake

    (kbd "zz") #'treesit-fold-toggle
    (kbd "zc") #'treesit-fold-close
    (kbd "zC") #'treesit-fold-close-all
    (kbd "zo") #'treesit-fold-open
    (kbd "zO") #'treesit-fold-open-all
    (kbd "zr") #'treesit-fold-open-recursively)
)

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

;; Org mode
(dolist (state '(normal visual motion operator emacs))
  (evil-define-key state org-mode-map  (kbd "<RET>") #'org-return)

  (evil-define-key state org-agenda-mode-map
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line)
)

(provide 'custom-keybindings)
