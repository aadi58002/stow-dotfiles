;;; news.el -*- lexical-binding: t; -*-

(use-package elfeed
  :config
  (setq elfeed-use-curl t
        elfeed-curl-max-connections 10
        elfeed-db-directory (concat user-emacs-directory "elfeed/")
        elfeed-enclosure-default-dir (concat user-emacs-directory "elfeed-enclosure/")
        elfeed-sort-order 'descending
        elfeed-search-title-max-width 100
        elfeed-search-title-min-width 30
        elfeed-search-trailing-width 25
        elfeed-show-truncate-long-urls t
        elfeed-show-unique-buffers t
        elfeed-search-date-format '("%F %R" 16 :left))

  (setq elfeed-feeds
        '(("https://protesilaos.com/codelog.xml" blog emacs)
          ("https://www.reddit.com/r/emacs.rss" reddit emacs)
          ("https://www.reddit.com/r/neovim.rss" reddit neovim)
          ("https://www.reddit.com/r/linux.rss" reddit linux)
          ("https://www.reddit.com/r/HonkaiStarRail_leaks.rss" reddit hsr))))

(provide 'news-pkg-setup)
