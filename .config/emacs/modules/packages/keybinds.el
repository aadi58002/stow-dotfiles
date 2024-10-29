;;; keybinds.el -*- lexical-binding: t; -*-

(use-package avy
  :config
  (custom-set-faces
    `(avy-background-face ((t (:foreground "#666666" :background ,(face-background 'default) :weight bold))))
    `(avy-lead-face ((t (:foreground   "#ff007c" :background ,(face-background 'default) :weight bold))))
    `(avy-lead-face-0 ((t (:foreground "#00dfff" :background ,(face-background 'default) :weight bold))))
    `(avy-lead-face-1 ((t (:foreground "#2b8db3" :background ,(face-background 'default) :weight bold))))
    `(avy-lead-face-2 ((t (:foreground "#00ff00" :background ,(face-background 'default) :weight bold)))))

  (setq avy-background nil
        avy-highlight-first t))

(provide 'keybinds-pkg-setup)
