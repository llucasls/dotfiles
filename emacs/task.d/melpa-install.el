#!/usr/bin/emacs -x
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(when (< (length command-line-args) 4)
  (message "Error: package name was not provided\n")
  (message "Usage: %s <package>" (nth 2 command-line-args))
  (kill-emacs 1))

(setq package (nth 3 command-line-args))

(package-install (intern package))
