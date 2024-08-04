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
    (kbd "<leader>cl") #'consult-line
    (kbd "<leader>cr") #'consult-ripgrep
    (kbd "<leader>ci") #'consult-imenu
    (kbd "<leader>cf") #'consule-fd
    (kbd "<leader>ce") #'consult-flymake

    ;; Coding
    (kbd "<leader>pb") #'consult-project-buffer

    ;; Project 
    (kbd "<leader>x") #'consult-register-load
    (kbd "<leader>z") #'consult-register-store 

    (kbd ",") #'kitty-async-process

    (kbd "gw") #'avy-goto-word-0
    (kbd "gc") #'avy-goto-word-1

    (kbd "K") #'helpful-at-point
    (kbd "C-/") #'evilnc-comment-or-uncomment-lines
))

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

;; Helpful Rebinds
(global-set-key [remap describe-callable] #'helpful-callable)
(global-set-key [remap describe-variable] #'helpful-variable)
(global-set-key [remap describe-key] #'helpful-key)
(global-set-key [remap describe-command] #'helpful-command)
(global-set-key [remap describe-function] #'helpful-function)

(provide 'custom-keybindings)
