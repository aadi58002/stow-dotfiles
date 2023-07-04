;; Credits :- Sorry i don't remember where i got this snippets of code
;;; autoload/+denote.el -*- lexical-binding: t; -*-

;;
;;; Helpers



;;;###autoload
(defun +denote/add-todo-keyword ()
  "Add the todo keyword to the new captured note if it is under the Todo Sub directory"
  (let* ((file denote-last-path))
    (if (string= (file-name-directory file) (file-name-as-directory denote-todo-directory))
        (let* ((file-type (denote-filetype-heuristics file))
               (title (denote-retrieve-title-value file file-type))
               (keywords (denote-retrieve-keywords-value file file-type)))
          (denote-rename-file file title (append '("todo") keywords))))))

(defun +denote/add--todo-or-archive-keyword (file file-type)
  "Replace todo with archive keyword (or vice versa) in FILE, given FILE-TYPE.
  See `my-denote-move-from-todo-to-archive'."
  (let* ((keywords (denote-retrieve-keywords-value file file-type)))
    (cond
     ((member "todo" keywords)
      (setq keywords (delete "todo" keywords)
            keywords (append '("archive") keywords)))
     ((member "archive" keywords)
      (setq keywords (delete "archive" keywords)
            keywords (append '("todo") keywords)))
     (t keywords))))

;;;###autoload
(defun +denote/move-from-todo-to-archive ()
  (interactive)
  ;; Like the above example, but we pass values directly to
  ;; `denote-rename-file' instead of doing it interactively.  More
  ;; precisely, we re-use the existing title and keywords, while
  ;; adding "todo" to the list of keywords.
  (let* ((file (denote--rename-dired-file-or-prompt))
         (file-type (denote-filetype-heuristics file)))
    (denote-rename-file
     file
     (denote-retrieve-title-value file file-type)
     (+denote/add--todo-or-archive-keyword file file-type)))
  (let* ((file (denote--rename-dired-file-or-prompt))
         (archive-target (string-replace "/Todo/" "/Archived/" file)))
    (rename-file file archive-target)
    (denote-update-dired-buffers)))


(defvar +denote/silo-directories
  "List of file paths pointing to my Denote silos.
   This is a list of strings.")

(defvar +denote/commands-for-silos
  "List of Denote commands to call after selecting a silo.
  This is a list of symbols that specify the note-creating
  interactive functions that Denote provides.")

;;;###autoload
(defun +denote/pick-silo-then-command (silo command)
  "Select SILO and run Denote COMMAND in it.
  SILO is a file path from `my-denote-silo-directories', while
  COMMAND is one among `+denote/commands-for-silos'."
  (interactive
   (list (completing-read "Select a silo: " +denote/silo-directories nil t)
         (intern (completing-read
                  "Run command in silo: "
                  +denote/commands-for-silos nil t))))
  (let ((denote-user-enforced-denote-directory silo))
    (call-interactively command)))


;;;###autoload
(defun +denote/pick-silo-open (silo)
  "Select SILO and run Denote COMMAND in it.
  SILO is a file path from `my-denote-silo-directories', while
  COMMAND is one among `+denote/commands-for-silos'."
  (interactive
   (list (completing-read "Select a silo: " +denote/silo-directories nil t)))
  (let ((denote-user-enforced-denote-directory silo))
    (call-interactively #'denote-open-or-create)))

;;;###autoload
(defun +denote/subdirectory-with-template ()
  "Create note while also prompting for a template and subdirectory.

This is equivalent to calling `denote' when `denote-prompts' is
set to '(template subdirectory title keywords)."
  (declare (interactive-only t))
  (interactive)
  (let ((denote-prompts '(template subdirectory title keywords)))
    (call-interactively #'denote)))
