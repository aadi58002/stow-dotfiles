;;; better-defaults.el -*- lexical-binding: t; -*-

;; Shell command
(setq shell-command-prompt-show-cwd t)

;; Automatically reread from disk if the underlying file changes
(setq auto-revert-avoid-polling t)
;; Some systems don't do file notifications well; see
;; https://todo.sr.ht/~ashton314/emacs-bedrock/11
(setq auto-revert-interval 5)
(setq auto-revert-check-vc-info t)
(global-auto-revert-mode)

;; Enable minibuffer history, prioritizes M-x & vim commands with most recent commands issued
(setq history-length 100)

;; Set relative lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Configure automatic line breaks and word-wrap (just in case)
(setq-default fill-column 120  ; SPC-c
              auto-fill-function 'do-auto-fill)
(display-fill-column-indicator-mode 1)
(global-visual-line-mode t)  ; SPC-w
(add-hook 'prog-mode #'turn-off-auto-fill)

;; I prefer indentation with spaces
(electric-indent-mode -1)
(setq-default tab-width 2
              indent-line-function 'insert-tab
              indent-tabs-mode nil)

;; Make scratch buffer text-mode
(setq-default initial-scratch-message nil
              initial-major-mode 'text-mode)

;; Replace yes/no with y/n
(setq use-short-answers t)

;; Don't break hardlinks
(setq backup-by-copying t)

;; Count current and total count of isearch
(setq isearch-lazy-count t)

;; Modeline, if the custom one didn't work
(column-number-mode 1)

;;Emacs can read output from programs faster (makes lsp mode faster)
(setq read-process-output-max (* 1024 1024))

(put 'narrow-to-region 'disabled nil)

;; Use custom.el in emacs directory to save variable changes
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Ref: https://www.masteringemacs.org/article/demystifying-emacs-window-manager
;; Consistent behaviour between manually and programatically swithcing buffers (Requires Emacs 27+)
(setq switch-to-buffer-obey-display-actions t)

(provide 'better-defaults)
