;;; lsp.el -*- lexical-binding: t; -*-

(use-package tramp)

(use-package eglot
  :after (cape orderless tempel)
  :ensure nil
  :config
  ;; No event buffers, disable providers cause a lot of hover traffic. Shutdown unused servers.
  (setq eglot-events-buffer-size 0
        ;; eglot-ignored-server-capabilities '(:hoverProvider
        ;;                                     :documentHighlightProvider)
        eglot-autoshutdown t)

  ;; Option 1: Specify explicitly to use Orderless for Eglot
  (setq completion-category-overrides '((eglot (styles orderless))
                                        (eglot-capf (styles orderless))))
  
  ;; Option 2: Undo the Eglot modification of completion-category-defaults
  (with-eval-after-load 'eglot
     (setq completion-category-defaults nil))
  
  ;; Enable cache busting, depending on if your server returns
  ;; sufficiently many candidates in the first place.
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (setq-local completion-at-point-functions
                          (list (cape-capf-super
                                 #'tempel-expand
                                 #'eglot-completion-at-point
                                 #'cape-keyword
                                 #'cape-file)))))
  ;; Eldoc configuration
  (setq eldoc-documentation-strategy
            'eldoc-documentation-compose-eagerly)
  (add-hook 'eglot-managed-mode-hook
            (lambda () (setq eldoc-documentation-functions
                            '(flymake-eldoc-function
                              eglot-signature-eldoc-function
                              eglot-hover-eldoc-function)))))

(use-package project
  :ensure nil
  :config
  (setq project-vc-extra-root-markers '(".git" "package.json" "Cargo.toml")))

(use-package treesit
  :ensure nil
  :config
  ;; List of file extensions and corresponding modes
  (setq mode-list '(("\\.tsx\\'" . tsx-ts-mode)
                    ("\\.ts\\'" . typescript-ts-mode)
                    ("\\.cpp\\'" . c++-ts-mode)
                    ("\\.py\\'" . python-mode)))
  
  ;; Loop to add file extensions to auto-mode-alist
  (dolist (mode-pair mode-list)
    (add-to-list 'auto-mode-alist mode-pair))
  
  ;; List of modes to add eglot to their hooks
  (setq eglot-modes (mapcar 'cdr mode-list))
  
  ;; Loop to add eglot to the respective mode hooks
  (dolist (mode eglot-modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) 'eglot-ensure))
)

;; Configure Tempel
(use-package tempel
  :init
  (setq completion-at-point-functions
              (cons #'tempel-complete
                    completion-at-point-functions))

  (global-tempel-abbrev-mode))

(use-package evil-nerd-commenter)

(provide 'lsp-pkg-setup)
