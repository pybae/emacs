(defmacro bind (&rest commands)
  "Convience macro which creates a lambda interactive command."
  `(lambda ()
     (interactive)
     ,@commands))

(after 'smex
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex))

(setq my-eshell-buffer-count 0)

(after 'evil
  (require-package 'key-chord)
  (key-chord-mode 1)

  ;; Bind semicolon to colon, one less key press
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-visual-state-map (kbd ";") 'evil-ex)

  (after 'smex
    (define-key evil-normal-state-map (kbd ":") 'smex)
    (define-key evil-visual-state-map (kbd ":") 'smex))

  (define-key evil-visual-state-map (kbd "C-n") 'evil-next-visual-line)
  (define-key evil-visual-state-map (kbd "C-p") 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "C-n") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "C-p") 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "C-a") 'beginning-of-line)
  (define-key evil-normal-state-map (kbd "C-e") 'end-of-line)

  (define-key evil-normal-state-map (kbd "C-k") 'kill-visual-line)

  ;; Make is such that insert mode is emacs mode
  ;; as emacs mode has more functionality

  ;; (define-key evil-normal-state-map (kbd "i") 'evil-emacs-state)
  ;; (define-key evil-normal-state-map (kbd "I") (bind
  ;;                                              (evil-emacs-state)
  ;;                                              (beginning-of-visual-line)))
  ;; (define-key evil-normal-state-map (kbd "a") (bind
  ;;                                              (evil-emacs-state)
  ;;                                              (evil-forward-char)))
  ;; (define-key evil-normal-state-map (kbd "A") (bind
  ;;                                              (evil-emacs-state)
  ;;                                              (end-of-visual-line)))
  ;; (define-key evil-normal-state-map (kbd "o") (bind
  ;;                                              (evil-emacs-state)
  ;;                                              (end-of-visual-line)
  ;;                                              (newline-and-indent)))
  ;; (define-key evil-normal-state-map (kbd "O") (bind
  ;;                                              (evil-emacs-state)
  ;;                                              (evil-previous-line)
  ;;                                              (end-of-visual-line)
  ;;                                              (newline-and-indent)))

  ;; ;; Remap some emacs bindings in insert  mode
  ;; (define-key evil-emacs-state-map [escape] 'evil-normal-state)

  (define-key evil-insert-state-map (kbd "C-n") 'evil-next-visual-line)
  (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-visual-line)

  (define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

  (define-key evil-insert-state-map (kbd "C-k") 'kill-visual-line)

  (define-key dired-mode-map (kbd "E") 'dired-toggle-read-only)

  (after 'evil-leader
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "c"   'eshell
      "d"   'dired-jump
      "b d" 'kill-this-buffer

      "r"   'restclient-mode
      "g s" 'magit-status
      "g l" 'magit-log
      "g d" 'vc-diff

      "p"   'package-install
      "P"   'package-list-packages

      "/"   'evil-ex-nohighlight
      ))

  ;; Plugin to jump to pairs of brackets, and such
  (after 'evil-matchit
    (define-key evil-normal-state-map "%" 'evilmi-jump-items))

  (define-key evil-normal-state-map (kbd "SPC k") 'ido-kill-buffer)
  (define-key evil-normal-state-map (kbd "SPC f") 'ido-find-file)
  (define-key evil-normal-state-map (kbd "SPC b") 'ido-switch-buffer)
  (define-key evil-normal-state-map (kbd "SPC p") 'projectile-find-file)

  (after 'helm
    (define-key evil-normal-state-map (kbd "C-x b") 'helm-buffers-list)
    (define-key evil-normal-state-map (kbd "SPC e") 'helm-recentf)
    (define-key evil-normal-state-map (kbd "SPC l") 'helm-swoop)
    (define-key evil-normal-state-map (kbd "SPC F") 'helm-locate)
    (define-key evil-normal-state-map (kbd "SPC a") 'helm-ag)
    (define-key evil-normal-state-map (kbd "SPC y") 'helm-show-kill-ring))


  (define-key evil-normal-state-map (kbd "[ SPC") (bind (evil-insert-newline-above) (forward-line)))
  (define-key evil-normal-state-map (kbd "] SPC") (bind (evil-insert-newline-below) (forward-line -1)))

  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)

  (define-key evil-normal-state-map (kbd "[ q") 'previous-error)
  (define-key evil-normal-state-map (kbd "] q") 'next-error)

  (define-key evil-normal-state-map (kbd "[ [") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] ]") 'next-buffer)

  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "Q") 'my-window-killer)
  (define-key evil-normal-state-map (kbd "Y") (kbd "y$"))

  (define-key evil-normal-state-map (kbd "H") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "J") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "K") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "L") 'evil-window-right)

  (define-key evil-normal-state-map (kbd "M-j") 'evil-join)
  (define-key evil-emacs-state-map  (kbd "M-j") 'evil-join)

  ;; emacs lisp
  (after 'elisp-slime-nav-autoloads
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "g d") 'elisp-slime-nav-find-elisp-thing-at-point)
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "M") 'elisp-slime-nav-describe-elisp-thing-at-point))

  (after 'multiple-cursors
    (define-key evil-emacs-state-map (kbd "M-.") 'mc/mark-next-like-this)
    (define-key evil-emacs-state-map (kbd "M-,") 'mc/skip-to-next-like-this)
    (define-key evil-emacs-state-map (kbd "M-/") 'mc/unmark-next-like-this)

    (define-key evil-visual-state-map (kbd "M-.") 'mc/mark-next-like-this)
    (define-key evil-visual-state-map (kbd "M-,") 'mc/skip-to-next-like-this)
    (define-key evil-visual-state-map (kbd "M-/") 'mc/unmark-next-like-this)
    (define-key evil-visual-state-map (kbd "e") 'mc/edit-lines)
    (define-key evil-visual-state-map (kbd "r") 'mc/mark-all-like-this-dwim))

  (after 'ace-jump-mode
    (define-key evil-normal-state-map (kbd "SPC w") 'evil-ace-jump-word-mode)
    (define-key evil-normal-state-map (kbd "SPC c") 'evil-ace-jump-char-mode)
    (define-key evil-normal-state-map (kbd "S-SPC") 'evil-ace-jump-line-mode)
    (define-key evil-visual-state-map (kbd "SPC w") 'evil-ace-jump-word-mode)
    (define-key evil-visual-state-map (kbd "SPC c") 'evil-ace-jump-char-mode)
    (define-key evil-visual-state-map (kbd "S-SPC") 'evil-ace-jump-line-mode))

  (after 'magit
    (define-key magit-status-mode-map (kbd "C-n") 'magit-goto-next-sibling-section)
    (define-key magit-status-mode-map (kbd "C-p") 'magit-goto-previous-sibling-section)
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      "K" 'magit-discard-item
      "l" 'magit-key-mode-popup-logging
      "h" 'magit-toggle-diff-refine-hunk)))

;; escape minibuffer easily with escape
(define-key minibuffer-local-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'my-minibuffer-keyboard-quit)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)

(after 'package
  (evil-add-hjkl-bindings package-menu-mode-map 'emacs))

;; (after 'project-explorer-autoloads
;;   (after 'project-explorer
;;     (after 'evil
;;       (define-key project-explorer-mode-map (kbd "C-l") 'evil-window-right)))
;;   (global-set-key [f2] 'project-explorer-open)
;;   (global-set-key [f3] 'pe/show-file))


;; (after 'comint
;;   (define-key comint-mode-map [up] 'comint-previous-input)
;;   (define-key comint-mode-map [down] 'comint-next-input))

(after 'auto-complete
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous))

;; (after 'company
;;   (define-key company-active-map "\t" 'my-company-tab)
;;   (define-key company-active-map [tab] 'my-company-tab)
;;   (define-key company-active-map (kbd "C-n") 'company-select-next)
;;   (define-key company-active-map (kbd "C-p") 'company-select-previous))


(after 'org
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c a") 'org-agenda))

(after 'expand-region-autoloads
  (global-set-key (kbd "C-=") 'er/expand-region))


;; (after 'web-mode
;;   (after 'angular-snippets
;;     (define-key web-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point)))


;; mouse scrolling in terminal
(unless (display-graphic-p)
  (global-set-key [mouse-4] (bind (scroll-down 1)))
  (global-set-key [mouse-5] (bind (scroll-up 1))))

(global-set-key [prior] 'previous-buffer)
(global-set-key [next] 'next-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

(provide 'init-bindings)
