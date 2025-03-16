;;; lsp.el -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :after (cape breadcrumb)
  :config
  ;; Emacs 30; Activate editor config mode
  (editorconfig-mode 1)

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
  (defun +lsp/setup-eglot ()
    (setq-local eldoc-documentation-functions
                            '(flymake-eldoc-function
                              eglot-signature-eldoc-function
                              eglot-hover-eldoc-function)

                eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)

    (add-to-list 'mode-line-misc-info '(" [ " (:eval (breadcrumb-imenu-crumbs)) " ] ") 'APPEND))

  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (add-hook 'eglot-managed-mode-hook #'+lsp/setup-eglot)

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
  (setq project-vc-extra-root-markers '(".git" "package.json" "Cargo.toml" ".project")))

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
      (nu "https://github.com/nushell/tree-sitter-nu")
      (rust "https://github.com/tree-sitter/tree-sitter-rust")
      (python "https://github.com/tree-sitter/tree-sitter-python")
      (toml "https://github.com/tree-sitter/tree-sitter-toml")
      (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
      (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
      (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

  (setq mode-list '(("\\.tsx\\'" . tsx-ts-mode)
                    ("\\.ts\\'" . typescript-ts-mode)
                    ("\\.rs\\'" . rust-ts-mode)
                    ("\\.go\\'" . go-ts-mode)
                    ("\\.nu\\'" . shell-mode)
                    ("\\.c\\'" . c-ts-mode)
                    ("\\.cpp\\'" . c++-ts-mode)
                    ("\\.py\\'" . python-ts-mode)))

  (setq treesit-font-lock-level 4)
  (dolist (mode-pair mode-list)
    (add-to-list 'auto-mode-alist mode-pair))

  (setq eglot-modes (mapcar 'cdr mode-list))

  (dolist (mode eglot-modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) 'eglot-ensure)))

;; Comment and Uncommenting
(use-package evil-nerd-commenter)

(provide 'lsp-pkg-setup)
