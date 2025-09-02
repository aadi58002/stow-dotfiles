;;; keybinds.el -*- lexical-binding: t; -*-

;; Emulates vim keybinds & modal editing
(use-package evil
  :init
  (setq evil-v$-excludes-newline t       ; $ in visual doesn't include \n
        evil-kill-on-visual-paste nil    ; pasting in visual mode won't copy replaced text to clipboard
        evil-cross-lines t               ; h and l to move to newline
        ;; evil-respect-visual-line-mode t  ; physical line as $ anchor instead of \n, caveat: dj dk doesn't work as intended
        evil-move-beyond-eol t
        evil-want-Y-yank-to-eol t
        evil-shift-width tab-width       ; << and >>
        evil-want-keybinding nil         ; required by =evil-collection=
        evil-undo-system 'undo-redo      ; Use built-in emacs undo since emacs 28.1
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-ex-search-count t)
  :config
  (evil-mode 1))

;; Extend support of vim keybindings on to various other packages
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-want-unimpaired-p nil)
  (evil-collection-init))

(provide 'keybinds)
