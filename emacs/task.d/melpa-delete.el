#!/usr/bin/emacs -x
(require 'package)
(package-activate-all)

(when (< (length command-line-args) 4)
  (message "Error: package name was not provided\n")
  (message "Usage: %s <package>" (nth 2 command-line-args))
  (kill-emacs 1))

(setq package (nth 3 command-line-args))

(dolist (pkg package-alist)
  (let* ((pkg-name (car pkg)) (pkg-desc (cadr pkg)))
    (when (string-equal pkg-name package)
      (package-delete pkg-desc))))
