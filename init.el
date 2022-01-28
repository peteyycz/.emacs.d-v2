;; Thanks, but no thanks
(setq inhibit-startup-message t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set up plugin archives
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

; UI Customization
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(hl-line-mode 1)

(setq-default visible-bell 0
              indent-tabs-mode nil)
(set-frame-font "Jetbrains Mono 17")
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(width . 270))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil) ;; Disable dialog boxes since they weren't working in Mac OSX

(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
 
;; Save adding :ensure t on every use package
(setq use-package-always-ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
 
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))
 
(use-package expand-region
  :bind ("C-=" . er/expand-region))
 
;; Git integration
(use-package magit
  :bind ("C-x C-g" . magit-status))
 
;;; Treat all themes as safe
(setq custom-safe-themes t)
(use-package doom-themes :defer t)
(use-package gruvbox-theme
  :defer t
  :init (load-theme 'doom-one))

(use-package ivy
  :config (ivy-mode 1))

(column-number-mode 1)
(display-line-numbers-mode 1)
(dolist
    (mode '(org-mode-hook
            term-mode-hook
            eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
