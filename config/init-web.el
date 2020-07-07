
(require-package 'exec-path-from-shell)
(require 'exec-path-from-shell)
(require-package 'js2-mode)
(require 'js2-mode)
(setq js2-highlight-level 3)
(setq-default js2-basic-offset 2)

(require-package 'ac-js2)
(after 'js2-mode-autoloads
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(require-package 'js2-refactor)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")


(require-package 'tern)
(require-package 'tern-auto-complete)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(after 'tern
  (after 'auto-complete
    (require 'tern-auto-complete)
    (tern-ac-setup)))


(require-package 'coffee-mode)
(require-package 'jade-mode)


(require-package 'stylus-mode)

(defvar my-stylus-command-args nil
  "Additional list of arguments to pass into the stylus command.")

(defun my-stylus-compile (start end)
  (let ((buffer (get-buffer "*Stylus*")))
    (when buffer (with-current-buffer buffer (erase-buffer))))
  (apply 'call-process-region start end "stylus" nil (get-buffer-create "*Stylus*") nil
         my-stylus-command-args)
  (let ((buffer (get-buffer "*Stylus*")))
    (display-buffer buffer)
    (when buffer (with-current-buffer buffer (css-mode)))))

(defun my-stylus-compile-region (start end)
  (interactive "r")
  (my-stylus-compile start end))

(defun my-stylus-compile-buffer ()
  (interactive)
  (my-stylus-compile (point-min) (point-max)))


(require-package 'skewer-mode)
(skewer-setup)


(require-package 'rainbow-mode)
(require 'rainbow-mode)

(add-hook 'stylus-mode-hook (lambda () (rainbow-turn-on)))


(require-package 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)


(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))


;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(require 'web-mode)


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(exec-path-from-shell-initialize)

;; indent after deleting a tag
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))

(require-package 'restclient)

(require 'restclient)

(provide 'init-web)
