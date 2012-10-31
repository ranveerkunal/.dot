(add-to-list 'load-path "~/.emacs.d/" t)
(require 'go-mode-load)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(add-hook 'before-save-hook 'delete-trailing-whitespace)