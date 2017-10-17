
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

;; Custom File
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(use-package load-dir
  :ensure t)

;; Evil Packages
(load-file "~/.emacs.d/lisp/init-evil.el")
(require 'init-evil)

(use-package telephone-line
  :ensure t)

(use-package powerline
  :ensure t)

(use-package powerline-evil
  :ensure t)

(use-package magit
  :ensure t)

(use-package neotree
  :ensure t)

(use-package org
  :ensure t)

(use-package org-plus-contrib
  :ensure t)

(use-package helm
  :ensure t)

(use-package which-key
  :ensure t)

(use-package highlight-symbol
  :ensure t)

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

;; Enable Powerline in VIM Mode
(telephone-line-evil-config)

;; Org Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Neotree Toggle
(global-set-key (kbd "M-n") 'neotree-toggle)

;; Enable Which Key
(which-key-mode)

;; Highlight
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

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

;; Show Matching Pairs of Parentheses
(show-paren-mode 1)

;; Wrapped Lines?
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

;; Default Split is Vertical
(setq split-width-threshold nil)

;; Allow Custom Themes
(setq custom-safe-themes t)

;; Show Line Numbers
(column-number-mode t)
(global-linum-mode t)

;; Set Tab Width
(setq tab-width 4)

;; Set Font
(set-frame-font "Meslo LG M Regular for Powerline 12" nil t)

;; Unbind Arrow Keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

(local-set-key
 (kbd "C-j")
nil)