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

(setq inhibit-compacting-font-caches t)

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

;; Ref :- https://emacsredux.com/blog/2026/04/07/stealing-from-the-best-emacs-configs/
;; Disable Bidirectional Text Scanning (Doom Emacs)
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Skip Fontification During Input (Doom Emacs)
(setq redisplay-skip-fontification-on-input t)

;; Don’t Render Cursors in Non-Focused Windows (Doom Emacs)
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Ref: https://www.jamescherti.com/compiling-emacs
;; Original Ref: elpaca package-manager
(setq package-enable-at-startup nil)
(setq native-comp-async-report-warnings-errors nil)
;; Display the architecture using:
;;   gcc -march=native -Q --help=target | grep march
;;
;; The above command asks the compiler to resolve native for your current CPU
;; and display the resulting target. For example, if the output shows
;; -march=skylake, you know that skylake is the identifier you should pass to
;; -mtune and -march.
(setq my-cpu-architecture "znver5")

;; `native-comp-compiler-options' specifies flags passed directly to the C
;; compiler (for example, GCC) when compiling the Lisp-to-C output
;; produced by the native compilation process. These flags affect code
;; generation, optimization, and debugging information.
(setq native-comp-compiler-options `(;; The most meaningful optimizations:
                                     "-O2"
                                     ,(format "-mtune=%s" my-cpu-architecture)
                                     ,(format "-march=%s" my-cpu-architecture)
                                     ;; Reduce .eln size and compilation
                                     ;; overhead.
                                     "-g0"
                                     ;; Good defensive choice for Emacs
                                     ;; stability.
                                     "-fno-omit-frame-pointer"
                                     "-fno-finite-math-only"))

(setq native-comp-driver-options '(;; -Wl,-z,pack-relative-relocs compresses
                                   ;; relocation tables to reduce file size and
                                   ;; slightly improve load times.
                                   "-Wl,-z,pack-relative-relocs"
                                   ;; -Wl,-O2 applies standard linker-level
                                   ;; optimizations (like string merging) to the
                                   ;; generated shared object.
                                   "-Wl,-O2"
                                   ;; -Wl,--as-needed prevents the linker from
                                   ;; recording dependencies on libraries that
                                   ;; are not actually used by the code.
                                   "-Wl,--as-needed"))

(provide 'early-init)
