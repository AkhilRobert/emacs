;;; editor.el --- Editing enhancements -*- lexical-binding: t; -*-

;;; Commentary:
;; Editing improvements: multiple-cursors, move-text, expand-region,
;; undo-fu, ws-butler, hl-todo, and useful functions from old config.

;;; Code:

;; ============================================================================
;; Custom Functions (Preserved from Old Config)
;; ============================================================================

(defun my/copy-current-line-paste-below ()
  "Copy the current line and paste it below, preserving cursor position."
  (interactive)
  (let ((line-text (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position))))
    (end-of-line)
    (newline)
    (insert line-text)))

;; ============================================================================
;; Multiple Cursors (Preserved from Old Config)
;; ============================================================================

(use-package multiple-cursors
  :bind (("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :config
  ;; Load mc-lists if it exists (stores cursor history)
  (setq mc/list-file (expand-file-name "mc-lists.el" user-emacs-directory)))

;; ============================================================================
;; Move Text (Preserved from Old Config)
;; ============================================================================

(use-package move-text
  :config
  ;; Use default bindings: M-up and M-down
  (move-text-default-bindings))

;; ============================================================================
;; Expand Region - Semantic Selection
;; ============================================================================

(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region)))

;; ============================================================================
;; Undo-Fu - Better Undo/Redo
;; ============================================================================

(use-package undo-fu
  :config
  ;; Increase undo limits for better history
  (setq undo-limit (* 80 1024 1024)           ; 80 MB
        undo-strong-limit (* 120 1024 1024)   ; 120 MB
        undo-outer-limit (* 360 1024 1024)))  ; 360 MB

;; Undo-Fu Session - Persist Undo History
(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (undo-fu-session-global-mode))

;; Vundo - Visual Undo Tree (Optional)
(use-package vundo
  :commands (vundo)
  :config
  (setq vundo-compact-display t))

;; ============================================================================
;; WS-Butler - Intelligent Whitespace Trimming
;; ============================================================================

(use-package ws-butler
  :hook ((prog-mode text-mode) . ws-butler-mode)
  :config
  (setq ws-butler-keep-whitespace-before-point nil))

;; ============================================================================
;; Whitespace - Show Tabs and Spaces in Code and Org Buffers
;; ============================================================================

(use-package whitespace
  :ensure nil
  :hook ((prog-mode . whitespace-mode)
         (org-mode . whitespace-mode))
  :config
  (setq whitespace-style '(face tabs spaces tab-mark space-mark)))

;; ============================================================================
;; HL-TODO - Highlight TODO/FIXME/etc
;; ============================================================================

(use-package hl-todo
  :hook ((prog-mode conf-mode) . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FFA500")  ; Orange
          ("FIXME"  . "#FF0000")  ; Red
          ("HACK"   . "#FFD700")  ; Gold
          ("NOTE"   . "#00CED1")  ; Dark Turquoise
          ("DONE"   . "#00FF00")  ; Green
          ("REVIEW" . "#FF69B4")  ; Hot Pink
          ("DEPRECATED" . "#808080"))) ; Gray
  ;; Keybindings for navigating TODOs
  (define-key hl-todo-mode-map (kbd "C-c t n") #'hl-todo-next)
  (define-key hl-todo-mode-map (kbd "C-c t p") #'hl-todo-previous)
  (define-key hl-todo-mode-map (kbd "C-c t o") #'hl-todo-occur))

;; ============================================================================
;; Better Defaults for Editing
;; ============================================================================

;; Hippie Expand (Preserved from Old Config)
(global-set-key (kbd "M-/") 'hippie-expand)

;; Configure hippie-expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Better indentation
(setq-default electric-indent-inhibit nil)

;; Subword mode - treat camelCase as separate words
(global-subword-mode 1)

;; ============================================================================
;; Visual Feedback
;; ============================================================================

;; Show column number in modeline
(column-number-mode 1)

;; ============================================================================
;; Kill Ring / Clipboard
;; ============================================================================

;; Save clipboard contents before killing
(setq save-interprogram-paste-before-kill t)

;; Make kill ring larger
(setq kill-ring-max 200)

;; Single space after period when filling
(setq sentence-end-double-space nil)

(provide 'editor)
;;; editor.el ends here
