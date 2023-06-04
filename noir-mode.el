;;; noir-mode.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 User
;;
;; Author: Hamza Hamud
;; Maintainer: Hamza Hamud
;; Created: June 04, 2023
;; Modified: June 04, 2023
;; Version: 0.0.1
;; Keywords: noir lang syntax highlighting
;; Homepage: https://github.com/hhamud/noir-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(define-derived-mode noir-mode prog-mode "Noir"
  "Major mode for editing Noir language source files."
  (setq font-lock-defaults '((noir-font-lock-keywords) nil nil))
  (setq-local comment-start "//")
  (setq-local comment-end "")
  (setq-local syntax-table noir-mode-syntax-table)
  (setq mode-name "noir"))


(setq noir-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-keywords '("fn" "mod" "use" "struct" "if" "else" "for" "constrain" "global" "comptime" "pub" "in" "as" "let"))
             (x-types '("str" "bool" "Field" "Witness" "u8" "i8" "u16" "i16" "u32" "i32" "u64" "i64" "u128" "i128"))
             (x-constants '("true" "false"))
             (x-events '("on" "signal" "emit" "call" "after" "before" "set" "get" "if" "else" "while" "do" "try" "catch" "finally"))
             (x-functions '("print" "println" "printf" "sprintf" "error" "require" "include" "load" "next" "import"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-types-regexp (regexp-opt x-types 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-events-regexp (regexp-opt x-events 'words))
             (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          (,x-events-regexp . font-lock-builtin-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; single-line comments
          ("//.*" . font-lock-comment-face)
          ;; multi-line comments
          ("/\\*\\(.\\|\n\\)*?\\*/" . font-lock-comment-face)
          ;; fn names
          ("fn \\([_a-zA-Z][_a-zA-Z0-9]*\\)(\\(.*?\\))" 1 font-lock-function-name-face)
          ;; match and highlight the function part
          ("\\([_a-zA-Z][_a-zA-Z0-9]*::\\)+\\([_a-zA-Z][_a-zA-Z0-9]*\\)" 2 font-lock-function-name-face)
          ;; match and highlight the module path part excluding the last component
          ("\\([_a-zA-Z][_a-zA-Z0-9]*::\\)+" . font-lock-type-face)
          ;; match and highlight the last component of the module path separately
          ("\\([_a-zA-Z][_a-zA-Z0-9]*::\\)+\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\(?:::\\|;\\)" 2 font-lock-function-name-face)
          ;; for macros
          ("#\\[[^]]*\\]" . font-lock-warning-face)
          ;; note: order above matters. “x-keywords-regexp” goes last because
          ;; otherwise the keyword “state” in the function “state_entry”
          ;; would be highlighted.
          )))

(defvar noir-mode-syntax-table nil "Syntax table for `noir-mode'.")

(setq noir-mode-syntax-table
      (let ((syn-table (make-syntax-table)))
        ;; C++ style comment “// …”
        (modify-syntax-entry ?/ ". 124b" syn-table)
        (modify-syntax-entry ?* ". 23" syn-table)
        (modify-syntax-entry ?\n "> b" syn-table)
        syn-table))

(define-key noir-mode-map [remap comment-dwim] 'noir-comment-dwim)
(add-to-list 'auto-mode-alist '("\\.nr\\'" . noir-mode))

(provide 'noir-mode)
;;; noir-mode.el ends here
