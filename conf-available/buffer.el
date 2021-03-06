;;; buffer --- Configurations about buffer manipulating
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Buffer switch
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-x" #'(lambda () (interactive)
                               (switch-to-buffer (other-buffer))))

(nby/with-feature 'bs (global-set-key "\C-x\C-b" 'bs-show))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Helm
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(nby/with-feature
 'helm

 (require 'helm-config)
 (require 'helm-elisp)
 ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
 ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
 ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
 (global-set-key (kbd "C-c h") 'helm-command-prefix)
 (global-unset-key (kbd "C-x c"))


 (when (executable-find "ack")
   (setq helm-grep-default-command
         "ack -H --color --smart-case --no-group %p %f"
         helm-grep-default-recurse-command
         "ack -H --color --smart-case --no-group %p %f"))

 ;; ag must be installed
 (when (executable-find "ag")
   (nby/with-feature
    'helm-ag
    (custom-set-variables
     '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
     '(helm-ag-command-option "--all-text")
     '(helm-ag-insert-at-point 'symbol))))

 (when (executable-find "curl")
   (setq helm-google-suggest-use-curl-p t))

 (global-set-key (kbd "C-x C-f") 'helm-find-files)
 (global-set-key (kbd "M-x") 'helm-M-x)
 (global-set-key (kbd "M-y") 'helm-show-kill-ring) ; show kill ring when press alt-y
 (global-set-key (kbd "C-x b") 'helm-mini)
 (global-set-key (kbd "C-o") 'helm-occur)
 (global-set-key (kbd "C-x g") 'helm-do-grep)
 (global-set-key (kbd "C-c h g") 'helm-google-suggest)
 (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

 (nby/with-feature 'helm-projectile)
 (nby/with-feature 'helm-bm (global-set-key (kbd "C-c b") 'helm-bm))

 (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
       helm-autoresize-max-height 30
       helm-autoresize-min-height 30
       helm-ff-file-name-history-use-recentf t)
 (helm-autoresize-mode t)


 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
 (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
 (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
 (define-key helm-map (kbd "C-x C-x") 'helm-toggle-visible-mark)

 (helm-mode 1))

;;; buffer.el ends here
