;;; languages.el --- Programming Language Configurations -*- lexical-binding: t -*-

;;; Commentary:
;; Language-specific configurations for Go and Rust with tree-sitter support

;;; Code:

;; Go Mode
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook ((go-mode . subword-mode))
  :custom
  ;; Use goimports instead of gofmt
  (gofmt-command "goimports")
  (gofmt-show-errors nil))

;; Rust Mode
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  :hook ((rust-mode . subword-mode))
  :custom
  (rust-format-on-save nil)
  (rust-format-show-buffer nil)
  :config
  (set-face-attribute 'rust-string-interpolation nil :slant 'normal))

;; Compilation buffer colorization (preserved from old config)
(defun my/colorize-compilation-buffer ()
  "Colorize the compilation buffer."
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region compilation-filter-start (point)))))

(add-hook 'compilation-filter-hook #'my/colorize-compilation-buffer)

;; Smart compile command: detect project type and set a sensible default
(defun my/set-compile-command ()
  "Set compile-command based on the nearest project root marker."
  (cond
   ((locate-dominating-file default-directory "Cargo.toml")
    (setq-local compile-command "cargo check "))
   ((locate-dominating-file default-directory "go.mod")
    (setq-local compile-command "go build ./... "))
   ((locate-dominating-file default-directory "Makefile")
    (setq-local compile-command "make "))))

(add-hook 'prog-mode-hook #'my/set-compile-command)

;; TOML mode for Cargo.toml and other config files
(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

;; YAML mode
(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

;; JSON mode
(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :custom
  (json-reformat:indent-width 2))

;; Markdown mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :custom
  (markdown-command "multimarkdown")
  (markdown-fontify-code-blocks-natively t))

;; Set tabs for Go (Go uses tabs)
(add-hook 'go-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode t)
            (setq-local tab-width 4)))


;; Set spaces for Rust (Rust uses spaces)
(add-hook 'rust-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)
            (setq-local tab-width 4)
            (setq-local rust-indent-offset 4)))

(provide 'languages)
;;; languages.el ends here
