
;;
;; .emacs
;; Main emacs Config File
;;
;;          TO-DO:
;;          -Spell Check
;;          -Navigate by Tabs h l
;;          -Sort out Org Mode Tabs
;;          -DEL Removes Tabs
;;
;;          -Add Ctrl-r (Tags)
;;          -Optimize Loading
;;          -Magit
;;          -Git Ignore
;;

;;
;; Plug-Ins
;;


;; Load Package.el
(require 'package)

;; Load MELPA Repository
(when (>= emacs-major-version 24)
    (require 'package)
    (add-to-list
        'package-archives
        '("melpa" . "http://melpa.milkbox.net/packages/")
        t)
    )

;; Disable Plug-Ins at Startup
(setq package-enable-at-startup nil)

;; Initialize Packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

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

(use-package magit
    :ensure t)

(use-package neotree
    :ensure t)

(use-package auto-complete
    :ensure t)

(use-package helm
    :ensure t)

(use-package which-key
    :ensure t)

(use-package nlinum-relative
    :ensure t)

(use-package highlight-indent-guides
    :ensure t)

(use-package org
    :ensure t)

(use-package org-plus-contrib
    :ensure t)

(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Vancouver")))

(use-package ispell
    :ensure t)

(use-package flyspell
    :ensure t)

(use-package flyspell-lazy
    :ensure t)

(use-package speck
    :ensure t)

;; (use-package highlight-symbol
;;     :ensure t)
;;

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

;; Enable Powerline in VIM Mode
(telephone-line-evil-config)

;; Neotree Toggle
(local-unset-key (kbd "C-n"))
(global-unset-key (kbd "C-n"))
(global-set-key (kbd "C-n") 'neotree-toggle)

;; Auto Complete Default Config
(ac-config-default)

;; Helm
(helm-mode 1)
(setq helm-buffers-fuzzy-matching t)
(setq helm-autoresize-mode t)
(setq helm-buffer-max-length 40)
(define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
(define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(set-face-attribute 'helm-source-header nil :height 2)
(setq helm-split-window-in-side-p t)

;; Enable Which Key
(which-key-mode)

;; Enable Relative Line Numbers
(nlinum-relative-setup-evil)

;; Show Tabs
(setq highlight-indent-guides-method 'character)

;; Org Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))
(setq org-todo-keywords
    '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

;; Spellcheck
(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))
(setq flyspell-issue-message-flag nil)
;; (flyspell-lazy-mode 1)
;; (flyspell-mode 1)

;; Find Next Occurance
;; (global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)

;;
;; Behavior
;;

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

;; Nicer Scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Status Bar Info
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Allow Y/N
(fset 'yes-or-no-p 'y-or-n-p)

;; Newline at End of File
(setq require-final-newline t)

;; Disable Blinking of Window
(setq visible-bell nil
      ring-bell-function 'ignore)

;; Wrapped Lines
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

;; Width Limit
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(setq-default fill-column 80)

;; No Warning for Large Files
(setq large-file-warning-threshold nil)

;; Allows Symlinks
(setq vc-follow-symlinks t)

;; Default Split is Vertical
(setq split-width-threshold nil)

;; Allow Custom Themes
(setq custom-safe-themes t)

(setq shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe")

;; Cleaner Auto-Save and Auto-Backup
(defvar backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p backup-directory))
        (make-directory backup-directory t))
(setq backup-directory-alist `(("." . ,backup-directory)))
(setq make-backup-files t               ; Backup on Save
      backup-by-copying t               ; Do not Clutter Symlinks
      version-control t                 ; Add Version Number
      delete-old-versions t             ; Delete Old Backup File
      delete-by-moving-to-trash t       ; Permanat Delete
      kept-old-versions 3               ; Oldest Versions
      kept-new-versions 3               ; Newest Versions
      auto-save-default t               ; Auto-Save on Buffer Switch
      auto-save-timeout 60              ; Number of Second Between Auto-Saves
      auto-save-interval 200            ; Number of Characters
                                        ; Typed Between Auto-Save
)

;; Set Title Bar
(setq frame-title-format "%b - emacs")

;; Show Relative Line Numbers
;; (global-linum-mode t)
(setq nlinum-relative-redisplay-delay 0.018)
(setq nlinum-relative-offset 0)

;; Highlight Current Line
(global-hl-line-mode 1)

;; Disable Display Table
(set-window-display-table nil nil)

;; Use Spaces
(defvar tab-spaces 4 "Spaces per tab")
(setq-default tab-width tab-spaces)
(setq tab-width tab-spaces)
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)

;; (For Tabs)
;; (setq indent-line-function 'insert-tab)
;; (setq tab-stop-list (number-sequence 4 200 4))

;; Set Font
(set-frame-font "Meslo LG M Regular for Powerline 12" nil t)

;;
;; Functions
;;

;; Backspace Function
(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) tab-spaces))
          (p (point)))
      (when (= movement 0) (setq movement tab-spaces))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (- p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char (- (match-end 1) (match-beginning 1)))
          (call-interactively 'backward-delete-char))))))

;; Convert to Spaces on Open
(defvar untabify-this-buffer)
 (defun untabify-all()
   "Untabify the current buffer, unless `untabify-this-buffer' is nil."
   (and untabify-this-buffer (untabify (point-min) (point-max))))
 (define-minor-mode untabify-mode
   "Untabify buffer on save." nil " untab" nil
   (make-variable-buffer-local 'untabify-this-buffer)
   (setq untabify-this-buffer (not (derived-mode-p 'makefile-mode)))
   (add-hook 'before-save-hook #'untabify-all))
   (add-hook 'prog-mode-hook 'untabify-mode)

(defun clear-message()
  (interactive)
  (message nil))

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

;; Maximize Window
(defun maximize-frame()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))

;;
;; Mappings
;;

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

;; Backspace in Tabs like Increments
(global-set-key [backspace] 'backspace-whitespace-to-tab-stop)

;; Save on Ctrl S
(global-set-key (kbd "C-s") 'save-buffer)

;; Terminal
(global-set-key (kbd "C-c t") 'visit-term-buffer)

;;
;; Hooks
;;

;; Maximize Window
(add-hook 'window-setup-hook 'maximize-frame t)

;; Trim Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Camel Case
(add-hook 'prog-mode-hook 'subword-mode)

;; Line Width
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Relative Line Numbers
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(add-hook 'org-mode-hook 'nlinum-relative-mode)

;; Show Tabs
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'org-mode-hook 'highlight-indent-guides-mode)

;; Better Mini-Buffer Help
;; (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
