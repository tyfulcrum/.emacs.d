;; -*- lexical-binding: t -*-
(require 'package)
(package-initialize)

(setenv "LIBRARY_PATH"
	"/opt/local/lib/gcc11:/opt/local/lib/libgcc:/opt/local/lib/gcc11/gcc/x86_64-apple-darwin21/11.3.0")
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

(tool-bar-mode -1)
(setq display-line-numbers 'relative)

(setq package-archives '(("gnu" . "https://mirrors.bfsu.edu.cn/elpa/gnu/")
			  ("melpa" . "https://mirrors.bfsu.edu.cn/elpa/melpa/")
			  ("melpa-stable" . "https://mirrors.bfsu.edu.cn/elpa/stable-melpa/")
			  ("org" . "https://mirrors.bfsu.edu.cn/elpa/org/")
			  ))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package helm
	     :bind (("M-x" . helm-M-x)
		    ("C-x C-f" . helm-find-files))
	     :config
	     (helm-mode 1))

(use-package company
	     :hook (after-init . global-company-mode)
	     :config
	     (setq company-tooltip-align-annotations t
		   company-tooltip-limit 20
		   company-show-numbers t
		   company-idle-delay .2
		   company-minimum-prefix-length 1
		   ))

(use-package flycheck
	     :init
	     (setq flycheck-emacs-lisp-load-path 'inherit)
	     :config
	     (global-flycheck-mode))

(use-package magit)

(add-to-list 'exec-path "/opt/local/bin")

(use-package geiser-chez)
(use-package paredit)

(use-package lsp-mode
  :commands (lsp)
  :hook ((python-mode . lsp))
  :init
  (setq lsp-auto-configure t
	lsp-auto-guess-root t
	lsp-idle-delay 0.500
	lsp-session-file "~/.emacs.d/.cache/lsp-sessions")
  )

(use-package lsp-ui
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-references] . lsp-ui-peek-find-references)
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	("C-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)
  :init(setq lsp-enable-symbol-highlighting t
	     lsp-ui-doc-enable t
	     lsp-lens-enable t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(paredit geiser-chez lsp-ui lsp-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
