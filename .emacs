(add-to-list 'load-path "~/.emacs.d/" t)
(require 'go-mode)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-auto-revert-mode t)

;; Save hooks.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
