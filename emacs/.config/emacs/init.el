(setq user-full-name "E. Almqvist"
      user-mail-address "elalmqvist@gmail.com")

;; Evil mode (vim binds)
(require 'evil)
(evil-mode t)

(setq inhibit-startup-message t
      visible-bell nil) ;; Don't the bell thing

;; Remove ugly bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable line numbers
(global-display-line-numbers-mode 1)

;; Indentation
;; (setq indent-tabs-mode t
;;       tab-width 8)

;; Theme
;; (load-theme 'deeper-blue t)
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :height 140)


;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-mode evil)))
    (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
