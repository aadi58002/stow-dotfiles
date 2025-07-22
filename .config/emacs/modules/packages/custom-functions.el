;;; custom-functions.el -*- lexical-binding: t; -*-

;;;###autoload
(defun terminal-async-process ()
  "Launch a terminal process in the current emacs directory"
  (interactive)
  (start-process "konsole" nil "setsid" "konsole" "--workdir" default-directory))

;;;;;###autoload
;;(defun +evil-shift-right ()
;;  (interactive)
;;  (evil-shift-right evil-visual-beginning evil-visual-end)
;;  (evil-normal-state)
;;  (evil-visual-restore))
;;
;;;;;###autoload
;;(defun +evil-shift-left ()
;;  (interactive)
;;  (evil-shift-left evil-visual-beginning evil-visual-end)
;;  (evil-normal-state)
;;  (evil-visual-restore))

;;;###autoload
(defun random-element-of-list (items)
  (let* ((size (length items))
         (index (random size)))
    (nth index items)))
