;;; better-defaults.el -*- lexical-binding: t; -*-

;; Shell command
(setq shell-command-prompt-show-cwd t)

;; Automatically reread from disk if the underlying file changes
(setq auto-revert-avoid-polling t)
;; Some systems don't do file notifications well; see
;; https://todo.sr.ht/~ashton314/emacs-bedrock/11
(setq auto-revert-interval 5)
(setq auto-revert-check-vc-info t)

;; Enable minibuffer history, prioritizes M-x & vim commands with most recent commands issued
(setq history-length 100)

;; Set relative lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Configure automatic line breaks and word-wrap (just in case)
(setq-default fill-column 120  ; SPC-c
              auto-fill-function 'do-auto-fill)
(display-fill-column-indicator-mode t)
(global-visual-line-mode t)  ; SPC-w
(add-hook 'prog-mode #'turn-off-auto-fill)

(setq switch-to-buffer-obey-display-actions t)

;; Auto-Chmod Scripts on Save (Multiple Configs)
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

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
(setq read-process-output-max (* 20 1024 1024))

(put 'narrow-to-region 'disabled nil)

;; Save the Clipboard Before Killing (Purcell, Prot, Centaur)
(setq save-interprogram-paste-before-kill t)

;; No Duplicates in the Kill Ring (Doom, Prot)
(setq kill-do-not-save-duplicates t)

;; Use custom.el in emacs directory to save variable changes
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Ref: https://www.masteringemacs.org/article/demystifying-emacs-window-manager
(setq switch-to-buffer-obey-display-actions t)

;; Ref: https://www.masteringemacs.org/article/demystifying-emacs-window-manager
;; Consistent behaviour between manually and programatically swithcing buffers (Requires Emacs 27+)

;; Backup and locked file
(setq create-lockfiles nil
      make-backup-files nil
      backup-inhibited t)

;; Dired
(setq dired-recursive-copies 'always
      dired-kill-when-opening-new-dired-buffer t
      dired-recursive-deletes 'always
      delete-by-moving-to-trash t
      dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"
      dired-dwim-target t
      dired-create-destination-dirs 'ask)

;; Theme
(setq mode-line-format (delq 'mode-line-modes mode-line-format))
(setq mode-line-percent-position nil)
;; Dynamic calculation of line number width leads to window shift to right on scroll down
(setq display-line-numbers-width-start t)

;; Modus theme
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)

;; Keep the border but make it the same color as the background of the
;; mode line (thus appearing borderless).  The difference with the
;; above is that this version is a bit thicker because the border are
;; still there.
(setq modus-themes-common-palette-overrides
      '((border-mode-line-active bg-mode-line-active)
        (border-mode-line-inactive bg-mode-line-inactive)))

(pixel-scroll-precision-mode +1)

;; Proportional Window Resizing (Purcell, Prot)
(setq window-resize-pixelwise nil
      window-combination-resize t)

;; Sane Syntax in re-builder (Multiple Configs)
(setq reb-re-syntax 'string)

;; Prevent find-file-at-point from Pinging Hostnames (Centaur Emacs)
(setq ffap-machine-p-known 'reject)

;; (load-theme 'modus-vivendi-tinted :no-confirm)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq auth-sources '("~/.local/share/gnupg/emacs-authinfo.gpg"))

(provide 'better-defaults)
