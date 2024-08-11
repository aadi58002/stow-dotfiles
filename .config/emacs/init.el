;;; init.el -*- lexical-binding: t; -*-

(setq user-emacs-modules-directory (concat user-emacs-directory "modules/"))
(defun enable-modules (name)
  "Load modules from the modules dir in user-emacs-directory"
  (load (concat user-emacs-modules-directory name)))

;; Install all packages before other configuration
(enable-modules "better-defaults")
(enable-modules "better-dired")
(enable-modules "file-cleanup")

(enable-modules "elpaca-setup")
(enable-modules "load-packages")

(enable-modules "ui")
(enable-modules "custom-keybindings")
