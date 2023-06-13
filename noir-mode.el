;;; noir-mode.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Hamza Hamud
;;
;; Author: Hamza Hamud
;; Maintainer: Hamza Hamud
;; Created: June 04, 2023
;; Modified: June 11, 2023
;; Version: 0.0.2
;; Keywords: languages
;; Homepage: https://github.com/hhamud/noir-mode
;; Package-Requires: ((emacs "25.1") (rust-mode "1.0.5"))
;; SPDX-License-Identifier: GNU General Public License v3.0
;; This file is distributed under the terms of GNU General Public License v3.0
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; This package implements a major-mode for editing Noir source code.

;;; Code:

(require 'rust-mode)

;; Define the keywords for noir mode
(defvar noir-mode-keywords
  '("constrain" "assert")
  "Keywords for Noir language.")

;; Define the types for noir mode
(defvar noir-mode-types
  '("Field")
  "Types for Noir language.")

;; Define the function call pattern for noir mode
(defvar noir-mode-function-call
  "\\<\\([a-zA-Z_][a-zA-Z0-9_]*\\)\\s-*("
  "Regular expression for Noir function call.")

;; Define the highlighting rules for noir mode
(defvar noir-mode-highlights
  `(
    ;; Highlight keywords in noir mode
    (,(regexp-opt noir-mode-keywords 'symbols) . 'font-lock-keyword-face)
    ;; Highlight types in noir mode
    (,(regexp-opt noir-mode-types 'words) . 'font-lock-type-face)
    ;; Highlight function calls in noir mode
    (,noir-mode-function-call . (1 'font-lock-function-name-face)))
  "Highlighting rules for Noir language.")

;;;###autoload
(define-derived-mode noir-mode rust-mode
  "Noir"
  ;; Add the noir mode highlights to the current buffer
  (font-lock-add-keywords nil noir-mode-highlights))

;;;###autoload
;; Automatically use noir mode for files with .nr extension
(add-to-list 'auto-mode-alist '("\\.nr\\'" . noir-mode))

;; Provide the noir mode definition to Emacs
(provide 'noir-mode)

;;; noir-mode.el ends here
