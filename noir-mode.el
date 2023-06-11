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
;; SPDX-License-Identifier: GPL3 License
;; This file is distributed under the terms of GPL License (version 3.0).
;;
;; This file is not part of GNU Emacs.
;;
;; This package implements a major-mode for editing Noir source code.
;;
;;; Code:

(require 'rust-mode)


(defvar noir-mode-keywords '("constrain" "assert"))
(defvar noir-mode-types '("Field" "Witness"))
(defvar noir-mode-functions '("printf" "sprintf" "include" "load" "next" "import"))
(defvar noir-mode-function-call "\\<\\([a-zA-Z_][a-zA-Z0-9_]*\\)\\s-*(")



(defvar noir-mode-highlights
  `(
    (,(regexp-opt noir-mode-keywords 'symbols) . 'font-lock-keyword-face)
    (,(regexp-opt noir-mode-types 'words) . 'font-lock-type-face)
    (,(regexp-opt noir-mode-functions 'words) . 'font-lock-function-name-face)
    (,noir-mode-function-call . (1 'font-lock-function-name-face))
    ))


;;;###autoload
(define-derived-mode noir-mode rust-mode
  "Noir"
  (font-lock-add-keywords nil noir-mode-highlights))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.nr\\'" . noir-mode))

(provide 'noir-mode)
;;; noir-mode.el ends here

