;; Set up package.el to work with MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Load Theme
(load-theme 'tango-dark t)

;; Required by flycheck
(unless (package-installed-p 'exec-path-from-shell)
    (package-install 'exec-path-from-shell))

;; Full screen
; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable the splash screen (to enable it agin, replace the t with 0)
; (setq inhibit-splash-screen t)

;; Relative number
(setq-default display-line-numbers 'relative
      display-line-numbers-current-absolute t)

;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Enable org mode
(require 'org)

;; flycheck
(unless (package-installed-p 'flycheck)
    (package-install 'flycheck))
(global-flycheck-mode)

;; magit
(unless (package-installed-p 'magit)
  (package-install 'magit))
(global-set-key (kbd "C-x g") 'magit-status)


; (setq inhibit-splash-screen t
;       initial-scratch-message nil
;       initial-major-mode 'org-mode)
(setq initial-major-mode 'org-mode)
