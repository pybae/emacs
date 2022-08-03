(require-package 'multiple-cursors)
(require 'multiple-cursors)
(after 'evil
  (add-hook 'multiple-cursors-mode-enabled-hook 'evil-emacs-state)
  (add-hook 'multiple-cursors-mode-disabled-hook 'evil-normal-state))


(provide 'init-editor)
