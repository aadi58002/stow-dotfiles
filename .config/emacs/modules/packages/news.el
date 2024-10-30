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
          ("https://www.reddit.com/r/HonkaiStarRail_leaks.rss" reddit hsr)

          ;;youtube
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw" youtube medium ltt hardware tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCdBK94H6oZT2Q7l0-b0xmMg" youtube short shortCircuit news tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UC0vBXGSyV14uvJ4hECDOl0Q" youtube medium techQuickie news tech)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCkWQ0gDrqOCarmUKmppD7GQ" youtube medium jayzTwoCents hardware tech)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA" youtube medium brodie linux tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw" youtube medium linuxExperiment linux tech)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCbRP3c757lWg9M-U7TyEkXA" youtube medium theo webdev coding tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ" youtube medium primeagen coding tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg" youtube medium lowLevelLearning coding tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UC05XpvbHZUQOfA6xk4dlmcw" youtube medium djWare linux tech)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g" youtube long prot emacs coding tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ" youtube long systemCrafters emacs coding tech)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCrqM0Ym_NbK1fqeQG2VIohg" youtube long tsoding coding tech)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA" youtube short fireship coding)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCiSIL42pQRpc-8JNiYDFyzQ" youtube medium chridBiscardi coding)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCSp-OaMpsO8K0KkOqyBl7_w" youtube medium letsGetRusty coding)

          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA" youtube medium veritasium science)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q" youtube short kurzgesagt science)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCY1kMZp36IQSyNx_9h4mpCg" youtube medium markRober science))))

(use-package elfeed-tube-mpv
  :bind (:map elfeed-show-mode-map
              ("C-c C-f" . elfeed-tube-mpv-follow-mode)
              ("C-c C-w" . elfeed-tube-mpv-where)))

(use-package elfeed-tube
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

(provide 'news-pkg-setup)
