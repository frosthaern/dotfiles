;;; .emacs --- Your personal Emacs configuration
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a"
     "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad"
     "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d"
     "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd"
     "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad"
     "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af"
     "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641"
     "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
     "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc"
     "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1"
     "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710"
     "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2"
     "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0"
     "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882"
     "dccf4a8f1aaf5f24d2nab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0"
     "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4"
     default))
 '(display-line-numbers 'relative)
 '(ido-use-virtual-buffers 'auto)
 '(package-selected-packages
   '(all-the-icons cape corfu eglot rust-mode tree-sitter
		   tree-sitter-langs treesit-auto vertico))
 '(treesit-auto-install t nil nil "Customized with use-package treesit-auto"))
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

;; Tree-sitter configuration
(use-package tree-sitter
  :ensure t
  :config
  (when (fboundp 'global-tree-sitter-mode)
    (global-tree-sitter-mode 1))
  :init
  (defvar tree-sitter-hl-mode nil
    "Tree-sitter highlighting mode."))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter
  :config
  (when (fboundp 'tree-sitter-hl-mode)
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)))

;; hook for flymake
(add-hook 'prog-mode-hook 'flymake-mode)

;; installing auto treesitter language
(use-package treesit-auto
  :ensure t
  :config
  (when (fboundp 'global-treesit-auto-mode)
    (global-treesit-auto-mode))
  :custom
  (treesit-auto-install 'prompt))

;; for rust
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(setq treesit-font-lock-level 4)

;; download rust-mode
(use-package rust-mode
  :ensure t)
(add-to-list 'exec-path "~/.cargo/bin/")

;; lsp for c
(use-package eglot
  :ensure t
  :hook ((c-ts-mode c++-ts-mode python-ts-mode rust-ts-mode js-ts-mode) . eglot-ensure))

;; cape for completion
(use-package cape
  :ensure t
  :init
  ;; Ensure cape functions are defined
  (declare-function cape-dabbrev "cape")
  (declare-function cape-file "cape")
  (declare-function cape-symbol "cape")
  (declare-function cape-keyword "cape")
  
  (add-hook 'prog-mode-hook
          (lambda ()
              (when (fboundp 'cape-dabbrev)
                (add-to-list 'completion-at-point-functions #'cape-dabbrev))
              (when (fboundp 'cape-file)
                (add-to-list 'completion-at-point-functions #'cape-file))
              (when (fboundp 'cape-symbol)
                (add-to-list 'completion-at-point-functions #'cape-symbol))
              (when (fboundp 'cape-keyword)
                (add-to-list 'completion-at-point-functions #'cape-keyword)))))

;; completion for c and python
(use-package corfu
  :ensure t
  :init
  (when (fboundp 'global-corfu-mode)
    (global-corfu-mode))
  :custom
  (corfu-auto nil)
  (corfu-cycle t) ;; for cycling through completions
  (corfu-auto-prefix 2)   ;; Start completing after 2 chars
  (corfu-auto-delay 0.0)) ;; No delay

;; completion at point, i hate automatic completion
(keymap-global-set "M-TAB" #'completion-at-point)

;; better ido mode it seems
(use-package vertico
  :ensure t
  :init
  (when (fboundp 'vertico-mode)
    (vertico-mode))
  :custom
  (vertico-cycle t)) ;; Allows cycling through candidates

(provide 'init)
;;; .emacs ends here
