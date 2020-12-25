;; You will most likely need to adjust this font size for your system!
(defvar runemacs/default-font-size 140)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height runemacs/default-font-size)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                 term-mode-hook
                 shell-mode-hook
                 eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package ivy
             :diminish
             :bind (("C-s" . swiper)
                    :map ivy-minibuffer-map
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

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package doom-modeline
             :init (doom-modeline-mode 1)
             :custom ((doom-modeline-height 15)))

(use-package doom-themes
             :init (load-theme 'doom-dracula t))

(use-package rainbow-delimiters
             :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
             :init (which-key-mode)
             :diminish which-key-mode
             :config
             (setq which-key-idle-delay 1))

(use-package ivy-rich
             :init
             (ivy-rich-mode 1))

(use-package counsel
             :bind (("M-x" . counsel-M-x)
                    ("C-x b" . counsel-ibuffer)
                    ("C-x C-f" . counsel-find-file)
                    :map minibuffer-local-map
                    ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
             :custom
             (counsel-describe-function-function #'helpful-callable)
             (counsel-describe-variable-function #'helpful-variable)
             :bind
             ([remap describe-function] . counsel-describe-function)
             ([remap describe-command] . helpful-command)
             ([remap describe-variable] . counsel-describe-variable)
             ([remap describe-key] . helpful-key))

(use-package general
             :config
             (general-create-definer rune/leader-keys
                                     :keymaps '(normal insert visual emacs)
                                     :prefix "SPC"
                                     :global-prefix "C-SPC")

             (rune/leader-keys
               "t"  '(:ignore t :which-key "toggles")
               "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package evil
             :init
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             (setq evil-want-C-i-jump nil)
             :config
             (evil-mode 1)
             (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
             (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

             ;; Use visual line motions even outside of visual-line-mode buffers
             (evil-global-set-key 'motion "j" 'evil-next-visual-line)
             (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

             (evil-set-initial-state 'messages-buffer-mode 'normal)
             (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
             :after evil
             :config
             (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
          "scale text"
          ("j" text-scale-increase "in")
          ("k" text-scale-decrease "out")
          ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(use-package projectile
             :diminish projectile-mode
             :config (projectile-mode)
             :custom ((projectile-completion-system 'ivy))
             :bind-keymap
             ("C-c p" . projectile-command-map)
             :init
             ;; NOTE: Set this to the folder where you keep your Git repos!
             (when (file-directory-p "~/development")
               (setq projectile-project-search-path '("~/development")))
             (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
             :config (counsel-projectile-mode))

(use-package magit
             :custom
             (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-magit
             :after magit)

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge)

;;; lang-rust.el --- rust integration

;;; Commentary:

;;; Code:

;; start from http://emacs-bootstrap.com/

;; rust-mode, racer, cargo

;; investigate polymode for editting doc comments
;; investigate lsp

;; macOS rust installation
;;     brew install rustup-init
;;     rustup-init  # accept defaults
;;     # (revert dotfile edits)

;; rust-mode
;; https://github.com/rust-lang/rust-mode
(use-package rust-mode
             :bind ( :map rust-mode-map
                          (("C-c C-t" . racer-describe)
                           ([?\t] .  company-indent-or-complete-common)))
             ;;(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
             ;; :bind-keymap
             ;; ([?\t] .  company-indent-or-complete-common)
             :config
             (progn
               ;; add flycheck support for rust (reads in cargo stuff)
               ;; https://github.com/flycheck/flycheck-rust
               (use-package flycheck-rust)

               ;; cargo-mode for all the cargo related operations
               ;; https://github.com/kwrooijen/cargo.el
               (use-package cargo
                            :hook (rust-mode . cargo-minor-mode)
                            :bind
                            ("C-c C-c C-n" . cargo-process-new)) ;; global binding

               ;;; https://www.reddit.com/r/rust/comments/au3z5j/emacs_lately/
               ;; rls
               ;;
               ;; error: 'rls' is not installed for the toolchain
               ;; 'stable-x86_64-unknown-linux-gnu'
               ;; To install, run `rustup component add rls --toolchain
               ;; stable-x86_64-unknown-linux-gnu`


               ;;; racer-mode for getting IDE like features for rust-mode
               ;; https://github.com/racer-rust/emacs-racer
               ;;
               ;; ;; https://github.com/racer-rust/emacs-racer#installation
               ;; rustup toolchain add nightly
               ;; rustup component add rust-src
               ;; cargo +nightly install racer
               ;;
               (use-package racer
                            :hook (rust-mode . racer-mode)
                            :config
                            (progn
                              ;; package does this by default ;; set racer rust source path environment variable
                              ;; (setq racer-rust-src-path (getenv "RUST_SRC_PATH"))
                              (defun my-racer-mode-hook ()
                                (set (make-local-variable 'company-backends)
                                     '((company-capf company-files)))
                                (setq company-minimum-prefix-length 1)
                                (setq indent-tabs-mode nil))

                              (add-hook 'racer-mode-hook 'my-racer-mode-hook)

                              ;; enable company and eldoc minor modes in rust-mode (racer-mode)
                              (add-hook 'racer-mode-hook #'company-mode)
                              (add-hook 'racer-mode-hook #'eldoc-mode)))

               (add-hook 'rust-mode-hook 'flycheck-mode)
               (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

               ;; format rust buffers on save using rustfmt
               (add-hook 'before-save-hook
                         (lambda ()
                           (when (eq major-mode 'rust-mode)
                             (rust-format-buffer))))))

(provide 'lang-rust)

;;; lang-rust.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(racer cargo flycheck-rust rust-mode which-key use-package rainbow-delimiters ivy-rich hydra helpful general forge evil-magit evil-collection doom-themes doom-modeline counsel-projectile command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
