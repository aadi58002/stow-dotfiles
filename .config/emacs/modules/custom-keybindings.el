;;; custom-keybindings.el -*- lexical-binding: t; -*-

(general-create-definer leader-key
  :states '(normal motion visual operator emacs)
  :keymaps 'override
  :prefix "SPC")

(leader-key
  "SPC" #'find-file
  "fr" #'consult-recent-file
  "bk" #'kill-this-buffer
  "bb" #'consult-buffer
  "<return>" #'denote-silo-extras-open-or-create)

(general-def '(minibuffer-mode-map)
  "C-S-v" #'evil-paste-after)

(general-def '(isearch-mode-map)
  "C-S-v" #'isearch-yank-pop-only)

(general-def '(normal motion visual global)
  "C-;"  #'embark-act)

;; Remap C-h to helpful package
(general-define-key
  :prefix "C-h"
  "f" #'helpful-callable
  "v" #'helpful-variable
  "k" #'helpful-key
  "F" #'helpful-function
  "C" #'helpful-command)

(general-define-key
 :states 'normal
 "," 'kitty-async-process)

(general-define-key
 :states '(normal motion operator emacs)
 "K" 'helpful-at-point
 "C-/" 'evilnc-comment-or-uncomment-lines)

;; Coding
(leader-key
  "ca" #'eglot-code-actions
  "cl" #'consult-line
  "cr" #'consult-ripgrep
  "ci" #'consult-imenu
  "cf" #'consule-fd
  "ce" #'consult-flymake)

(leader-key
  "gg" #'magit)

(provide 'custom-keybindings)

