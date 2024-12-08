;;; git.el -*- lexical-binding: t; -*-

(use-package transient)

(use-package magit
  :config
  (add-hook 'git-commit-post-finish-hook 'magit)
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package git-gutter-fringe
  :config
  ;; (setq git-gutter-fr:side 'right-fringe)
  (global-git-gutter-mode +1)
  (setq-default fringes-outside-margins t))

(provide 'git-pkg-setup)
