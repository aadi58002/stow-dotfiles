;;; keybinds.el -*- lexical-binding: t; -*-

;; Emulates vim keybinds & modal editing
(use-package evil
  :init
  (setq evil-v$-excludes-newline t       ; $ in visual doesn't include \n
        evil-kill-on-visual-paste nil    ; pasting in visual mode won't copy replaced text to clipboard
        evil-cross-lines t               ; h and l to move to newline
        ;; evil-respect-visual-line-mode t  ; physical line as $ anchor instead of \n, caveat: dj dk doesn't work as intended
        evil-shift-width tab-width       ; << and >>
        evil-want-keybinding nil         ; required by =evil-collection=
        evil-undo-system 'undo-redo      ; Use built-in emacs undo since emacs 28.1
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-ex-search-count t)
  :config
  (evil-mode 1)
  (defun +evil-shift-right ()
    (interactive)
    (evil-shift-right evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))

  (defun +evil-shift-left ()
    (interactive)
    (evil-shift-left evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))

  (evil-define-key 'visual global-map (kbd ">") '+evil-shift-right)
  (evil-define-key 'visual global-map (kbd "<") '+evil-shift-left))

;; Extend support of vim keybindings on to various other packages
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-multiedit
  :after evil
  :config
  (evil-multiedit-default-keybinds))

;; Used to set keybinds
(use-package general
  :after evil
  :config
  (general-override-mode)
  (general-auto-unbind-keys))

(provide 'keybinds-pkg-setup)
