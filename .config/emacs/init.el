;;; init.el -*- lexical-binding: t; -*-

(setq user-emacs-modules-directory (concat user-emacs-directory "modules/"))
(defun enable-modules (name)
  "Load modules from the modules dir in user-emacs-directory"
  (load (concat user-emacs-modules-directory name)))

;; Install all packages before other configuration
(enable-modules "inbuild-config")

(enable-modules "elpaca-setup")
(enable-modules "load-packages")

;; Loading keybinding at the end because we are using evil specific function to bind keys
(enable-modules "custom-keybindings")
