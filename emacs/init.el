(defun load-module (module &rest args)
  "Load user-defined Elisp module by reading a file name relative to
`user-emacs-directory'. Passes any extra arguments to `load'."
  (apply
    'load (file-name-sans-extension (locate-user-emacs-file module)) args))

(load-module "conf.d/melpa-packages")
(load-module "conf.d/keybindings")

(setq custom-file (locate-user-emacs-file "conf.d/custom-vars.el"))
(load-module custom-file 'noerror 'nomessage)

(setq inhibit-startup-screen nil)

(setq-default show-trailing-whitespace t) ;; Show trailing whitespace
(global-whitespace-mode 1) ;; Enable whitespace-mode globally

(add-to-list 'default-frame-alist
             '(font . "Liberation Mono-10"))

(line-number-mode 1)
(column-number-mode 1)
(global-auto-revert-mode 1)
(recentf-mode 1)
