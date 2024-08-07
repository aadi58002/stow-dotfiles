;;; ui.el -*- lexical-binding: t; -*-

(use-package fontaine
  :config
  (setq fontaine-presets
        '((regular
           :default-height 90)
          (medium
           :default-weight semilight
           :default-height 140)
          (large
           :default-weight semilight
           :default-height 180
           :bold-weight extrabold)
          (t ; our shared fallback properties
           :default-family "Noto Sans Mono"
           :default-weight normal)))
  (fontaine-set-preset 'regular))

(use-package helpful)

(use-package ef-themes)

(defun swap (LIST el1 el2)
  "in LIST swap indices EL1 and EL2 in place"
  (let ((tmp (elt LIST el1)))
    (setf (elt LIST el1) (elt LIST el2))
    (setf (elt LIST el2) tmp)))


(defun shuffle (LIST)
  "Shuffle the elements in LIST.
shuffling is done in place."
  (loop for i in (reverse (number-sequence 1 (1- (length LIST))))
        do (let ((j (random (+ i 1))))
             (swap LIST i j)))
  LIST)

(use-package theme-buffet
  :after (ef-themes)  ; add your favorite themes here
  :init
  ;; variable below needs to be set when you just want to use the timers mins/hours
  (setq theme-buffet-time-offset 5
        theme-buffet-end-user
          '(:night     (ef-duo-dark)
            :morning   (ef-bio ef-deuteranopia-dark)
            :afternoon (ef-winter ef-night)
            :evening   (ef-bio ef-duo-dark))
        theme-buffet-menu 'end-user) ; changing default value from built-in to modus-ef
  :config

  (theme-buffet-end-user)
  (theme-buffet-a-la-carte)
  (theme-buffet-timer-mins 20))

(provide 'ui-pkg-setup)
