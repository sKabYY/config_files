; load-path
(add-to-list 'load-path "~/config_files")

(standard-display-ascii ?\t "------->")

(setq make-backup-files nil)
(setq mouse-wheel-scroll-amout '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(xterm-mouse-mode 't)

(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

(setq-default show-trailing-whitespace 't)
(setq-default indent-tabs-mode nil)
(add-hook 'prog-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

; evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

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

; scheme
(require 'parenface)
(add-to-list 'auto-mode-alist '("\\.rkt$" . scheme-mode))

;(set-face-foreground 'paren-face "blue4")

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
;    (paredit-mode 1)
;    (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
;    (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))
