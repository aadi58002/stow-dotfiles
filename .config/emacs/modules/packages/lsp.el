;;; lsp.el -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :after (cape orderless tempel)
  :config
  ;; No event buffers, disable providers cause a lot of hover traffic. Shutdown unused servers.
  (setq eglot-events-buffer-size 0
        eglot-ignored-server-capabilities '(;;:hoverProvider
                                            :documentHighlightProvider)
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
                              eglot-hover-eldoc-function))))

  (add-to-list 'eglot-server-programs
              `(((js-mode :language-id "javascript")
                 (js-ts-mode :language-id "javascript")
                 (tsx-ts-mode :language-id "typescriptreact")
                 (typescript-ts-mode :language-id "typescript")
                 (typescript-mode :language-id "typescript"))
                 .
                ("typescript-language-server" "--stdio"
                :initializationOptions (
                  :maxTsServerMemory 8192
                  :preferences
                    (:includeInlayParameterNameHints "literals"
                      :includeInlayParameterNameHintsWhenArgumentMatchesName t
                      :includeInlayFunctionParameterTypeHints t
                      :includeInlayVariableTypeHints t
                      :includeInlayVariableTypeHintsWhenTypeMatchesName t
                      :includeInlayPropertyDeclarationTypeHints t
                      :includeInlayFunctionLikeReturnTypeHints t
                      :includeInlayEnumMemberValueHints t))))))

(use-package project
  :ensure nil
  :config
  (setq project-vc-extra-root-markers '(".git" "package.json" "Cargo.toml")))

(use-package treesit
  :ensure nil
  :config
  ;; List of file extensions and corresponding modes
  (setq treesit-language-source-alist
    '((bash "https://github.com/tree-sitter/tree-sitter-bash")
      (cmake "https://github.com/uyha/tree-sitter-cmake")
      (css "https://github.com/tree-sitter/tree-sitter-css")
      (elisp "https://github.com/Wilfred/tree-sitter-elisp")
      (go "https://github.com/tree-sitter/tree-sitter-go")
      (html "https://github.com/tree-sitter/tree-sitter-html")
      (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
      (json "https://github.com/tree-sitter/tree-sitter-json")
      (make "https://github.com/alemuller/tree-sitter-make")
      (markdown "https://github.com/ikatyang/tree-sitter-markdown")
      (python "https://github.com/tree-sitter/tree-sitter-python")
      (toml "https://github.com/tree-sitter/tree-sitter-toml")
      (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
      (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
      (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

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

(use-package treesit-fold
  ;; :config
  ;; (global-treesit-fold-indicators-mode 1)
)

;; Configure Tempel
(use-package tempel
  :init
  (setq completion-at-point-functions
              (cons #'tempel-complete
                    completion-at-point-functions))

  (global-tempel-abbrev-mode))

;; Comment and Uncommenting
(use-package evil-nerd-commenter)

;; Additional protocol extension for accessing files
(use-package tramp)

(use-package prog-mode
  :ensure nil
  :hook (prog-mode . which-function-mode))

(provide 'lsp-pkg-setup)
