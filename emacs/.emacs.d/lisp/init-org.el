
;;
;; init-org.el
;; Config File for Org Mode
;;

;; Install Org Related Plug-Ins
(use-package org
    :ensure t)

(use-package org-plus-contrib
    :ensure t)

(use-package org-bullets
    :ensure t)

;; Agenda
(setq org-agenda-files '("D:/Documents/JVD Docs/Documents/School/UVIC/2017"))
(setq org-agenda-window-setup (quote current-window))

(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
(setq org-enforce-todo-dependencies t)

;; (setq org-ellipsis " ⤵")
(setq org-ellipsis ".")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-hide-leading-stars t)
(setq org-src-window-setup 'current-window)

(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

;; Org Keys Words
(setq org-todo-keywords
      '((sequence "STUDY" "TODO" "IN-PROGRESS" "NEAR-COMPLETION"
                  "WAITING" "REVIEW" "|" "DONE" "CANCELED")))


;; Keymaps for Agenda and Links
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Enable Bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'init-org)
