(require-package 'virtualenvwrapper)
(require-package 'elpy)

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells)
;; (venv-initialize-eshell)
;; (setq venv-location "~/envs")

(require 'elpy)
(elpy-enable)

;; (setq python-shell-interpreter "/home/pyb/anaconda3/bin/ipython"
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; (setq python-shell-interpreter "ipython")

(provide 'init-python)
