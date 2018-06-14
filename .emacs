(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Add paths.
(add-to-list 'load-path "~/.emacs.d/el")

;; Require stuff.
(require 'go-mode)
(require 'protobuf-mode)
(require 'smart-mode-line)

(setq gofmt-command "goimports")
(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(require 'smart-mode-line)
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

;; Settings.
(load-theme 'monokai t)
;; (setq vc-handled-backends ())
(global-auto-revert-mode t)
(show-paren-mode 1)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defun my-go-mode-hook ()
  (flycheck-mode)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun my-js-mode-hook ()
  (flycheck-mode))
(add-hook 'js-mode-hook 'my-js-mode-hook)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keyboard.
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-n" 'goto-line)
(global-set-key "\C-j" 'ffap)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-xg" 'magit-status)
(global-set-key "\C-xo" 'switch-window)

(defun my-html-mode-config ()
  (local-unset-key (kbd "\C-c <left>"))
  (local-unset-key (kbd "\C-c <right>")))

(add-hook 'html-mode-hook 'my-html-mode-config)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Modeline.
(setq sml/name-width 80)
(setq sml/vc-mode-show-backend t)
(set-face-attribute 'sml/global nil :foreground '"white")
(set-face-attribute 'sml/col-number nil :inherit 'sml/global)
(defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
  (setq ad-return-value
		(concat ad-return-value
				(let ((plus-minus (vc-git--run-command-string file "diff" "--numstat" "--")))
				  (and plus-minus
					   (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t" plus-minus)
					   (format " +%s-%s" (match-string 1 plus-minus) (match-string 2 plus-minus)))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-save-hook
  (lambda()
    (if (string-match "BUILD" (file-name-base (buffer-file-name)))
        (progn
          (shell-command (concat "buildifier " (buffer-file-name)))
          (find-alternate-file (buffer-file-name))))))
