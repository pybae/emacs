;; Files to setup the shell

(require-package 'shell-command)
(require 'shell-command)
(shell-command-completion-mode)

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

;; Eshell
(setq eshell-directory-name (concat user-emacs-directory ".cache/eshell"))
(setq eshell-aliases-file (concat user-emacs-directory ".eshell_aliases"))
(setq eshell-scroll-to-bottom-on-input 'all)
(setq eshell-glob-case-insensitive t)
(setq eshell-buffer-shorthand t)
(setq eshell-error-if-no-glob t)
(setq eshell-send-direct-to-subprocesses t)

(provide 'init-shell)

