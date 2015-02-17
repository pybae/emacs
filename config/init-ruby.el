(require-package 'inf-ruby)
(require-package 'rbenv)

(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(require 'rbenv)
(add-hook 'ruby-mode-hook 'global-rbenv-mode)
(add-hook 'ruby-mode-hook 'rbenv-use-corresponding)

(provide 'init-ruby)
