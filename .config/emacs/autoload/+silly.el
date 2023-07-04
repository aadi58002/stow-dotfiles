;; Credits :- Sorry i don't remember where i got this snippets of code
;;; autoload/+silly.el -*- lexical-binding: t; -*-

;;
;;; Helpers


;;;###autoload
(defun Competitive-coding-output-input-toggle ()
  ;; Open side buffer to show inputf.in and outputf.in files as input and output of code file with the `SPC m z` Keybinding in rust-mode
  (interactive)
  (delete-other-windows)
  (kill-matching-buffers "*.in")
  (evil-window-vsplit)
  (find-file (expand-file-name "inputf.in" default-directory))
  (evil-window-split)
  (find-file (expand-file-name "outputf.in" default-directory))
  (other-window 1)
  (enlarge-window-horizontally 40))

;;;###autoload
(defun rust-reset()
  ;;Delete the entire buffer and expand a default template defined in `./templates` with the `SPC m r` Keybinding in rust-mode
  (interactive)
  (widen)
  (erase-buffer)
  (tempel-insert 'cp))


;;;###autoload
(defun code-input-refresh()
  ;; Places the clipboard content in the inputf.in file with the `SPC m i` Keybinding in rust-mode
  (interactive)
  (write-region (current-kill 0) nil (concat default-directory "inputf.in") nil)
  (Competitive-coding-output-input-toggle))


;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun copy-current-file (new-name)
  "Copy current file to a NEW-NAME."
  (interactive (list
                (read-string "New name: " (current-kill 0) nil (current-kill 0))))
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (copy-file filename (concat (replace-regexp-in-string " " "" (capitalize (replace-regexp-in-string "[^[:word:]_]" " " new-name))) ".rs") 1)))))


;;;###autoload
(defun kitty-async-process ()
  "Launch a kitty terminal process in the current emacs directory"
  (interactive)
  (start-process "kitty" nil "setsid" "kitty" "-d" default-directory))
