


(require 'package)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(setq package-enable-at-startup nil)
(package-initialize)

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

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

(require 'evil)
(evil-mode 1)

(require 'telephone-line-config)
(telephone-line-evil-config)

;;(require 'powerline)
;;(require 'powerline-evil)
;;(powerline-default-theme)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

(setq visible-bell t)
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t)
(column-number-mode t)
(setq tab-width 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 2)
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
