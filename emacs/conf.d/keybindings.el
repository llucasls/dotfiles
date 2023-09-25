(defun my-insert-parentheses ()
  "Insert `()` and move the cursor back one character if an open parenthesis is
  typed."
  (interactive)
  (insert "()")
  (backward-char))

(define-key evil-insert-state-map (kbd "(") 'my-insert-parentheses)

(defun my-insert-quotes ()
  "Insert `\"\"` and move the cursor back one character if a single `\"` is
  typed."
  (interactive)
  (insert "\"\"")
  (backward-char))

(define-key evil-insert-state-map "\"" 'my-insert-quotes)

(defun my-insert-single-quotes ()
  "Insert `''` and move the cursor back one character if a single `'` is
  typed."
  (interactive)
  (insert "''")
  (backward-char))

(defun is-lisp ()
  (or (eq major-mode 'lisp-mode)
      (eq major-mode 'emacs-lisp-mode)
      (eq major-mode 'lisp-interaction-mode)))

(defun my-enable-single-quotes ()
  "Enable single quotes behavior in not-lisp-related modes."
  (when (not (is-lisp))
    (local-set-key "'" 'my-insert-single-quotes)))

(add-hook 'evil-insert-state-entry-hook 'my-enable-single-quotes)
