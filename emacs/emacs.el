; load-path
(add-to-list 'load-path "~/config_files/emacs")

(setq make-backup-files nil)
(setq abbrev-file-name "~/config_files/emacs/abbrev_defs")
;(require 'cl)  ; flet requires Common Lisp package
;(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;  (flet ((process-list ())) ad-do-it))

(setq mouse-wheel-scroll-amout '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(setq scroll-step 1)
(xterm-mouse-mode t)
(setq column-number-mode t)
(setq-default case-fold-search nil)

(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode t)

; close the menu bar
;(menu-bar-mode -99)

; show line numbers
(global-linum-mode t)

; whitespace
(setq-default show-trailing-whitespace t)

; tab
(standard-display-ascii ?\t "------->")
(setq-default indent-tabs-mode nil)

; return key, auto indent
(defun prog-newline ()
  (interactive)
  (comment-indent-new-line))
(add-hook 'prog-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(add-hook 'erlang-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(add-hook 'sgml-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(add-hook 'css-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(defun end-of-line-and-prog-newline ()
  (interactive)
  (end-of-line)
  (prog-newline))
(add-hook 'prog-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))
(add-hook 'erlang-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))
(add-hook 'sgml-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))
(add-hook 'css-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))

; flymake
(defvar my-flymake-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-e" 'flymake-show-error-message)
    (define-key map "\M-p" 'flymake-goto-prev-error)
    (define-key map "\M-n" 'flymake-goto-next-error)
    map)
  "Keymap for my flymake minor mode.")
(defun my-flymake-err-at (pos)
  (let ((overlays (overlays-at pos)))
    (remove nil
            (mapcar (lambda (overlay)
                      (and (overlay-get overlay 'flymake-overlay)
                           (overlay-get overlay 'help-echo)))
                    overlays))))
(defun my-flymake-err-echo ()
  (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))
(defun flymake-show-error-message ()
  (interactive)
  (my-flymake-err-echo))
(defadvice flymake-goto-next-error (after display-message activate compile)
  (my-flymake-err-echo))
(defadvice flymake-goto-prev-error (after display-message activate compile)
  (my-flymake-err-echo))
(define-minor-mode my-flymake-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.

Key bindings:

\\{my-flymake-minor-mode-map}"
  nil
  nil
  :keymap my-flymake-minor-mode-map)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:background "blue"))))
 '(flymake-warnline ((((class color)) (:background "blue"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "magenta")))))
(add-hook 'flymake-mode-hook 'my-flymake-minor-mode)

; evil
(add-to-list 'load-path "~/config_files/emacs/evil")
(require 'evil)
(evil-mode t)
(define-key evil-normal-state-map (kbd "C-e") 'end-of-line)
(define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

; paredit
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

; color
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'erlang-mode-hook 'rainbow-delimiters-mode)
(add-to-list 'load-path "~/config_files/emacs/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; python
(when (load "flymake" t)
  (defun flymake-local-file ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      local-file))
  (defun flymake-pychecker-init ()
    (list "pychecker.sh" (list (flymake-local-file))))
  (defun add-to-list-flymake (proc-symbol)
    (add-to-list 'flymake-allowed-file-name-masks
                 (list "\\.py\\'" proc-symbol)))
  (add-to-list-flymake 'flymake-pychecker-init))
(add-hook 'find-file-hook 'flymake-find-file-hook)

; erlang
(add-hook 'erlang-mode-hook (lambda ()
  (setq erlang-electric-commands '(erlang-electric-semicolon))))
(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))

; scheme
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))

; others
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((code . utf-8))))
 '(save-place t nil (saveplace)))

