
;;
;; init-helm.el
;; Config File for Helm
;;

;; Install Org Related Plug-Ins
(use-package helm
    :ensure t)

;; Helm
(helm-mode 1)
(setq helm-buffers-fuzzy-matching t)
(setq helm-autoresize-mode t)
(setq helm-buffer-max-length 40)
(setq helm-split-window-in-side-p t)

;; Keymaps
(define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
(define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-recentf)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-r") 'imenu)
(global-set-key (kbd "C-x C-d") 'ranger)

(provide 'init-helm)
