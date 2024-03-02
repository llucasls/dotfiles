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

(defvar tutorial-file nil
  "This variable holds the name of the tutorial file. It is expected to change
  every time the tutorial is opened, since it is a temporary copy.")

(defvar previous-buffer-query-functions nil
  "This variable temporarily holds the value of kill-buffer-query-functions.
  Its purpose is to safely restore kill-buffer-query-functions.")

(defun open-temporary-copy ()
  (interactive)
  (let* ((original-file (expand-file-name "tutorial" user-emacs-directory))
         (temp-file (make-temp-file "tutorial-" nil ".txt")))
    (copy-file original-file temp-file t)
    (find-file temp-file)
    (setq tutorial-file temp-file)
    (evil-emacs-state)
    (setq previous-buffer-query-functions kill-buffer-query-functions)
    (setq kill-buffer-query-functions nil)
    (add-hook 'kill-buffer-hook #'delete-temporary-copy)))

(defun exit-temporary-copy-emacs-mode ()
  "Switch back to Evil mode when exiting the tutorial buffer."
  (when (string= (buffer-name) "tutorial")
    (evil-emacs-state -1)))

(defun delete-temporary-copy ()
  "Delete temporary file."
  (when (and (boundp 'tutorial-file) tutorial-file)
    (delete-file tutorial-file)
    (setq tutorial-file nil))
  (remove-hook 'kill-buffer-hook #'delete-temporary-copy)
  (setq kill-buffer-query-functions previous-buffer-query-functions)
  (setq previous-buffer-query-functions nil))

(add-hook 'kill-buffer-hook #'exit-temporary-copy-emacs-mode)

(keymap-set evil-normal-state-map "C-h t" 'open-temporary-copy)
