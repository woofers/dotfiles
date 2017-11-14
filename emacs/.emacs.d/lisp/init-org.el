
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

(use-package ox-md
    :ensure t)

(use-package ox-twbs
    :ensure t)

(use-package ox-beamer
    :ensure t)

;; Agenda
(setq org-agenda-files '("D:/Documents/JVD Docs/Documents/School/UVIC/2017"))
(setq org-agenda-window-setup (quote current-window))

(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))

;; Only Allow Item to Marked a Done
;; When all Children are Done
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

(defun org-mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(org-add-link-type
 "image-url"
 (lambda (path)
   (let ((img (expand-file-name
           (concat (md5 path) "." (file-name-extension path))
           temporary-file-directory)))
     (if (file-exists-p img)
     (find-file img)
       (url-copy-file path img)
       (find-file img)))))


;; Keymaps for Agenda and Links
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Enable Bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'init-org)
