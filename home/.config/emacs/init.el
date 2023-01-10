;; Settings
(setq-default
  create-lockfiles nil
  display-line-numbers-type 'relative
  fill-column 80
  indent-tabs-mode nil  
  inhibit-startup-message t
  make-backup-files nil
  tab-always-indent 'nil
  tab-width 2
  sh-basic-offset 2
  use-short-answers t   
  visible-bell nil)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(defalias 'yes-or-no-p 'y-or-n-p)

(setq indent-line-function 'insert-tab)
(defun my/display-numbers-hook ()
  (display-line-numbers-mode 1)
  )
(add-hook 'prog-mode-hook 'my/display-numbers-hook)

(blink-cursor-mode 0)              ; Disable blinking cursor
(electric-pair-mode 1)             ; Enable auto pairing
(menu-bar-mode -1)                 ; Disable the menu bar
(scroll-bar-mode -1)               ; Disable visible scrollbar
(show-paren-mode 1)                ; Match braces
(tool-bar-mode -1)                 ; Disable the toolbar
(tooltip-mode -1)                  ; Disable tooltips

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
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

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
  (setq evil-vsplit-window-right t)
  (setq evil-shift-width 2)
  :config
  (evil-mode 1)
 )
(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-goggles
  :after evil
  :ensure t
  :config
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))
  (setq evil-goggles-duration 0.08)

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init)

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
  (evil-define-key 'visual 'global (kbd ">") 'my/evil-shift-right)
  (evil-define-key 'visual 'global (kbd "<") 'my/evil-shift-left)

  (evil-define-key 'motion 'global (kbd "j") 'evil-next-visual-line)
  (evil-define-key 'motion 'global (kbd "k") 'evil-previous-visual-line)

  (evil-define-key 'normal 'global (kbd "<leader>h") 'help-command)

  (evil-define-key 'normal 'global (kbd "<leader>x") 'ispell-word)

  (evil-define-key 'normal 'global (kbd "<leader>t") 'vterm-toggle-cd)

  (evil-define-key 'normal lsp-mode (kbd "<leader>l") lsp-command-map)
  )

;; Ivy
(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
         ("<backtab>" . ivy-previous-line)
         ("TAB" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-j" . ivy-next-line)
         ("C-l" . ivy-partial-or-done)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-j" . ivy-next-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-j" . ivy-next-line)
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
  (evil-define-key 'normal 'global (kbd "<leader>fb") 'counsel-ibuffer)
  (evil-define-key 'normal 'global (kbd "<leader>ff") 'counsel-find-file)
(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  (evil-define-key 'normal 'global (kbd "<leader>fp") 'counsel-projectile-switch-project)
  :custom ((projectile-completion-system 'ivy)))

;; LSP
(use-package lsp-mode
  :hook
  ((python-mode . lsp)
  (cpp-mode . lsp))
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy)

;; Org
(require 'org-tempo)
(add-hook 'org-mode-hook (lambda ()
           (setq-local electric-pair-inhibit-predicate
                   `(lambda (c)
                  (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(defun my/org-mode-setup ()
  (org-indent-mode)
  (org-autolist-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun my/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil :font "Roboto" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . my/org-mode-setup)
  :config
  (my/org-font-setup)
  (evil-define-key 'normal 'global (kbd "]h") 'org-next-visible-heading)
  (evil-define-key 'normal 'global (kbd "[h") 'org-previous-visible-heading)
  (evil-define-key 'normal 'global (kbd "]i") 'org-next-item)
  (evil-define-key 'normal 'global (kbd "[i") 'org-previous-item)
  (evil-define-key 'normal 'global (kbd "[-") 'org-cycle-list-bullet)
)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-autolist
  :hook (org-mode . org-autolist-mode))

(defun my/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . my/org-mode-visual-fill))

;; Completion
(use-package corfu
  :custom
  (corfu-cycle t)                 ; Allows cycling through candidates
  (corfu-auto t)                  ; Enable auto completion
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-echo-documentation 0.25) ; Enable documentation for completions
  (corfu-preview-current 'insert) ; Do not preview current candidate
  (corfu-preselect-first nil)
  (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets

  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("M-SPC" . corfu-insert-separator)
              ("TAB"     . corfu-next)
              ([tab]     . corfu-next)
              ("S-TAB"   . corfu-previous)
              ([backtab] . corfu-previous)
              ("S-<return>" . corfu-insert))
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  :config
  (setq tab-always-indent 'complete)
  (add-hook 'eshell-mode-hook
            (lambda () (setq-local corfu-quit-at-boundary t
                              corfu-quit-no-match t
                              corfu-auto nil)
              (corfu-mode))))

(use-package cape
  :defer 10
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (defalias 'dabbrev-after-2 (cape-capf-prefix-length #'cape-dabbrev 2))
  (add-to-list 'completion-at-point-functions 'dabbrev-after-2 t)
  (cl-pushnew #'cape-file completion-at-point-functions)
  :config
  ;; Silence then pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))

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

(use-package vterm-toggle
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
              '((lambda (buffer-or-name _)
                    (let ((buffer (get-buffer buffer-or-name)))
                      (with-current-buffer buffer
                        (or (equal major-mode 'vterm-mode)
                            (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.3))))

;; Themes
(use-package doom-themes
  :init (load-theme 'doom-dracula t))
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
  :config
  (setq column-number-mode t)

(set-face-attribute 'default nil :font "Iosevka Term" :height 100)
(set-face-attribute 'variable-pitch nil :font "FiraCode Nerd Font" :height 110)

;; Bloat
(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)
