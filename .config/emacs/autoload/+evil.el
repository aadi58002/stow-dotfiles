;;; Credits for code goes to https://github.com/doomemacs/doomemacs/blob/07fca786154551f90f36535bfb21f8ca4abd5027/modules/editor/evil/autoload/evil.el#LL17C1-L31C25
;;; autoload/+org.el -*- lexical-binding: t; -*-

;;
;;; Helpers


;;;###autoload
(defun +evil/shift-right ()
  "vnoremap < <gv"
  (interactive)
  (call-interactively #'evil-shift-right)
  (evil-normal-state)
  (evil-visual-restore))

;;;###autoload
(defun +evil/shift-left ()
  "vnoremap > >gv"
  (interactive)
  (call-interactively #'evil-shift-left)
  (evil-normal-state)
  (evil-visual-restore))
