;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-tritanopia))
 '(custom-safe-themes '(default))
 '(display-line-numbers 'relative)
 '(ido-use-virtual-buffers 'auto)
 '(package-selected-packages '(all-the-icons corfu drag-stuff smex)))
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
(set-face-attribute 'default nil
                    :family "JetBrainsMono NFM"
                    :height 100
                    :slant 'normal)

(keymap-global-set "C-c c" 'compile)
(keymap-global-set "M-j" 'windmove-down)
(keymap-global-set "M-l" 'windmove-right)
(keymap-global-set "M-h" 'windmove-left)
(keymap-global-set "M-k" 'windmove-up)
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
  :demand t
  :custom
  (corfu-auto nil)                 ;; Disable automatic completion
  (corfu-cycle t)                  ;; Enable cycling through candidates
  (corfu-preselect 'prompt)        ;; Preselection behavior
  (corfu-count 10)                 ;; Show up to 10 candidates
  :bind
  ("M-TAB" . completion-at-point)
  :init
  (global-corfu-mode))

;; Install and configure Cape for better completion backends
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

;; Minimal Eglot configuration for error checking only (multiple languages)
(use-package eglot
  :ensure t
  :hook
  ((python-mode haskell-mode c-mode rust-mode c++-mode) . eglot-ensure))

(provide 'init)
;;; .emacs ends here
