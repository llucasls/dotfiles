#!/usr/bin/env -S emacs -x
(setq load-path (cons (locate-user-emacs-file "") load-path))
(load "conf.d/melpa-packages" 'nomessage 'noerror)

(setq stdout t)
(setq stderr #'external-debugging-output)
(setq byte-compile-warnings nil)

(defun printf (format-string &rest objects)
  "Write formatted output."
  (princ (apply 'format format-string objects) t))

(defun fprintf (output-stream format-string &rest objects)
  "Write formatted output to a specific stream. It currently accepts
either `stdout' or `stderr' as its first argument."
  (princ (apply 'format format-string objects) output-stream))

(setq my-table (make-hash-table
  :test 'equal))

(puthash "-b" "batch" my-table)
(puthash "-c" "byte-code" my-table)
(puthash "-n" "native" my-table)
(puthash "-o" "output" my-table)
(puthash "-r" "recursive" my-table)
(puthash "-h" "help" my-table)

; calls byte-compile-file
(defun compile-byte-code (files)
  "Compile input files into byte-code."
  (dolist (file files)
    (progn
      (printf "compiling \033[34m%s\033[0m into byte-code: " file)
      (princ (byte-compile-file file))
      (printf "\n"))))

(defun compile-native (arg)
  "Calls native-copile")

(defun compile-directory (arg)
  "Compiles every source code file in a given directory.")

;(defun compile-batch (&optional arg)
;  "Calls batch-byte-compile")

;(defun compile-batch-native (&optional arg)
;  "Calls batch-native-compile")

(defun parse-opts (argv)
  "do nothing for now")

(defun parse-args (argv)
  "do nothing for now")


(setq argv (nthcdr 3 command-line-args))

(setq arg nil)

(compile-byte-code argv)

; Process options
;(while (and argv (not (string= arg "--")))
;       (setq arg (pop argv))
;       (if (not (string= arg "--"))
;       (progn
;         (princ (format "option %s\n" arg) t))))

; Process arguments
;(dolist (arg argv)
;  (princ (format "byte-compile %s\n" arg) t))

;(dolist (file argv)
;  (byte-compile-file file))

;(message "%s" my-table)
;(message "%s" (gethash "-r" my-table))

;(message "%s" (native-comp-available-p))

;; Exit with the appropriate return code
(when (boundp 'return-code)
  (kill-emacs return-code))
