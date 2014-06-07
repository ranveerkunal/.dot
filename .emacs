(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Add paths.
(add-to-list 'load-path "~/.dot/.emacs.d/" t)
(add-to-list 'custom-theme-load-path "~/.dot/.emacs.d/themes/emacs-color-theme-solarized/" t)
(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")

;; Require stuff.
(require 'go-mode)
(require 'go-mode-load)
(require 'go-flycheck)
(setq gofmt-command "goimports")
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'smart-mode-line)
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

;; Settings.
(load-theme 'solarized-dark t)
;; (setq vc-handled-backends ())
(global-auto-revert-mode t)
(show-paren-mode 1)
(setq column-number-mode t)
(setq default-tab-width 4)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'gofmt-before-save)

;; Keyboard.
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-n" 'goto-line)
(global-set-key "\C-j" 'ffap)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-x\C-g" 'magit-status)

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
