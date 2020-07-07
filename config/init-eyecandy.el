(require-package 'base16-theme)
(require-package 'ujelly-theme)
(require-package 'smart-mode-line)
(require-package 'solarized-theme)

(require 'smart-mode-line)
(require 'uniquify)

(sml/setup)
(sml/apply-theme 'dark)

;; Get rid of tool bar and scroll bars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Fonts
(set-default-font "Inconsolata for Powerline-14")

(line-number-mode t)
(blink-cursor-mode 0)

(set-fringe-mode '(1 . 0))

;; Themes
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; Better fullscreen
(setq ns-use-native-fullscreen nil)

(require-package 'diminish)
(after 'diminish-autoloads
  (diminish 'visual-line-mode)
  (after 'autopair (diminish 'autopair-mode))
  (after 'undo-tree (diminish 'undo-tree-mode))
  (after 'auto-complete (diminish 'auto-complete-mode))
  (after 'company (diminish 'company-mode))
  (after 'projectile (diminish 'projectile-mode))
  (after 'yasnippet (diminish 'yas-minor-mode))
  (after 'guide-key (diminish 'guide-key-mode))
  (after 'eldoc (diminish 'eldoc-mode))
  (after 'smartparens (diminish 'smartparens-mode))
  (after 'company (diminish 'company-mode))
  (after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
  (after 'git-gutter+ (diminish 'git-gutter+-mode)))

(setq ring-bell-function 'ignore)

(load-theme 'solarized-dark)
(set-cursor-color "#eb8f34")

(provide 'init-eyecandy)
;;; init-eyecandy.el ends here
