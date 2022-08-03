(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor  '("white"  box))
(setq evil-normal-state-cursor '("white"  box))
(setq evil-insert-state-cursor '("white"  box))

(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-visualstar)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit)
;; (require-package 'surround)

(require 'evil)
(require 'evil-leader)
(require 'evil-indent-textobject)
(require 'evil-visualstar)
(require 'evil-matchit)
;; (require 'surround)

(global-evil-leader-mode)
(evil-mode 1)
;; (global-surround-mode 1)

(dolist (mode '(eshell-mode
                shell-mode
                term-mode
                terminal-mode
                comint-mode
                skewer-repl-mode
                profiler-report-mode
                erc-mode weechat-mode
                direx:direx-mode
                project-explorer-mode))
  (evil-set-initial-state mode 'emacs))

(define-key evil-normal-state-map "TAB" nil)

(defun my-send-string-to-terminal (string)
  (unless (display-graphic-p) (send-string-to-terminal string)))

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(provide 'init-evil)

(eval-after-load "evil-maps"
  (define-key evil-motion-state-map "\t" nil))

(define-key evil-motion-state-map "\t" nil)
