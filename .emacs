(package-initialize)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add paths.
(add-to-list 'load-path "~/.dot/.emacs.d/" t)
(add-to-list 'custom-theme-load-path "~/.dot/.emacs.d/themes/emacs-color-theme-solarized/" t)

;; Require stuff.
(require 'go-mode)

;; Settings.
(load-theme 'solarized-dark t)
(global-auto-revert-mode t)
(show-paren-mode 1)
(setq vc-handled-backends ())
(setq column-number-mode t)
(setq default-tab-width 4)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keyboard.
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-n" 'goto-line)
(global-set-key "\C-j" 'ffap)
(global-set-key "\C-c\C-c" 'comment-region)
