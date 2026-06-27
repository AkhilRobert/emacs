;;; appearance.el --- Visual appearance configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Theme, font, modeline, and visual feedback.

;;; Code:

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-fringe-mode 0)

(add-to-list 'custom-theme-load-path user-emacs-directory)
;; (load-theme 'vscode-dark-plus t)
(load-theme 'vscode-dark-plus t)
(with-eval-after-load 'base16-onedark-theme
  (custom-theme-set-faces
   'base16-onedark
   `(whitespace-hspace ((t ,(list  :background "#282c34" :foreground "#353b45"))))
   `(whitespace-space ((t ,(list  :background "#282c34" :foreground "#353b45"))))
   `(whitespace-tab ((t ,(list :background "#282c34" :foreground "#353b45"))))))

(set-face-attribute 'default nil :font "Ubuntu Sans Mono-9.5")
;; (set-face-attribute 'default nil :font "Ubuntu Sans Mono-10.2")
;; (set-face-attribute 'default nil :font "Iosevka-10.2")
(setq-default line-spacing 0)

(set-face-attribute 'bold nil :weight 'normal)
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :weight 'normal :slant 'normal)

(custom-set-faces
 '(font-lock-keyword-face ((t (:weight normal))))
 '(font-lock-builtin-face ((t (:weight normal))))
 '(font-lock-function-name-face ((t (:weight normal))))
 '(font-lock-variable-name-face ((t (:weight normal))))
 '(font-lock-type-face ((t (:weight normal))))
 '(font-lock-constant-face ((t (:weight normal))))
 '(font-lock-comment-face ((t (:slant normal))))
 '(font-lock-doc-face ((t (:slant normal))))
 '(font-lock-string-face ((t (:slant normal)))))

(use-package pulsar
  :config
  (setq pulsar-pulse t
        pulsar-delay 0.055
        pulsar-iterations 10
        pulsar-face 'pulsar-magenta
        pulsar-highlight-face 'pulsar-yellow)
  (add-to-list 'pulsar-pulse-functions 'recenter-top-bottom)
  (add-to-list 'pulsar-pulse-functions 'move-to-window-line-top-bottom)
  (add-to-list 'pulsar-pulse-functions 'reposition-window)
  (add-to-list 'pulsar-pulse-functions 'forward-page)
  (add-to-list 'pulsar-pulse-functions 'backward-page)
  (add-to-list 'pulsar-pulse-functions 'scroll-up-command)
  (add-to-list 'pulsar-pulse-functions 'scroll-down-command)
  (add-to-list 'pulsar-pulse-functions 'windmove-right)
  (add-to-list 'pulsar-pulse-functions 'windmove-left)
  (add-to-list 'pulsar-pulse-functions 'windmove-up)
  (add-to-list 'pulsar-pulse-functions 'windmove-down)
  (pulsar-global-mode 1))

(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0.1
        show-paren-style 'mixed
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t)
  :config
  (show-paren-mode 1))

(use-package frame
  :ensure nil
  :config
  (setq window-divider-default-right-width 2
        window-divider-default-bottom-width 2
        window-divider-default-places 'right-only)
  (window-divider-mode 1))

(provide 'appearance)
;;; appearance.el ends here
