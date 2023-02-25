;; User
(setq user-full-name "E. Almqvist"
      user-mail-address "elalmqvist@gmail.com")

;; Theme
(load-theme 'doom-tomorrow-day t)

;; Font size
(set-face-attribute 'default nil :height 140 :family "Fira Code")

;; Enable line numbers
(global-display-line-numbers-mode 1)

;; Indentaion
(setq
 indent-tabs-mode t
 tab-width 4
 )
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

;; TODO keywords etc
;; (setq hl-todo-keyword-faces
;;   '(("TODO"   . "#EB4034")
;;     ("FIXME"  . "#EB4034")
;;     ("DEBUG"  . "#3B5742")
;;     ("NOTE"   . "#32a852")
;;     ("BUG"    . "#FCBA03")
;;     ("STUB"   . "#4287F5")))
