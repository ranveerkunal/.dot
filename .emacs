(add-to-list 'load-path "~/.emacs.d/" t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/" t)
(load-theme 'solarized-dark t)
(require 'go-mode)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-auto-revert-mode t)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
