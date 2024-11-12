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

;; Ref: https://www.reddit.com/r/emacs/comments/x8u0bf/save_all_buffers_in_a_projectel_project_context
;;;###autoload
(defun +project-save-all-buffers (&optional arg proj)
  "Save all file-visiting buffers in PROJ, without asking if ARG is non-nil.

Falls back to `project-current' if PROJ is not specified."
  (let* ((proj (or proj (project-current)))
         (buffers (project-buffers (project-current))))

    (save-some-buffers
     arg (lambda ()
           "Return non-nil when the current buffer should be considered."
           (let ((buffer (or (buffer-base-buffer (current-buffer))
                             (current-buffer))))
             (and (member (current-buffer) buffers)  ; Ignore non-project buffers
                  (buffer-file-name buffer)          ; Ignore all non-file-visiting buffers .
                  (buffer-modified-p buffer)         ; Ignore all unchanged buffers. Maybe redundant with save-some-buffers.
                  (file-writable-p (buffer-file-name buffer))))))))
