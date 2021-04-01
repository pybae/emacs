(require 'ido)
(setq ido-enable-prefix nil)
(setq ido-use-virtual-buffers t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-save-directory-list-file (concat user-emacs-directory ".cache/ido.last"))

(require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)

(ido-vertical-mode t)
(ido-mode t)
(ido-everywhere t)

(require-package 'flx-ido)
(flx-ido-mode t)

(require-package 'smex)
(require 'smex)
(setq smex-save-file (concat user-emacs-directory ".cache/smex-items"))
(smex-initialize)


(provide 'init-ido)
