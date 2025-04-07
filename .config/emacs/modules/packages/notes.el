;;; notes.el -*- lexical-binding: t; -*-


(use-package denote
  :ensure (denote :host github :repo "protesilaos/denote")
  :demand t
  :config
  (setq denote-excluded-directories-regexp ".*(archived|addons).*"
        denote-rename-buffer-format "%b%t [%k]"
        denote-rename-confirmations '()
        denote-known-keywords ()
        denote-save-buffers t
        denote-date-prompt-use-org-read-date t

        denote-directory "~/Documents/denote"
        denote-notes-directory "~/Documents/denote/notes"
        denote-tasks-directory "~/Documents/denote/tasks"
        denote-pastime-directory "~/Documents/denote/pastime"
        denote-silo-directories (list denote-notes-directory denote-pastime-directory denote-tasks-directory))

  (denote-rename-buffer-mode +1)
  ;; Org config
  (setq
      org-agenda-files (list denote-tasks-directory)

      org-src-preserve-indentation t
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
      org-ellipsis "…"

      ;; Agenda styling
      org-agenda-tags-column 0
      org-agenda-block-separator ?─
      org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "◀── now ─────────────────────────────────────────────────"))

(use-package denote-silo
  :ensure (denote-silo :host github :repo "protesilaos/denote-silo")
  :demand t)

(use-package consult-denote
  :after (denote consult)
  :config
  (setq consult-denote-grep-command #'consult-ripgrep
        consult-denote-find-command #'consult-fd)
  (consult-denote-mode 1))

(use-package org-capture
  :ensure nil
  :after denote
  :config
  (with-eval-after-load 'org-capture
      (setq org-capture-templates
            '(
              ("t" "task" plain
                (file denote-last-path)
                (function
                  (lambda ()
                    (let ((denote-directory (file-name-as-directory denote-tasks-directory)))
                      (denote-org-capture))))
                :no-save t
                :immediate-finish nil
                :kill-buffer t
                :jump-to-captured t)
              ("n" "note" plain
                (file denote-last-path)
                (function
                  (lambda ()
                    (let ((denote-directory (file-name-as-directory denote-notes-directory)))
                      (denote-org-capture))))
                :no-save t
                :immediate-finish nil
                :kill-buffer t
                :jump-to-captured t)
              )
            )))

(provide 'notes-pkg-setup)
