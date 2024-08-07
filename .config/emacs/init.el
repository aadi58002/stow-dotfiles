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

(enable-modules "custom-keybindings")
(enable-modules "modeline")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq denote-directory denote-pastime-directory)
     (eval setq denote-directory denote-tasks-directory)
     (denote-directory quote denote-tasks-directory)
     (denote-directory . denote-tasks-directory))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-background-face ((t (:foreground "#666666" :background "#282c34" :weight bold))))
 '(avy-lead-face ((t (:foreground "#ff007c" :background "#282c34" :weight bold))))
 '(avy-lead-face-0 ((t (:foreground "#00dfff" :background "#282c34" :weight bold))))
 '(avy-lead-face-1 ((t (:foreground "#2b8db3" :background "#282c34" :weight bold))))
 '(avy-lead-face-2 ((t (:foreground "#00ff00" :background "#282c34" :weight bold)))))
