;; Settings
(setq-default
  create-lockfiles nil
  display-line-numbers-type 'relative
  fill-column 80
  indent-tabs-mode nil  
  inhibit-startup-message t
  tab-always-indent 'nil
  tab-width 2
  use-short-answers t   
  visible-bell nil)

(blink-cursor-mode 0)              ; Disable blinking cursor
(electric-pair-mode 1)             ; Enable auto pairing
(menu-bar-mode -1)                 ; Disable the menu bar
(scroll-bar-mode -1)               ; Disable visible scrollbar
(show-paren-mode 1)                ; Match braces
(tool-bar-mode -1)                 ; Disable the toolbar
(tooltip-mode -1)                  ; Disable tooltips
(global-display-line-numbers-mode) ; Display numbers for all buffers

;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; Using garbage magic hack.
 (use-package gcmh
   :config
   (gcmh-mode 1))
;; Setting garbage collection threshold
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Packages
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Evil
(use-package undo-fu)
(use-package key-chord
  :after evil
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-split-window-below t)
  (setq evil-split-window-right t)
  (setq evil-shift-width 2)
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>s") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>r") 'eval-buffer)

  (evil-define-key 'normal 'global (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal 'global (kbd "C-l") 'evil-window-right)
  (evil-define-key 'normal 'global (kbd "C-k") 'evil-window-up)
  (evil-define-key 'normal 'global (kbd "C-j") 'evil-window-down)
  (evil-define-key 'normal 'global (kbd "L") 'tab-bar-switch-to-prev-tab)
  (evil-define-key 'normal 'global (kbd "H") 'tab-bar-switch-to-next-tab)

  (defun my/evil-shift-right ()
    (interactive)
    (evil-shift-right evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))

  (defun my/evil-shift-left ()
    (interactive)
    (evil-shift-left evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))
  (evil-define-key 'visual global-map (kbd ">") 'my/evil-shift-right)
  (evil-define-key 'visual global-map (kbd "<") 'my/evil-shift-left)

  (evil-define-key 'motion 'global (kbd "j") 'evil-next-visual-line)
  (evil-define-key 'motion 'global (kbd "k") 'evil-previous-visual-line)

  (evil-define-key 'normal 'global (kbd "<leader>h") 'help-command)
 )
(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1))
(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode))
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

;; Ivy
(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))
  (evil-define-key 'normal 'global (kbd "<leader>/") 'swiper)
  (evil-define-key 'normal 'global (kbd "<leader>fr") 'counsel-recentf)
  (evil-define-key 'normal 'global (kbd "<leader>fb") 'buffer-menu)
  (evil-define-key 'normal 'global (kbd "-") 'counsel-find-file)
(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  (evil-define-key 'normal 'global (kbd "<leader>fp") 'counsel-projectile-switch-project)
  :custom ((projectile-completion-system 'ivy)))


;; Company
(use-package company
  :after lsp-mode
  :bind (:map company-active-map
        ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
  :config
  (global-company-mode t)
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

(use-package magit
  :commands magit-status
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
  :config
  (evil-define-key 'normal 'global (kbd "<leader>g") 'magit)

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

;; Themes
(use-package doom-themes
  :init (load-theme 'doom-dracula t))
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(defvar efs/default-font-size 100)
(defvar efs/default-variable-font-size 100)
(set-face-attribute 'default nil :font "Iosevka Term" :height efs/default-font-size)
(set-face-attribute 'variable-pitch nil :font "FiraCode Nerd Font" :height 120)

;; Bloat
(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)
