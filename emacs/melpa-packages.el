(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package evil
  :init
  (setq evil-undo-system 'undo-fu))
(evil-mode 1)

(use-package undo-fu)

(use-package editorconfig)
(editorconfig-mode 1)
