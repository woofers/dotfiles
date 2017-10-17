
;; Load Package.el
(require 'package)

;; Load MELPA Repository
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; Disable Plug-Ins at Startup
(setq package-enable-at-startup nil)

;; Initialize Packages
(package-initialize)

;; Function to Load and Initialize Packages from Package.el
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t)

(use-package telephone-line
  :ensure t)

(use-package powerline
  :ensure t)

(use-package powerline-evil
  :ensure t)

(use-package magit
  :ensure t)

(use-package org
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(use-package helm
  :ensure t)

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

;; Enable Emulated VIM Mode
(evil-mode 1)

;; Enable Powerline in VIM Mode
(telephone-line-evil-config)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Disable Splash Screen and Startup Message
(setq inhibit-splash-screen t
	  inhibit-startup-message t
	  inhibit-startup-echo-area-message t)

;; Disable Menu and Toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Hide Scroll Bar
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

;; Disable Sounds
(setq visible-bell t)

;; No Warning for Large Files
(setq large-file-warning-threshold nil)

;; Allows Symlinks
(setq vc-follow-symlinks t)

(setq split-width-threshold nil)
(setq custom-safe-themes t)

;; Show Line Numbers
(column-number-mode t)

;; Set Tab Width
(setq tab-width 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 100)
 '(package-hidden-regexps (quote ("\\`0blayoutelm")))
 '(package-selected-packages
   (quote
	(helm evil-magit powerline-evil airline-themes evil-org telephone-line evil org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:weight bold :family "Meslo LG M Regular for Powerline")))))
(global-linum-mode t)
(global-hl-line-mode +1)
