;;; git.el -*- lexical-binding: t; -*-

(use-package transient)

(use-package magit
  :after transient
  :config
  (add-hook 'git-commit-post-finish-hook 'magit)
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package forge
  :after magit)

(use-package diff-hl
  :after magit
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode))

(provide 'git)
