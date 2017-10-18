
;; Install Evil Related Plug-Ins
(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

  (use-package evil-jumper
  :ensure t
  :config
  (global-evil-jumper-mode))

  (use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode))

  (use-package evil-tabs
  :ensure t
  :config
  (global-evil-tabs-mode t))
  
  (use-package evil-indent-textobject
  :ensure t)
)

;; Enable Emulated VIM Mode
(evil-mode 1)
(evil-add-hjkl-bindings occur-mode-map 'emacs
  (kbd "/")       'evil-search-forward
  (kbd "n")       'evil-search-next
  (kbd "N")       'evil-search-previous
  (kbd "C-d")     'evil-scroll-down
  (kbd "C-u")     'evil-scroll-up
  (kbd "C-w C-w") 'other-window)

(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

;; Move Text Up and Down
(define-key evil-normal-state-map (kbd "C-k") 'move-text-up)
(define-key evil-normal-state-map (kbd "C-j") 'move-text-down)

;; Key Bindings
(with-eval-after-load 'evil-maps

  ;; Remap Prompt
  (define-key evil-motion-state-map ";" 'evil-ex)
  (define-key evil-motion-state-map ":" nil)

  ;; Remap Insert Keys
  (define-key evil-normal-state-map "i" 'evil-append)
  (define-key evil-normal-state-map "I" 'evil-append-line)
  (define-key evil-visual-state-map "I" 'evil-append)
  (define-key evil-normal-state-map "o" 'evil-insert)
  (define-key evil-normal-state-map "O" 'evil-insert-line)
  (define-key evil-visual-state-map "O" 'evil-insert)
  (define-key evil-normal-state-map "a" 'evil-open-below)
  (define-key evil-normal-state-map "A" 'evil-open-above)

  ;; Unbind Arrow Keys
  (define-key evil-motion-state-map [left] nil)
  (define-key evil-motion-state-map [right] nil)
  (define-key evil-motion-state-map [up] nil)
  (define-key evil-motion-state-map [down] nil)

  ;; Indent Bloack Left or Right
  (define-key evil-normal-state-map "\C-h" 'evil-shift-left-line)
  (define-key evil-normal-state-map "\C-l" 'evil-shift-right-line)

  (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
  ;; (define-key evil-operator-state-map "a" evil-outer-text-objects-map)
  ;; (define-key evil-operator-state-map "i" evil-inner-text-objects-map)
  ;; (define-key evil-visual-state-map "i" evil-inner-text-objects-map)
)

(provide 'init-evil)

