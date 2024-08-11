;;; notes.el -*- lexical-binding: t; -*-

(use-package denote
  :ensure (denote :host github :repo "protesilaos/denote")
  :config
  ;; Load silo extras as well
  (require 'denote-silo-extras)
  (setq denote-excluded-directories-regexp ".*[archived|addons].*"
        denote-known-keywords ()
        denote-save-buffers t
        denote-date-prompt-use-org-read-date t
        denote-directory "~/Documents/denote"
        denote-notes-directory "~/Documents/denote/notes"
        denote-tasks-directory "~/Documents/denote/tasks"
        denote-pastime-directory "~/Documents/denote/pastime"
        denote-silo-extras-directories (list denote-notes-directory denote-pastime-directory denote-tasks-directory)))

(use-package consult-denote
  :after (denote consult)
  :config
  (consult-denote-mode 1))

(use-package org
  :ensure nil
  :config
  (setq
    ;; Edit settings
    org-pretty-entities nil

    org-auto-align-tags nil
    org-tags-column 0
    org-return-follows-link t
    org-catch-invisible-edits 'show-and-error
    org-special-ctrl-a/e t
    org-insert-heading-respect-content t

    org-link-file-path-type 'relative

    org-enforce-todo-checkbox-dependencies t
    org-enforce-todo-dependencies t

    org-catch-invisible-edits 'show-and-error

    ;; Org styling, hide markup etc.
    org-hide-emphasis-markers t
    org-pretty-entities t

    ;; Agenda styling
    org-agenda-tags-column 0
    org-agenda-block-separator ?─
    org-agenda-time-grid
    '((daily today require-timed)
      (800 1000 1200 1400 1600 1800 2000)
      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
    org-agenda-current-time-string
    "◀── now ─────────────────────────────────────────────────")

  ;; Ellipsis styling
  (setq org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil))

(use-package org-capture
  :ensure nil
  :after denote
  :config

  (defun +denote-toggle-task-to-archive ()
    "Replace task with archive keyword (or vice versa) in FILE,
  See `+denote-move-from-task-to-archive'."
    (declare (interactive-only t))
    (interactive)
    (let* ((file buffer-file-name)
           (keywords (denote-extract-keywords-from-path file)))

      (denote-rename-file-keywords file )))

  (with-eval-after-load 'org-capture
      (setq org-capture-templates
            '(
              ("t" "task" plain
                (file denote-last-path)
                (function
                  (lambda ()
                    (let ((denote-directory (file-name-as-directory denote-todo-directory)))
                      (denote-org-capture))))
                :no-save t
                :immediate-finish nil
                :kill-buffer t
                :jump-to-captured t))
            )))

(provide 'notes-pkg-setup)
