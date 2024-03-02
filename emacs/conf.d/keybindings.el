; FUNCTIONS

(defun my-insert-parentheses ()
  "Insert `()` and move the cursor back one character if an open parenthesis is
  typed."
  (interactive)
  (insert "()")
  (backward-char))

(defun my-insert-quotes ()
  "Insert `\"\"` and move the cursor back one character if a single `\"` is
  typed."
  (interactive)
  (insert "\"\"")
  (backward-char))

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
  "Enable single quotes behavior in non-lisp modes."
  (when (not (is-lisp))
    (local-set-key "'" 'my-insert-single-quotes)))

(defun insert-tab-action () (interactive)
  (if (looking-back "^\s*" nil)
    (evil-shift-right-line 1)
    (insert "\t")))

(defun insert-del-action () (interactive)
  (if (looking-back "^\s*" nil)
    (evil-shift-left-line 1)
    (delete-char -1)))

(defvar leader ","
  "The leader key.")

(defun leader (&rest keys)
  "A function that translates `leader' into a key. It concatenates its
  arguments into a string of characters separated by spaces, and prepends it
  with a single leader character. You can pass the `leader' variable as an
  argument, in order to use the leader key multiple times. It requires a
  variable of the same name to be defined."
  (mapconcat 'identity (cons leader keys) " "))

; MAPPINGS

(keymap-set evil-insert-state-map "(" 'my-insert-parentheses)

(keymap-set evil-insert-state-map "\"" 'my-insert-quotes)

(add-hook 'evil-insert-state-entry-hook 'my-enable-single-quotes)

(evil-set-initial-state 'Info-mode 'emacs)

(keymap-set evil-insert-state-map "TAB" 'insert-tab-action)

(keymap-set evil-insert-state-map "DEL" 'insert-del-action)

(keymap-set evil-normal-state-map (leader "t") 'my-open-terminal)
