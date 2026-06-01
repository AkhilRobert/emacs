;;; init.el --- Modern Emacs Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Modern, modular Emacs configuration.

;;; Code:

;; ============================================================================
;; Package Management Setup
;; ============================================================================

;; Configure package archives
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Initialize package system
(package-initialize)

;; Bootstrap use-package (built-in Emacs 30, but ensure it's available)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ============================================================================
;; No Littering - Keep ~/.emacs.d Clean
;; ============================================================================

(use-package no-littering
  :demand t
  :config
  ;; Put auto-save files in no-littering directory
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  ;; Put custom file in no-littering directory
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;; ============================================================================
;; Basic Emacs Defaults
;; ============================================================================

;; Indentation and tabs
(setq-default tab-width 4
              indent-tabs-mode nil)  ; Use spaces, not tabs

;; File management
(setq make-backup-files nil           ; Don't create backup~ files
      auto-save-default t             ; But do auto-save
      create-lockfiles nil)           ; Don't create .# lock files

;; Better defaults
(setq ring-bell-function 'ignore      ; No bell
      read-process-output-max (* 1024 1024))  ; Increase process output (1MB)

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Scrolling
(setq scroll-margin 0
      scroll-preserve-screen-position t)

;; Mouse in terminal
(xterm-mouse-mode 1)

;; Dired
(setq dired-listing-switches "-alh"   ; Human-readable sizes
      dired-dwim-target t)            ; Guess target directory

;; Compilation
(setq compilation-scroll-output t)  ; Keep error navigation stable

;; Enable useful modes
(delete-selection-mode 1)             ; Replace selection when typing
(savehist-mode 1)                     ; Save minibuffer history
(save-place-mode 1)                   ; Remember cursor position
(recentf-mode 1)                      ; Track recent files
(global-auto-revert-mode 1)           ; Auto-revert buffers when files change

;; Recent files settings
(setq recentf-max-saved-items 100
      recentf-max-menu-items 15)

;; ============================================================================
;; Load Modules
;; ============================================================================

(defun load-module (module-name)
  "Load MODULE-NAME from the modules directory."
  (let ((module-file (expand-file-name
                      (concat "modules/" module-name ".el")
                      user-emacs-directory)))
    (if (file-exists-p module-file)
        (load module-file)
      (warn "Module not found: %s" module-file))))

;; Load modules in order (order matters for dependencies)
(load-module "my")            ; Custom utilities and functions
(load-module "appearance")    ; Theme, font, modeline, pulsar
(load-module "completion")    ; Vertico, Marginalia, Corfu, Embark
(load-module "editor")        ; Editing enhancements
(load-module "git")           ; Magit and git tools
(load-module "lsp")           ; Eglot and LSP configuration
(load-module "languages")     ; Go, Rust support
(load-module "keybindings")   ; All keybindings

;;; init.el ends here
