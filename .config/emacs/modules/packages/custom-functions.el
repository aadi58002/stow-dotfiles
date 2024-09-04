;;; custom-functions.el -*- lexical-binding: t; -*-

;;;###autoload
(defun kitty-async-process ()
  "Launch a kitty terminal process in the current emacs directory"
  (interactive)
  (start-process "kitty" nil "setsid" "kitty" "-d" default-directory))

;;;###autoload
(defun +evil-shift-right ()
  (interactive)
  (evil-shift-right evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

;;;###autoload
(defun +evil-shift-left ()
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

;; (defun random-element-of-list (items)
;;   (let* ((size (length items))
;;          (index (random size)))
;;     (nth index items)))

;;;###autoload
(defun +denote/mark-as-archive-task ()
  "Add archived keyword"
  (interactive)
  (let* ((file (denote--rename-dired-file-or-current-file-or-prompt))
         (file-type (denote-filetype-heuristics file)))
    (denote-rename-file
     file
     (denote-retrieve-title-value file file-type)
     (denote-keywords--combine :add '("archived") (denote-extract-keywords-from-path file)))))
