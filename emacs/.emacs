
;;
;; .emacs
;; Main emacs Config File
;;
;;          TO-DO:
;;
;;          -Optimize Loading
;;          -Magit
;;          -Git Ignore
;;
;;          -Navigate by Tabs h l
;;          -DEL Removes Tabs
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

;; Install Packages on Initial Install
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

;; Org Packages
(load-file "~/.emacs.d/lisp/init-org.el")
(require 'init-org)

;; Helm
(load-file "~/.emacs.d/lisp/init-helm.el")
(require 'init-helm)

;; Powerline
(load-file "~/.emacs.d/lisp/init-powerline.el")
(require 'init-powerline)

(use-package magit
    :ensure t)

(use-package ranger
    :ensure t)

(use-package auto-complete
    :ensure t)

(use-package which-key
    :ensure t)

(use-package git-gutter-fringe
    :ensure t)

(use-package nlinum-relative
    :ensure t)

(use-package highlight
    :ensure t)

(use-package highlight-indent-guides
    :ensure t)

(use-package imenu-list
    :ensure t)

(use-package omnisharp
    :ensure t)

(use-package markdown-mode
    :ensure t)

(use-package wttrin
    :ensure t)

(use-package ispell
    :ensure t)

(use-package flyspell
    :ensure t)

(use-package flyspell-lazy
    :ensure t)

(use-package speck
    :ensure t)

;; Info
(setq user-full-name "Jaxson Van Doorn"
      user-mail-address "jaxson.vandoorn@gmail.com"
      calendar-latitude 48.6
      calendar-longitude -123.4
      calendar-location-name "Victoria, BC")

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/challenger-deep")
(load-theme 'challenger-deep t)

;; Enable Powerline in VIM Mode
;;(telephone-line-evil-config)

;; Ranger
(setq ranger-parent-depth 3)
(setq ranger-width-preview 0.5)
(setq ranger-dont-show-binary t)
(setq ranger-cleanup-eagerly t)
(ranger-override-dired-mode t)

;; Auto Complete Default Config
(ac-config-default)

;; Enable Which Key
(which-key-mode)

;; Enable Relative Line Numbers
(nlinum-relative-setup-evil)

;; Git Gutter
(setq git-gutter-fr:side 'right-fringe)

;; Show Tabs
(setq highlight-indent-guides-method 'character)

;; Weather
(setq wttrin-default-cities '("YYJ"))
(setq wttrin-default-accept-language '("Accept-Language" . "en-US"))

;; Spellcheck
(setq speck-engine 'Hunspell
      speck-hunspell-program (executable-find "hunspell")
      speck-hunspell-library-directory
      (if (eq system-type 'windows-nt)
          ""
        (expand-file-name "share/hunspell/"
                          (file-name-directory
                            (directory-file-name
                            (file-name-directory speck-hunspell-program)))))
      speck-hunspell-default-dictionary-name "en"
      speck-hunspell-dictionary-alist '(("en" . "en_US"))
      speck-hunspell-language-options '(("en" utf-8 nil nil))
      speck-hunspell-coding-system 'utf-8)
(speck-mode 1)


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

;; Better Compilation
(setq compilation-scroll-output t)

;; Newline at End of File
(setq require-final-newline t)

;; Disable Blinking of Window
(setq visible-bell nil
      ring-bell-function 'ignore)

;; Orange Carret
(set-cursor-color "#fdbf82")

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

;; Allows Symlink
(setq vc-follow-symlinks t)

;; Default Split is Vertical
(setq split-width-threshold nil)

;; Allow Custom Themes
(setq custom-safe-themes t)

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

(defun flyspell-emacs-popup-textual (event poss word)
  "A textual flyspell popup menu."
  (require 'popup)
  (let* ((corrects (if flyspell-sort-corrections
                       (sort (car (cdr (cdr poss))) 'string<)
                     (car (cdr (cdr poss)))))
         (cor-menu (if (consp corrects)
                       (mapcar (lambda (correct)
                                 (list correct correct))
                               corrects)
                     '()))
         (affix (car (cdr (cdr (cdr poss)))))
         show-affix-info
         (base-menu  (let ((save (if (and (consp affix) show-affix-info)
                                     (list
                                      (list (concat "Save affix: " (car affix))
                                            'save)
                                      '("Accept (session)" session)
                                      '("Accept (buffer)" buffer))
                                   '(("Save word" save)
                                     ("Accept (session)" session)
                                     ("Accept (buffer)" buffer)))))
                       (if (consp cor-menu)
                           (append cor-menu (cons "" save))
                         save)))
         (menu (mapcar
                (lambda (arg) (if (consp arg) (car arg) arg))
                base-menu)))
    (cadr (assoc (popup-menu* menu :scroll-bar t) base-menu))))


(defun clear-message()
  (interactive)
  (message nil))

(defun run-bash ()
      (interactive)
      (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
      (shell "*bash*")))

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (setenv "SHELL", "C:/Program Files/Git/bin/bash.exe")
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
;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<right>"))
;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))
;; (global-unset-key (kbd "<C-left>"))
;; (global-unset-key (kbd "<C-right>"))
;; (global-unset-key (kbd "<C-up>"))
;; (global-unset-key (kbd "<C-down>"))
;; (global-unset-key (kbd "<M-left>"))
;; (global-unset-key (kbd "<M-right>"))
;; (global-unset-key (kbd "<M-up>"))
;; (global-unset-key (kbd "<M-down>"))

;; Backspace in Tabs like Increments
(global-set-key [backspace] 'backspace-whitespace-to-tab-stop)

;; Save on Ctrl S
(global-set-key (kbd "C-s") 'save-buffer)

;; Terminal
(global-set-key (kbd "C-c t") 'run-bash)

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

;; Spellcheck
(add-hook 'find-file-hook 'speck-mode)

;; Relative Line Numbers
(add-hook 'find-file-hook 'nlinum-relative-mode)

;; Git Gutter
(add-hook 'find-file-hook 'git-gutter-mode)

;; Highlight
(add-hook 'prog-mode-hook '(lambda ()
    (highlight-regexp "%[[:alpha:]]\\|\\\\[[:alpha:]]" font-lock-keyword-face
)))

;; Show Tabs
(add-hook 'find-file-hook 'highlight-indent-guides-mode)

;; C Sharp
(add-hook 'csharp-mode-hook 'omnisharp-mode)

;; Assembly Mode
(defun asm-hook ()
  (when (string= (file-name-extension buffer-file-name) "pep")
    (asm-mode))
)
(add-hook 'find-file-hook 'asm-hook)
