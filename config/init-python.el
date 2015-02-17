(require-package 'jedi)
(require-package 'epc)
(require-package 'elpy)

(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(setq elpy-default-minor-modes '(eldoc-mode
                                 highlight-indentation-mode
                                 yas-minor-mode))
(setq elpy-rpc-backend "jedi")

(elpy-enable)
(provide 'init-python)
