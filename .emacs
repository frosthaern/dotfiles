;;; .emacs --- Your personal Emacs configuration
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes '(default))
 '(display-line-numbers 'relative)
 '(ido-use-virtual-buffers 'auto)
 '(package-selected-packages '(all-the-icons cape haskell-mode rust-mode smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; this is the normal configuration
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
                    :family "Iosevka NFM"
                    :height 140
                    :slant 'normal)

;; starting to set keybindings now
(keymap-global-set "C-c c" 'compile)
(keymap-global-set "C-x C-k" 'kill-buffer-and-window)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "M-j" 'windmove-down)
(keymap-global-set "M-l" 'windmove-right)
(keymap-global-set "M-h" 'windmove-left)
(keymap-global-set "M-k" 'windmove-up)


;; making sure these dirs exist
(dolist (dir '("~/.emacs.d/backups" "~/.emacs.d/autosaves"))
  (unless (file-exists-p dir)
    (make-directory dir t)))
    
;; for backup and autosaving
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))
(setq backup-by-copying t) ;; Avoid file renaming for backups
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/" t)))
;; disable lockfiles
(setq create-lockfiles nil)

;; configuring melpa and installing package thing
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

;; ido configuration
(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(ido-everywhere 1)
(setq ido-use-filename-at-point 'guess)
(add-hook 'prog-mode-hook 'flymake-mode)

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
