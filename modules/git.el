;;; git.el --- Git Integration with Magit -*- lexical-binding: t -*-

;;; Commentary:
;; Git interface using Magit

;;; Code:

;; Magit - The best Git interface
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c g c" . magit-clone)
         ("C-c g b" . magit-blame)
         ("C-c g l" . magit-log-buffer-file)
         ("C-c g f" . magit-find-file))
  :custom
  ;; Refine all hunks so changed words stand out immediately while reviewing.
  (magit-diff-refine-hunk 'all)
  ;; Keep the active hunk body visually emphasized.
  (magit-diff-highlight-hunk-body t)
  ;; Don't show gravatars (performance)
  (magit-revision-show-gravatars nil)
  ;; Show word-granularity differences in current hunk
  (magit-diff-refine-ignore-whitespace t)
  ;; Automatically save files before certain operations
  (magit-save-repository-buffers 'dontask)
  ;; Display buffer in same window
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; magit-todos - Show TODOs in Magit status buffer
(use-package magit-todos
  :ensure t
  :after magit
  :custom
  ;; Scan for these keywords with optional (name) suffix
  (magit-todos-keywords-list '("TODO(akhil)" "FIXME(akhil)" "HACK(akhil)" "XXX(akhil)" "NOTE(akhil)"))
  ;; Don't scan external repositories
  (magit-todos-exclude-globs '("vendor/*" "node_modules/*" ".git/*"))
  ;; Group by keyword
  (magit-todos-group-by '(magit-todos-item-keyword))
  :config
  (magit-todos-mode 1))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode 1))

;; git-modes - Major modes for Git configuration files
(use-package git-modes
  :ensure t)

(provide 'git)
;;; git.el ends here
