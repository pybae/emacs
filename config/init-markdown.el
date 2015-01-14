(require-package 'markdown-mode)
(require-package 'pandoc-mode)

(add-hook 'markdown-mode-hook 'pandoc-mode)
(provide 'init-markdown)
