(load-all-in-directory "/usr/local/share/emacs/site-lisp/mu4e")
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(setq mu4e-maildir (expand-file-name "~/mail"))

(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Trash"     . ?t)))

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

(setq
 user-mail-address "woofers1tt@gmail.com"
 user-full-name  "Jaxson Van Doorn")

(setq mu4e-sent-messages-behavior 'delete)

(setq mu4e-get-mail-command "offlineimap")

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(provide 'init-mu4e)
