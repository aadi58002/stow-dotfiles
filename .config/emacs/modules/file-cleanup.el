(defvar backupdir (concat user-emacs-directory "file-backups/"))
(defvar lockdir (concat user-emacs-directory "file-locks/"))
(make-directory backupdir t)
(make-directory lockdir t)

(setq auto-save-list-file-prefix (concat backupdir ".auto-saves-")
      auto-save-file-name-transforms `((".*" ,backupdir t))
      lock-file-name-transforms `((".*" ,lockdir t))
      backup-directory-alist `(("." . ,backupdir))
      tramp-auto-save-directory backupdir
      tramp-backup-directory-alist `((".*" . ,backupdir)))

(provide 'file-cleanup)
