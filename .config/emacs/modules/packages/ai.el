;;; ai.el -*- lexical-binding: t; -*-

(use-package aider
  :config
  ;; For latest claude sonnet model
  (setq aider-args '("--model" "gemini" "--no-auto-accept-architect")) ;; add --no-auto-commits if you don't want it
  (aider-magit-setup-transients)) ;; add aider magit function to magit menu

(provide 'ai)
