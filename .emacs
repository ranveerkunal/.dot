;; Add paths.
(add-to-list 'load-path "~/.dot/.emacs.d/" t)
(add-to-list 'custom-theme-load-path "~/.dot/emacs-color-theme-solarized/" t)
(add-to-list 'custom-theme-load-path "~/.dot/zenburn-emacs/" t)

;; Require stuff.
(require 'go-mode)

;; Settings.
(load-theme 'solarized-dark t)
(global-auto-revert-mode t)
(show-paren-mode 1)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keyboard.
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-n" 'goto-line)
(global-set-key "\C-j" 'ffap)
