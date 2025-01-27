;; this is the normal shit
(setq custom-file "~/dotfiles/.config/emacs/custom-emacs.el")
(load custom-file)
(tool-bar-mode -1)
(server-start)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(set-fringe-mode 10)
(setq visual-bell t)
(column-number-mode t)
(set-face-attribute 'default nil :family "JetBrainsMonoNL Nerd Font Mono" :height 120)

;; starting to set keybindings now
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(windmove-default-keybindings)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key dired-mode-map "c" 'find-file)

;; autosave files and backup files and other files
(setq make-backup-files nil)
(setq autosave-default nil)
(setq create-lockfiles nil)

;; configuring melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings nil)
  :config
  (evil-mode 1))

;; ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)

;; undo tree

;; (use-package undo-tree 
;;   :ensure t
;;   :config
;;   (global-undo-tree-mode 1))

;; tab mode
(setq-default tab-width 4
         indent-tabs-mode nil)
