;;; better-dired.el -*- lexical-binding: t; -*-

(setq dired-recursive-copies 'always
      dired-recursive-deletes 'always
      delete-by-moving-to-trash t
      dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"
      dired-dwim-target t
      dired-create-destination-dirs 'ask)

(provide 'better-dired)
