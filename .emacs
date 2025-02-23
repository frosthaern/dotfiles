(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-dark+))
 '(custom-safe-themes
   '("f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1" "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "dccf4a8f1aaf5f24d2nab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" default))
 '(display-line-numbers 'relative)
 '(evil-undo-system 'undo-redo)
 '(ido-use-virtual-buffers 'auto)
 '(package-selected-packages
   '(doom-themes evil-nerd-commenter evil-org evil-collection evil treesit-auto smex ido-vertical-mode tree-sitter-langs tree-sitter all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; this is the normal shit
(tool-bar-mode -1)
(server-start)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)
(set-fringe-mode 10)
(setq visual-bell t)
(column-number-mode t)
(set-face-attribute 'default nil
		    :family "JetBrainsMono NFM"
		    :height 120 
		    :slant 'normal)

;; starting to set keybindings now
(keymap-global-set "C-c c" 'compile)
(keymap-global-set "C-x C-k" 'kill-buffer-and-window)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "C-j" 'windmove-down)
(keymap-global-set "C-l" 'windmove-right)
(keymap-global-set "C-h" 'windmove-left)
(keymap-global-set "C-k" 'windmove-up)

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

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ido shit
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(ido-everywhere 1)
(setq ido-use-filename-at-point 'guess)

;; smex init
(use-package smex
  :ensure t
  :config  (smex-initialize)
  (keymap-global-set "M-x" 'smex))

;; using treesitter because i will then get osm syntax highlighting
(unless (package-installed-p 'tree-sitter)
  (package-install 'tree-sitter))

(unless (package-installed-p 'tree-sitter-langs)
  (package-install 'tree-sitter-langs))

;; fuck lsp i don't need lsp

;; Basic tree-sitter setup
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; Enable tree-sitter globally
(global-tree-sitter-mode 1)

;; Auto-enable tree-sitter for all supported languages
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Function to automatically install missing grammars
(defun my/tree-sitter-load-grammar ()
  "Load tree-sitter grammar for the current buffer if it’s installed.
If no grammar is available, do nothing (or log a message)."
  (when (derived-mode-p 'prog-mode)
    (condition-case err
        (progn
          ;; Attempt to load the grammar for the current major mode.
          (tree-sitter-require
           (intern (replace-regexp-in-string "-mode$" "" (symbol-name major-mode))))
          (tree-sitter-mode 1))
      (error
       (message "No tree-sitter grammar available for %s" major-mode)))))


;; Add hook for automatic grammar installation
(add-hook 'prog-mode-hook #'my/tree-sitter-load-grammar)

;; doom themes
(use-package doom-themes 
  :ensure t)

;; installing auto treesitter language
(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

;; configuring)
(setq treesit-auto-install 'force)

;; making sure of the below problem
(setq evil-want-keybinding nil)

;; Install Evil and Evil-Collection
(use-package evil
  :ensure t
  :config
  (evil-mode 1))  ;; Enable Evil mode globally

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))  ;; Initialize Evil keybindings for all packages

;; Make sure keybindings work in all modes, including minibuffer
(add-hook 'minibuffer-setup-hook #'evil-local-mode)

;; Specific mode keybinding configuration
(use-package evil-org
  :ensure t
  :config
  (add-hook 'org-mode-hook #'evil-org-mode))  ; Org-mode with Evil bindings

(use-package evil-nerd-commenter
  :ensure t)  ;; Enables Evil keybindings for commenting

;; Optional: Specific keybindings for dired or other packages
(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init 'dired))  ;; Dired with Evil bindings
