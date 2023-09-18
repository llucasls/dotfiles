(load "~/.config/emacs/melpa-packages")

(setq inhibit-startup-screen nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default show-trailing-whitespace t) ;; Show trailing whitespace
(setq-default whitespace-style '(face tabs tab-mark trailing lines-tail)) ;; Display tab characters
(global-whitespace-mode 1) ;; Enable whitespace-mode globally

(add-to-list 'default-frame-alist
	     '(font . "Liberation Mono-11"))

(line-number-mode 1)
(column-number-mode 1)
