(require 'package)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)
(custom-set-variables
 '(blink-cursor-delay 2)
 '(package-selected-packages
   (quote
    (evil-magit powerline-evil airline-themes evil-org telephone-line evil org))))
(custom-set-faces
 '(bold ((t (:weight bold :family "Meslo LG M Regular for Powerline")))))
(global-linum-mode t)
(global-hl-line-mode +1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

(require 'evil)
(evil-mode 1)

(require 'telephone-line-config)
(telephone-line-evil-config)
