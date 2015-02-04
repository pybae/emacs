; Paul Bae (@pybae)

(setq user-emacs-directory "~/.emacs.d/")
(add-to-list 'load-path (concat user-emacs-directory "config"))

(require 'cl)

(require 'init-packages)
(require 'init-util)
(require 'init-core)
(require 'init-org)
(require 'init-eyecandy)
(require 'init-hippie)

(require 'init-editor)
(require 'init-paren)
(require 'init-yasnippet)

;; (require 'init-company)
(require 'init-auto-complete)
(require 'init-flycheck)

(require 'init-projectile)
(require 'init-helm)
(require 'init-ido)

(require 'init-git)

;; Language Specific Bindings
(require 'init-vim)
(require 'init-haskell)
(require 'init-lisp)
(require 'init-markdown)
(require 'init-web)
(require 'init-python)
(require 'init-shell)
;; (require 'init-clojure)

(require 'init-evil)
(require 'init-misc)

(require 'init-bindings)
