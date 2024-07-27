;;; custom-functions.el -*- lexical-binding: t; -*-

(defun kitty-async-process ()
  "Launch a kitty terminal process in the current emacs directory"
  (interactive)
  (start-process "kitty" nil "setsid" "kitty" "-d" default-directory))

(provide 'custom-functions-pkg-setup)
