;; User
(setq user-full-name "E. Almqvist"
      user-mail-address "elalmqvist@gmail.com")

;; Theme
(load-theme 'doom-tomorrow-night t)

;; Font size
(set-face-attribute 'default nil :height 140 :family "Fira Code")

;; Enable line numbers
(global-display-line-numbers-mode 1)

;; Indentation
(setq
	indent-tabs-mode t
	tab-width 4
)
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
