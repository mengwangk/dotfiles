;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Koh Meng Wang"
      user-mail-address "mengwangk@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; they are implemented.

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how

;; magit
;(global-set-key (kbd "C-x g") 'magit-status)

;; fzf
;(global-set-key (kbd "C-x C-f") 'counsel-fzf)

;; Org mode by default
(setq-default major-mode 'org-mode)

;; projectile
(setq projectile-project-search-path '("~/workspace/development"))

;; evil mode terminal
(use-package! evil-terminal-cursor-changer
  :hook (tty-setup . evil-terminal-cursor-changer-activate))


(defun insertline-before ()             ;; Every extension is a function
  "Inserts a line prior to the cursor." ;; Describe the function for fun.
  (interactive)                         ;; This can be called from M-x
  (let ( (current-spot (point) ) )      ;; Store the position of the cursor
    (move-beginning-of-line 1)          ;; Move cursor to front of line, Duh.
    (newline)                           ;; New line
    (goto-char current-spot)            ;; Go back to where we were... Oh no.
    (forward-char)))                    ;; We need to move forward since we
                                        ;; inserted a new line.
(global-set-key (kbd "C-S-o")  'insertline-before)
