;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(custom-safe-themes '(default))
 '(display-line-numbers t)
 '(display-line-numbers-mode-hook '(display-line-numbers-mode-set-explicitly))
 '(global-display-line-numbers-mode t)
 '(ido-use-virtual-buffers 'auto)
 '(line-number-mode t)
 '(package-selected-packages
   '(cape cmake-mode corfu drag-stuff eglot go-mode hl-todo
	  ido-vertical-mode magit multiple-cursors ruff-format
	  rust-mode smex yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(tool-bar-mode -1)
(server-start)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)
(set-fringe-mode 10)
(global-font-lock-mode 1)
(column-number-mode t)
(toggle-truncate-lines t)
(set-face-attribute 'default nil
                    :family "Iosevka Nerd Font"
                    :height 125
                    :slant 'normal)

(keymap-global-set "C-c c" 'compile)
(keymap-global-set "M-<down>" 'windmove-down)
(keymap-global-set "M-<right>" 'windmove-right)
(keymap-global-set "M-<left>" 'windmove-left)
(keymap-global-set "M-<up>" 'windmove-up)
(keymap-global-set "C--" 'text-scale-decrease)
(keymap-global-set "C-+" 'text-scale-increase)
(keymap-global-set "C-q" 'duplicate-line)
(keymap-global-set "C-%" 'make-empty-file)
(keymap-global-set "M-<f1>" 'delete-other-windows)
(keymap-global-set "M-<f2>" 'split-window-below)
(keymap-global-set "M-<f3>" 'split-window-right)
(keymap-global-set "M-<f4>" 'find-file)
(keymap-global-set "M-<f6>" 'dired)


(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-S-k") 'org-metaup)
            (local-set-key (kbd "C-S-j") 'org-metadown)))


(dolist (dir '("~/.emacs.d/backups" "~/.emacs.d/autosaves"))
  (unless (file-exists-p dir)
    (make-directory dir t)))
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))
(setq backup-by-copying t)
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/" t)))
(setq create-lockfiles nil)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ido
  :demand t
  :init
  (setq ido-enable-flex-matching t
        ido-use-filename-at-point 'guess)
  :config
  (ido-mode t)
  (ido-everywhere t))

(add-hook 'prog-mode-hook 'flymake-mode)

(use-package flymake
  :demand t
  :hook (prog-mode . flymake-mode)
  :init
  (setq flymake-no-changes-timeout 0.3
	flymake-start-on-save-buffer t
	flymake-start-on-flymake-mode t))

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  :bind (("C-S-k" . drag-stuff-up)
         ("C-S-j" . drag-stuff-down)))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto nil)                    ; Enable auto completion popup
  (corfu-auto-delay 0.2)            ; Set delay before popup shows
  (corfu-auto-prefix 2)             ; Minimum prefix length
  :init
  (global-corfu-mode))


(use-package cape
  :ensure t
  :after corfu
  :demand t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package eglot
  :ensure t
  :hook
  ((python-mode haskell-mode c-mode rust-mode c++-mode cmake-mode go-mode yaml-mode) . eglot-ensure))

(use-package ruff-format
  :ensure t
  :hook
  (python-mode . ruff-format-minor-mode))

(use-package magit
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package ido-vertical-mode
  :ensure t
  :after ido
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only
        ido-vertical-show-count t
        ido-max-window-height 0.5))

(use-package multiple-cursors
  :ensure t
  )
(keymap-global-set "C->"  'mc/mark-next-like-this)
(keymap-global-set "C-."  'mc/skip-to-next-like-this)
(keymap-global-set "C-<"  'mc/mark-previous-like-this)
(keymap-global-set "C-,"  'mc/skip-to-previous-like-this)
(keymap-global-set "C-{"  'mc/mark-previous-lines)
(keymap-global-set "C-}"  'mc/mark-next-lines)

(use-package hl-todo
  :ensure t
  :config
  ;; Enable hl-todo globally
  (global-hl-todo-mode 1)

  ;; Customize keywords and colors
  (setq hl-todo-keyword-faces
        '(("TODO" . "#FF0000")
          ("FIXME" . "#FF0000")
          ("DEBUG" . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB" . "#1E90FF")))
  (keymap-set hl-todo-mode-map "C-c n" #'hl-todo-next)
  (keymap-set hl-todo-mode-map "C-c p" #'hl-todo-previous)
  (keymap-set hl-todo-mode-map "C-c o" #'hl-todo-occur)
  (keymap-set hl-todo-mode-map "C-c i" #'hl-todo-insert))


(provide 'init)
;;; .emacs ends here
