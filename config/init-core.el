;; Disable useless startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(menu-bar-mode -1)

(setq default-directory "~/")

(setq ns-command-modifier 'meta         ; Apple/Command key is Meta
      ns-alternate-modifier nil         ; Option is the Mac Option key
)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; move cursor to the last position upon open
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory ".cache/places"))
(setq-default save-place t)


;; minibuffer history
(require 'savehist)
(setq savehist-file (concat user-emacs-directory ".cache/savehist")
      savehist-additional-variables '(search ring regexp-search-ring)
      savehist-autosave-interval 60)
(savehist-mode +1)


;; recent files
(require 'recentf)
(setq recentf-save-file (concat user-emacs-directory ".cache/recentf")
      recentf-max-saved-items 1000
      recentf-max-menu-items 500)
(recentf-mode +1)
(defun delete-single-window (&optional window)
  "Remove WINDOW from the display.  Default is `selected-window'.
If WINDOW is the only one in its frame, then `delete-frame' too."
  (interactive)
  (save-current-buffer
    (setq window (or window (selected-window)))
    (select-window window)
    (kill-buffer)
    (if (one-window-p t)
        (delete-frame)
        (delete-window (selected-window)))))

;; erc
(setq erc-log-channels-directory (concat user-emacs-directory ".cache/erc/logs"))


;; vc
(setq vc-make-backup-files t)


;; narrowing
(put 'narrow-to-region 'disabled nil)


;; dired
(require 'dired-x)


;; ediff
(setq ediff-split-window-function 'split-window-horizontally)


;; store most files in the cache
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory ".cache/backups")))
      auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory ".cache/backups") t))
      auto-save-list-file-prefix
      (concat user-emacs-directory ".cache/auto-save-list/.saves-"))


;; better scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)


;; better buffer names for duplicates
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
      uniquify-after-kill-buffer-p t)

;; shorten yes or no
(defalias 'yes-or-no-p 'y-or-n-p)
(xterm-mouse-mode t)


(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(setq sentence-end-double-space nil
      delete-by-moving-to-trash t
      visible-bell t
      mark-ring-max 64
      global-mark-ring-max 128)


(which-function-mode t)
(blink-cursor-mode t)
(global-auto-revert-mode 1)
(electric-indent-mode t)

;; set offset in C-type languages to 4
(setq c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; used to go back to previous window configurations
(winner-mode 1)

(add-hook 'find-file-hook (lambda ()
                            (visual-line-mode)))

(random t) ;; seed

(provide 'init-core)
