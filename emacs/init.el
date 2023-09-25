(defun load-module (relative-path)
  "Load an Elisp module by specifying its path relative to the current script's
  parent directory."
  (let* ((script-directory (file-name-directory load-file-name))
         (absolute-path (expand-file-name relative-path script-directory)))
    (load absolute-path)))

(load-module "conf.d/melpa-packages")

(setq custom-file (locate-user-emacs-file "conf.d/custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(setq inhibit-startup-screen nil)

(setq scroll-margin 14)

(setq-default show-trailing-whitespace t) ;; Show trailing whitespace
(global-whitespace-mode 1) ;; Enable whitespace-mode globally

(add-to-list 'default-frame-alist
             '(font . "Liberation Mono-10"))

(line-number-mode 1)
(column-number-mode 1)
(global-auto-revert-mode 1)
(recentf-mode 1)
