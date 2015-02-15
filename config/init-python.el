(require-package 'jedi)
(require-package 'epc)
(require-package 'elpy)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; setup the virtual envs work home
(setenv "WORKON_HOME" "~/envs")

(setq elpy-default-minor-modes '(eldoc-mode
                                 highlight-indentation-mode
                                 yas-minor-mode))

(elpy-enable)
(provide 'init-python)
