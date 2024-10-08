;;; lsp.el -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :defer t
  :after (cape orderless tempel breadcrumb)
  :commands (eglot
             eglot-code-actions
             eglot-ensure
             eglot-rename
             eglot-format-buffer)
  :config
  ;; ;; Emacs 30; Activate editor config mode
  ;; (editorconfig-mode 1)

  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
        eglot-report-progress t)

  ;; No event buffers, disable providers cause a lot of hover traffic. Shutdown unused servers.
  (setq eglot-events-buffer-size 0
        eglot-ignored-server-capabilities '(;;:hoverProvider
                                            :documentHighlightProvider)
        ;; Prevent minibuffer spam
        eglot-report-progress nil
        eglot-autoshutdown t)

  (fset #'jsonrpc--log-event #'ignore)
  ;; Option 1: Specify explicitly to use Orderless for Eglot
  (setq completion-category-overrides '((eglot (styles orderless))
                                        (eglot-capf (styles orderless))))


  ;; Option 2: Undo the Eglot modification of completion-category-defaults
  (with-eval-after-load 'eglot
     (setq completion-category-defaults nil))

  ;; Enable cache busting, depending on if your server returns
  ;; sufficiently many candidates in the first place.

  (defun +lsp/eglot-capf ()
    (setq-local eldoc-documentation-functions
                            '(flymake-eldoc-function
                              eglot-signature-eldoc-function
                              eglot-hover-eldoc-function)))

  (defun +lsp/eglot-eldoc ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                          #'tempel-expand
                          #'eglot-completion-at-point
                          #'cape-keyword
                          #'cape-file))))

  (defun +lsp/custom-setup-eglot ()
    (add-to-list 'mode-line-misc-info '(" [ " (:eval (breadcrumb-imenu-crumbs)) " ] ") 'APPEND))

  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (add-hook 'eglot-managed-mode-hook #'+lsp/eglot-capf)
  (add-hook 'eglot-managed-mode-hook #'+lsp/eglot-eldoc)
  (add-hook 'eglot-managed-mode-hook #'+lsp/custom-setup-eglot)

  (add-to-list 'eglot-server-programs
             `(((js-mode :language-id "javascript")
                 (js-ts-mode :language-id "javascript")
                 (tsx-ts-mode :language-id "typescriptreact")
                 (typescript-ts-mode :language-id "typescript")
                 (typescript-mode :language-id "typescript"))
                 .
                ("typescript-language-server" "--stdio"
                :initializationOptions (
                  :maxTsServerMemory 8192)))))

(use-package project
  :ensure nil
  :config
  (setq project-mode-line t)
  (setq project-vc-extra-root-markers '(".git" "package.json" "Cargo.toml")))

(use-package treesit
  :ensure nil
  :config
  ;; List of file extensions and corresponding modes
  (setq treesit-language-source-alist
    '((bash "https://github.com/tree-sitter/tree-sitter-bash")
      (c "https://github.com/tree-sitter/tree-sitter-c")
      (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
      (cmake "https://github.com/uyha/tree-sitter-cmake")
      (css "https://github.com/tree-sitter/tree-sitter-css")
      (elisp "https://github.com/Wilfred/tree-sitter-elisp")
      (go "https://github.com/tree-sitter/tree-sitter-go")
      (html "https://github.com/tree-sitter/tree-sitter-html")
      (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
      (json "https://github.com/tree-sitter/tree-sitter-json")
      (make "https://github.com/alemuller/tree-sitter-make")
      (markdown "https://github.com/ikatyang/tree-sitter-markdown")
      (rust "https://github.com/tree-sitter/tree-sitter-rust")
      (python "https://github.com/tree-sitter/tree-sitter-python")
      (toml "https://github.com/tree-sitter/tree-sitter-toml")
      (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
      (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
      (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

  (setq mode-list '(("\\.tsx\\'" . tsx-ts-mode)
                    ("\\.ts\\'" . typescript-ts-mode)
                    ("\\.rs\\'" . rust-ts-mode)
                    ("\\.c\\'" . c-ts-mode)
                    ("\\.cpp\\'" . c++-ts-mode)
                    ("\\.py\\'" . python-mode)))

  (setq treesit-font-lock-level 4)
  ;; Loop to add file extensions to auto-mode-alist
  (dolist (mode-pair mode-list)
    (add-to-list 'auto-mode-alist mode-pair))

  ;; List of modes to add eglot to their hooks
  (setq eglot-modes (mapcar 'cdr mode-list))

  ;; Loop to add eglot to the respective mode hooks
  (dolist (mode eglot-modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) 'eglot-ensure))
)

(use-package breadcrumb
  :config
  (fset 'breadcrumb--project-crumbs-1 #'ignore))

(use-package treesit-fold
  ;; :config
  ;; (global-treesit-fold-indicators-mode 1)
)

;; Configure Tempel
(use-package tempel
  :custom
  (tempel-trigger-prefix "<")
  :init
  (setq completion-at-point-functions
              (cons #'tempel-complete
                    completion-at-point-functions))

  (global-tempel-abbrev-mode))

;; Comment and Uncommenting
(use-package evil-nerd-commenter)

;; Additional protocol extension for accessing files
(use-package tramp
  :ensure nil)

(use-package prog-mode
  :ensure nil)

(provide 'lsp-pkg-setup)
