;;; music.el -*- lexical-binding: t; -*-

(use-package emms
  :config
  (emms-all)
  (setq emms-source-file-default-directory "~/Music/"
        emms-info-functions '(emms-info-native)
        emms-player-list '(emms-player-mpv)
        emms-mode-line-mode t
        emms-playlist-buffer-name "*Music*"
        emms-playing-time-mode t
        emms-info-asynchronously t
        emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (emms-toggle-repeat-track)
  (emms-add-directory-tree "~/Music/"))

(provide 'music)
