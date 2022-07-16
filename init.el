;; -*- lexical-binding: t -*-

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(require 'package)
(package-initialize)

(add-to-list 'package-archives '(("gnu" . "https://mirrors.bfsu.edu.cn/elpa/gnu/")
				 ("melpa" . "https://mirrors.bfsu.edu.cn/elpa/melpa/")
				 ("melpa-stable" . "https://mirrors.bfsu.edu.cn/elpa/stable-melpa/")
				 ("org" . "https://mirrors.bfsu.edu.cn/elpa/org/")))
	     
