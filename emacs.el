; load-path
(add-to-list 'load-path "~/config_files")

(setq make-backup-files nil)
(setq mouse-wheel-scroll-amout '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(setq scroll-step 1)
(xterm-mouse-mode t)
(setq column-number-mode t)

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
(add-hook 'sgml-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(add-hook 'erlang-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'prog-newline)))
(defun end-of-line-and-prog-newline ()
  (interactive)
  (end-of-line)
  (prog-newline))
(add-hook 'erlang-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))
(add-hook 'prog-mode-hook '(lambda ()
  (local-set-key (kbd "C-j") 'end-of-line-and-prog-newline)))

; evil
(add-to-list 'load-path "~/.emacs.d/evil")
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
(add-hook 'erlang-mode-hook 'rainbow-delimiters-mode)

; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; erlang
(add-hook 'erlang-mode-hook (lambda ()
  (setq erlang-electric-commands '(erlang-electric-semicolon))))

; scheme
(add-to-list 'auto-mode-alist '("\\.rkt$" . scheme-mode))

;(require 'cmuscheme)
;(setq scheme-program-name "racket")         ;; 如果用 Petite 就改成 "petite"
;
;
;;; bypass the interactive question and start the default interpreter
;(defun scheme-proc ()
;  "Return the current Scheme process, starting one if necessary."
;  (unless (and scheme-buffer
;               (get-buffer scheme-buffer)
;               (comint-check-proc scheme-buffer))
;    (save-window-excursion
;      (run-scheme scheme-program-name)))
;  (or (scheme-get-process)
;      (error "No current process. See variable `scheme-buffer'")))
;
;
;(defun scheme-split-window ()
;  (cond
;   ((= 1 (count-windows))
;    (delete-other-windows)
;    (split-window-vertically (floor (* 0.68 (window-height))))
;    (other-window 1)
;    (switch-to-buffer "*scheme*")
;    (other-window 1))
;   ((not (find "*scheme*"
;               (mapcar (lambda (w) (buffer-name (window-buffer w)))
;                       (window-list))
;               :test 'equal))
;    (other-window 1)
;    (switch-to-buffer "*scheme*")
;    (other-window -1))))
;
;
;(defun scheme-send-last-sexp-split-window ()
;  (interactive)
;  (scheme-split-window)
;  (scheme-send-last-sexp))
;
;
;(defun scheme-send-definition-split-window ()
;  (interactive)
;  (scheme-split-window)
;  (scheme-send-definition))
;
;
;(add-hook 'scheme-mode-hook
;  (lambda ()
;    (paredit-mode t)
;    (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
;    (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "magenta")))))
