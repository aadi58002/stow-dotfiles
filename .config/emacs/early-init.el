;;; Emacs 27 introduced early-init.el, that runs before anything else | -*- lexical-binding: t; -*-

;; Credit: https://github.com/Animeshz/.emacs.d/blob/main/early-init.el

;; If .el file has .elc (or other) counterpart then load the newer one
(setq load-prefer-newer t)

;; Set GC Threshold to 80 MiB
(setq gc-cons-threshold (* 80 1024 1024)
      gc-cons-percentage 0.6)

;; For inhibiting the while flash at startup (colors: doom-one)
;; (set-face-attribute 'default nil :background "#282c34" :foreground "#bbc2cf")

;; Reduce startup time due to fonts which are larger than system-font.
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

;; Reduce startup time due to file-handler matching
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Set a few post-run handlers
(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))

(defun +reset-init-values ()
  (run-with-idle-timer
   1 nil
   (lambda ()
     (setq file-name-handler-alist default-file-name-handler-alist
           gc-cons-percentage 0.01)
     (when (boundp 'after-focus-change-function)
       (add-function :after after-focus-change-function #'+gc-after-focus-change)))))

(defun +profiling ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds"
      (float-time (time-subtract (current-time) before-init-time)))
    gcs-done))

(with-eval-after-load 'elpaca
  (add-hook 'elpaca-after-init-hook #'+profiling)
  (add-hook 'elpaca-after-init-hook #'+reset-init-values))

;; Disable the default & generally ugly UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-buffer-menu t     ; When opening multiple-files with CLI
      inhibit-splash-screen t           ; Startup Screen
      ring-bell-function #'ignore       ; Silence :^)
      use-file-dialog nil               ; GUI File Dialog
      use-dialog-box nil                ; GUI Yes/No Prompt
      server-client-instructions nil)   ; Instructions for closing session (daemon mode)

;; Debugging
(setq debug-on-error t)

;; Ref: elpaca package-manager
(setq package-enable-at-startup nil)
(setq native-comp-async-report-warnings-errors nil)

(provide 'early-init)
