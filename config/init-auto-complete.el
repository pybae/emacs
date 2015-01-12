(require-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(setq ac-auto-show-menu t)
(setq ac-auto-start t)

(setq ac-quick-help-delay 0.3)
(setq ac-quick-help-height 30)

(setq ac-show-menu-immediately-on-auto-complete t)

(dolist (mode '(vimrc-mode
                ;; shell-mode term-mode terminal-mode eshell-mode comint-mode skewer-repl-mode
                html-mode stylus-mode))
  (add-to-list 'ac-modes mode))

(provide 'init-auto-complete)
;;;  init-auto-complete.el ends here
