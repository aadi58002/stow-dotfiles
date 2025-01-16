(setq user-emacs-packages-directory (concat user-emacs-modules-directory "packages/"))
(defun load-packages (name &optional immediate)
  "Load modules from the packages dir in user-emacs-packages-directory"
  (load (concat user-emacs-packages-directory name))
  (if immediate
     (elpaca-wait)))

;; Load evil first as its a dependency of many other packages
(load-packages "keybinds")

(load-packages "completion")
(load-packages "custom-functions")
(load-packages "editor")
(load-packages "git")
(load-packages "icons")
(load-packages "lsp")
(load-packages "minibuffer")
(load-packages "notes")
(load-packages "news")
(load-packages "ui")

(elpaca-wait)
