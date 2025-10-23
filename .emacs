;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9"
     "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
     "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176"
     "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
     "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     default))
 '(display-line-numbers t)
 '(display-line-numbers-mode-hook '(display-line-numbers-mode-set-explicitly))
 '(global-display-line-numbers-mode t)
 '(ido-use-virtual-buffers 'auto)
 '(line-number-mode t)
 '(package-selected-packages
   '(cape cider clojure-mode cmake-mode corfu drag-stuff eglot go-mode
	  gruvbox-theme hl-todo magit multiple-cursors rust-mode
	  undo-tree yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-error ((t nil)))
 '(flymake-note ((t nil)))
 '(flymake-warning ((t nil))))

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
(set-face-attribute 'default nil :family "Iosevka Fixed SemiBold" :height 200 :slant 'normal)
(electric-pair-mode t)

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))


(keymap-global-set "C-c c" 'compile)
(keymap-global-set "M-j" 'windmove-down)
(keymap-global-set "M-l" 'windmove-right)
(keymap-global-set "M-h" 'windmove-left)
(keymap-global-set "M-k" 'windmove-up)
(keymap-global-set "C--" 'text-scale-decrease)
(keymap-global-set "C-+" 'text-scale-increase)
(keymap-global-set "C-q" 'duplicate-line)
(keymap-global-set "C-%" 'make-empty-file)
(keymap-global-set "M-<f1>" 'delete-other-windows)
(keymap-global-set "M-<f2>" 'split-window-below)
(keymap-global-set "M-<f3>" 'split-window-right)
(keymap-global-set "M-<f4>" 'find-file)
(keymap-global-set "M-<f6>" 'dired)
(keymap-global-set "C-x C-a" 'copy-buffer)


;; Make sure to cursor-shit package is installed
(keymap-global-set "C->"  'mc/mark-next-like-this)
(keymap-global-set "C-."  'mc/skip-to-next-like-this)
(keymap-global-set "C-<"  'mc/mark-previous-like-this)
(keymap-global-set "C-,"  'mc/skip-to-previous-like-this)
(keymap-global-set "C-{"  'mc/mark-previous-lines)
(keymap-global-set "C-}"  'mc/mark-next-lines)



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

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t))

(use-package ido
  :demand t
  :init
  (setq ido-enable-flex-matching t
        ido-use-filename-at-point 'guess)
  :config
  (ido-mode t)
  (ido-everywhere t))

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  :bind (("C-S-k" . drag-stuff-up)
         ("C-S-j" . drag-stuff-down)))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto nil)                  ; Enable auto completion popup
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

(use-package eglot
  :ensure t
  :hook
  ((python-mode haskell-mode c-mode rust-mode c++-mode cmake-mode go-mode yaml-mode) . eglot-ensure)
  :config
  (setq eglot-inlay-hints-mode nil))

(use-package magit
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package multiple-cursors
  :ensure t)

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


;; personal functions
(defun copy-buffer ()
  (interactive)
  (save-excursion (kill-ring-save (point-min) (point-max))))

(provide 'init)
;;; .emacs ends here
