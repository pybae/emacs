 (require 'org)

;; Whole folder is the agenda files
(setq org-agenda-files (list "~/Dropbox/org"))


;; (require 'ob)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((plantuml . t)))

;; Sets timestamps on TODO closing
(setq org-log-done 'time)

;; Syntax highlighting org mode
(setq org-src-fontify-natively t)

;; (setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))

(add-hook 'org-mode-hook 'turn-on-org-cdlatex) ;; enable fast latex editing for all org files


(provide 'init-org)
