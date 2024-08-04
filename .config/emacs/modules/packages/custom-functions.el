;;; custom-functions.el -*- lexical-binding: t; -*-

(defun kitty-async-process ()
  "Launch a kitty terminal process in the current emacs directory"
  (interactive)
  (start-process "kitty" nil "setsid" "kitty" "-d" default-directory))

(defun +evil-shift-right ()
  (interactive)
  (evil-shift-right evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(defun +evil-shift-left ()
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

;; (defun random-element-of-list (items)
;;   (let* ((size (length items))
;;          (index (random size)))
;;     (nth index items)))

(provide 'custom-functions-pkg-setup)
