;;; early-init.el --- Early initialization for maximum performance -*- lexical-binding: t; -*-

;;; Commentary:
;; This file runs before init.el and package initialization.
;; Focus: Performance optimizations and UI cleanup.

;;; Code:

;; ============================================================================
;; Performance Optimizations
;; ============================================================================

;; Increase GC threshold during startup (256MB) to speed up initialization
;; We'll restore it to a reasonable value after startup in init.el
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Reduce file handler overhead during startup
;; File name handlers are used for things like remote file access (TRAMP)
;; We temporarily disable them during init for faster startup
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; ============================================================================
;; Package System Configuration
;; ============================================================================

;; Disable package.el at startup - we'll use use-package + package-vc instead
;; This prevents double initialization and speeds up startup
(setq package-enable-at-startup nil)

;; ============================================================================
;; UI Cleanup (Before Frame Creation)
;; ============================================================================

;; Disable UI elements before the first frame appears
;; This prevents flickering and makes startup look cleaner
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Disable startup screen
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name)

;; Disable initial scratch message
(setq initial-scratch-message nil)

;; ============================================================================
;; Native Compilation Settings (Emacs 30)
;; ============================================================================

;; Suppress warnings from native compilation
;; This prevents *Warnings* buffer pollution during package compilation
(setq native-comp-async-report-warnings-errors nil
      native-comp-deferred-compilation t)

;; Keep native compilation cache in ~/.emacs.d/eln-cache/
;; (Emacs 30 already does this by default, but we make it explicit)
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "eln-cache/" user-emacs-directory))))

;; ============================================================================
;; Post-Startup Restoration
;; ============================================================================

;; Restore GC settings and file handlers after initialization
(add-hook 'emacs-startup-hook
          (lambda ()
            ;; Set GC threshold to 16MB (good balance between performance and responsiveness)
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)

            ;; Restore file name handlers
            (setq file-name-handler-alist file-name-handler-alist-original)

            ;; Log startup time for debugging
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;;; early-init.el ends here
