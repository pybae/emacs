(require-package 'elpy)

;; setup the virtual envs work home
(setenv "WORKON_HOME" "~/envs")

(setq elpy-default-minor-modes '(eldoc-mode
                                 highlight-indentation-mode
                                 yas-minor-mode))

(elpy-enable)
(provide 'init-python)
