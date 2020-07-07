(require 'org)

;; Whole folder is the agenda files
(setq org-agenda-files (list "~/org"))


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


(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'normal :height 1.0)))

(add-hook 'org-mode-hook 'my/org-mode-hook)

(provide 'init-org)
