;; Evil mode (vim binds)
(require 'evil)
(evil-mode t)

;; Projectile (Project management)
(projectile-mode +1)
;; Recommended keymap prefix on macOS
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Treemacs
(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))
(global-set-key (kbd "M-d") 'treemacs) ;; Alt + d to open treemacs


;; Startup stuff
(setq inhibit-startup-message nil
      visible-bell nil) ;; Don't the bell thing

;; Remove ugly bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable backup files etc.
(setq make-backup-files nil)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" default))
 '(elcord-display-buffer-details nil)
 '(elcord-display-elapsed t)
 '(elcord-editor-icon "emacs_material_icon")
 '(elcord-idle-message "Thinking...")
 '(elcord-idle-timer 300)
 '(elcord-quiet t)
 '(elcord-use-major-mode-as-main-icon nil)
 '(evil-undo-system 'undo-redo)
 '(lsp-rust-server 'rust-analyzer)
 '(package-selected-packages
   '(aggressive-indent lsp-ui company flycheck scss-mode yaml-mode ligature evil-smartparens smartparens web-mode sublimity typescript-mode glsl-mode format-all hl-todo elcord evil-tabs evil-commentary format-all auto-complete editorconfig haskell-mode counsel ivy go-mode rust-mode use-package treemacs-evil treemacs projectile doom-themes lsp-mode evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; LSP
(require 'use-package)
(use-package lsp-mode
  :hook ((c-mode          ; clangd
          c++-mode        ; clangd
          c-or-c++-mode   ; clangd
          java-mode       ; eclipse-jdtls
          js-mode         ; ts-ls (tsserver wrapper)
          js-jsx-mode     ; ts-ls (tsserver wrapper)
          typescript-mode ; ts-ls (tsserver wrapper)
          python-mode     ; pyright
          web-mode        ; ts-ls/HTML/CSS
          haskell-mode    ; haskell-language-server
	  lisp-mode       ;
	  rust-mode       ;
	  go-mode         ;
          ) . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-idle-delay 0.5))

;; Ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq ivy-use-selectable-prompt t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; Editorconfig
(editorconfig-mode 1)

;; Autocomplete
(ac-config-default)

;; Evil Commentary (comment thing)
(evil-commentary-mode)

;; HL TODO FIXME DEBUG STUB NOTE BUG
(global-hl-todo-mode 1)

;; Formatter (format-all)
(global-set-key (kbd "M-g") 'format-all-buffer)
(add-hook 'prog-mode-hook #'format-all-ensure-formatter)

;; Elcord
(elcord-mode)

;; Loading config stuff
(load "$HOME/.config/emacs/config.el")

;; Lang stuff

;; Typescript / webmode stuff
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
	 ("\\.jsx\\'" .  web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.html\\'" . web-mode))
  :commands web-mode)

(global-hl-line-mode 1)
(save-place-mode 1)
(setq use-dialog-box nil)

(global-auto-revert-mode 1)

;; LSP ui
(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;; Automatic shit
(global-aggressive-indent-mode -1)
(electric-pair-mode t)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
