(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(exec-path-from-shell flycheck pkg-info org evil dash)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Load Theme
(load-theme 'tango-dark t)

;; Full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Relative number
(setq-default display-line-numbers 'relative
      display-line-numbers-current-absolute t)

;; Disable the splash screen (to enable it agin, replace the t with 0)
; (setq inhibit-splash-screen t)

;; Enable org mode
(require 'org)

;; flycheck
(package-install 'flycheck)
(global-flycheck-mode)

(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)
