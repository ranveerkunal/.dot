;; Add paths.
(add-to-list 'load-path "~/.dot/.emacs.d/" t)
(add-to-list 'custom-theme-load-path "~/.dot/emacs-color-theme-solarized/" t)

;; Require stuff.
(require 'go-mode)

;; Settings.
(load-theme 'solarized-dark t)
(global-auto-revert-mode t)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keyboard.
(global-set-key "\C-x\C-b" 'electric-buffer-list)
