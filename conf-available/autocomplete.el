;;; autocomplete --- Configuration for auto complete features
;;; Commentary:
;;;   1. configuration for auto-complete
;;;   2. configuration for yasnippet
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Auto-complete
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(nby/with-feature
 'auto-complete
 (custom-set-variables
  '(ac-comphist-file (nby/build-relative-path "db/ac-comphist.el")))
 (when (require 'auto-complete-config nil t)
   (ac-config-default)
   (global-auto-complete-mode t)
   (define-key ac-complete-mode-map "\t" 'ac-expand)
   (define-key ac-complete-mode-map "\r" nil)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Yasnippet
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(nby/with-feature
 'yasnippet
 (custom-set-variables
  '(yas-snippet-dirs
       `(,(nby/build-relative-path "snippets")
         ,(nby/build-relative-path "el-get/yasnippet/snippets"))))
 (yas-global-mode t)
 (define-key ac-complete-mode-map "\C-n" 'ac-next)
 (define-key ac-complete-mode-map "\C-p" 'ac-previous)
 (define-key ac-complete-mode-map "\t" 'ac-complete)
 (define-key ac-complete-mode-map "\r" nil))

;;; autocomplete ends here