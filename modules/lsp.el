;;; lsp.el --- Minimal lsp-mode configuration -*- lexical-binding: t -*-

;;; Commentary:
;; Keep LSP focused on definition, rename, hover docs, and signatures.

;;; Code:

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((go-mode . lsp-deferred)
         (go-ts-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (rust-ts-mode . lsp-deferred)
         (c-ts-mode . lsp-deferred)
         (c++-ts-mode . lsp-deferred)
         (lsp-mode . lsp-completion-mode)
         (lsp-mode . lsp-diagnostics-mode))
  :bind (:map lsp-mode-map
              ([remap display-local-help] . eldoc-doc-buffer))
  :init
  (setq lsp-keymap-prefix nil
        lsp-auto-configure t
        lsp-format-buffer-on-save t
        lsp-completion-provider :capf
        lsp-diagnostics-provider :flymake
        flymake-indicator-type nil
        flymake-fringe-indicator-position nil
        flymake-error-bitmap nil
        flymake-warning-bitmap nil
        flymake-note-bitmap nil
        lsp-eldoc-enable-hover t
        lsp-enable-file-watchers t
        lsp-enable-folding nil
        lsp-enable-imenu nil
        lsp-enable-indentation nil
        lsp-enable-links nil
        lsp-enable-on-type-formatting nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-headerline-breadcrumb-enable nil
        lsp-idle-delay 0.5
        lsp-keep-workspace-alive nil
        lsp-lens-enable nil
        lsp-log-io nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable t
        lsp-modeline-workspace-status-enable nil
        lsp-semantic-tokens-enable nil
        lsp-signature-auto-activate '(:on-trigger-char :on-server-request :after-completion)
        lsp-signature-function #'message
        lsp-signature-render-documentation nil)
  :config
  (define-key lsp-mode-map (kbd "C-S-SPC") nil)

  (require 'lsp-go)
  (require 'lsp-rust)
  (require 'lsp-clangd)

  ;; (setq lsp-disabled-clients '(eglot))
  (setq lsp-go-use-gofumpt nil)
  (setq lsp-rust-analyzer-server-display-inlay-hints nil)
  (setq lsp-rust-analyzer-diagnostics-enable t)

  ;; (add-hook 'lsp-mode-hook
  ;;           (lambda ()
  ;;             (flymake-mode -1)
  ;;             (when (fboundp 'lsp-diagnostics-mode)
  ;;               (lsp-diagnostics-mode -1))
  ;;             (when (bound-and-true-p eldoc-mode)
  ;;               (eldoc-mode -1)))))
  )

(provide 'lsp)
;;; lsp.el ends here
