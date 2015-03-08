(require-package 'virtualenvwrapper)
(require-package 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/envs")

(provide 'init-python)
