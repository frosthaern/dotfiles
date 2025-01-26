					; this is the normal shit
(setq custom-file "~/dotfiles/.config/emacs/custom-emacs.el")
(load custom-file)
(tool-bar-mode -1)
(server-start)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1x)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(set-fringe-mode 10)
(setq visual-bell t)
(setq display-line-numbers 'relative)
(column-number-mode t)
(set-face-attribute 'default nil :family "Iosevka" :height 130)
(global-hl-line-mode t)

					; some important libraries

(require 'dired-x)

					; starting to set keybindings now

(global-set-key (kbd "C-c c") 'compile)
(windmove-default-keybindings)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key dired-mode-map "c" 'find-file)

					; configuring melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

					; doom themes
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))
					; evil mode
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

					; load doom-one
(require 'evil)

					 ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)

					; doom modeline

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

					; org-mode cust
(setq org-ellipsis "⤵")
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-hide-leading-stars t)
(setq org-src-fontify-natively t)
(global-prettify-symbols-mode t)

					; undo tree
(use-package undo-tree)
					; tab mode
(setq-default tab-width 4
          indent-tabs-mode nil)

					; for completion
(ivy-mode 1)
(company-mode 1)
