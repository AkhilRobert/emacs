;;; vscode-dark-plus-theme.el --- VSCode Dark+ color theme -*- lexical-binding: t; -*-

;; Author: Akhil
;; Version: 1.0
;; Package-Requires: ((emacs "30.1"))
;; Keywords: faces, themes

;;; Commentary:
;; An Emacs theme replicating the Visual Studio Code Dark+ color scheme.
;; Colors sourced from vscode.nvim dark variant (ref/vscode.nvim/lua/vscode/colors.lua).
;; Includes treesit keyword splitting (Blue/Pink) for Go, Rust, C, and C++.

;;; Code:

(deftheme vscode-dark-plus
  "Visual Studio Code Dark+ color theme.")

;; ---------------------------------------------------------------------------
;; Custom face for control-flow keywords (Pink #C586C0)
;; ---------------------------------------------------------------------------

(defface vscode-dark-plus-keyword-control
  '((t :foreground "#C586C0"))
  "Face for control-flow keywords in vscode-dark-plus theme."
  :group 'vscode-dark-plus-theme)

;; ---------------------------------------------------------------------------
;; Color Palette (all values from vscode.nvim dark variant)
;; ---------------------------------------------------------------------------

(let* (;; UI Chrome
       (vsc-back              "#1F1F1F")
       (vsc-front             "#D4D4D4")
       (vsc-left-dark         "#252526")
       (vsc-left-mid          "#373737")
       (vsc-left-light        "#636369")
       (vsc-popup-front       "#BBBBBB")
       (vsc-popup-back        "#202020")
       (vsc-popup-hl-blue     "#04395E")
       (vsc-split-dark        "#444444")
       (vsc-cursor-dark-dark  "#222222")
       (vsc-cursor-light      "#AEAFAD")
       (vsc-selection         "#264F78")
       (vsc-line-number       "#5A5A5A")
       (vsc-search            "#613315")
       (vsc-search-current    "#515c6a")
       (vsc-dim-highlight     "#51504F")

       ;; Diff / Git
       (vsc-diff-red-dark     "#4A1F24")
       (vsc-diff-red-light    "#5C262D")
       (vsc-diff-red-refine   "#7A353D")
       (vsc-diff-green-dark   "#213127")
       (vsc-diff-green-light  "#2B4031")
       (vsc-diff-green-refine "#426046")
       (vsc-diff-yellow-dark  "#3B341F")
       (vsc-diff-yellow-light "#52482A")
       (vsc-diff-context      "#181A1F")
       (vsc-diff-context-hi   "#20242C")
       (vsc-diff-file         "#20242B")
       (vsc-diff-file-hi      "#2A2F38")
       (vsc-diff-hunk         "#313844")
       (vsc-diff-hunk-hi      "#3A4352")
       (vsc-git-added         "#A9D6AF")
       (vsc-git-deleted       "#E7B4AA")

       ;; Whitespace (from sonokai: bg0 for barely-visible indicators)
       (vsc-whitespace        "#2c2e34")

       ;; Syntax
       (vsc-gray              "#808080")
       (vsc-blue              "#569CD6")
       (vsc-accent-blue       "#4FC1FF")
       (vsc-light-blue        "#9CDCFE")
       (vsc-green             "#6A9955")
       (vsc-blue-green        "#4EC9B0")
       (vsc-light-green       "#B5CEA8")
       (vsc-red               "#F44747")
       (vsc-orange            "#CE9178")
       (vsc-yellow-orange     "#D7BA7D")
       (vsc-yellow            "#DCDCAA")
       (vsc-pink              "#C586C0"))

  ;; =========================================================================
  ;; Faces
  ;; =========================================================================

  (custom-theme-set-faces
   'vscode-dark-plus

   ;; -----------------------------------------------------------------------
   ;; 3.1 Core UI: default, cursor, region, hl-line, fringe, shadow, link,
   ;;              error, success, warning
   ;; -----------------------------------------------------------------------
   `(default                          ((t (:background ,vsc-back :foreground ,vsc-front))))
   `(cursor                           ((t (:background ,vsc-cursor-light))))
   `(region                           ((t (:background ,vsc-selection))))
   `(hl-line                          ((t (:background ,vsc-cursor-dark-dark))))
   `(fringe                           ((t (:background ,vsc-back))))
   `(shadow                           ((t (:foreground ,vsc-line-number))))
   `(link                             ((t (:foreground ,vsc-blue :underline t))))
   `(error                            ((t (:foreground ,vsc-red))))
   `(success                          ((t (:foreground ,vsc-green))))
   `(warning                          ((t (:foreground ,vsc-yellow))))

   ;; -----------------------------------------------------------------------
   ;; 3.2 Line numbers
   ;; -----------------------------------------------------------------------
   `(line-number                      ((t (:foreground ,vsc-line-number :background ,vsc-back))))
   `(line-number-current-line         ((t (:foreground ,vsc-popup-front))))

   ;; -----------------------------------------------------------------------
   ;; 3.3 Mode-line / header-line
   ;; -----------------------------------------------------------------------
   `(mode-line                        ((t (:foreground ,vsc-front :background ,vsc-left-mid))))
   `(mode-line-inactive               ((t (:foreground ,vsc-front :background ,vsc-left-dark))))
   `(header-line                      ((t (:foreground ,vsc-front :background ,vsc-left-dark))))

   ;; -----------------------------------------------------------------------
   ;; 3.4 Window dividers
   ;; -----------------------------------------------------------------------
   `(vertical-border                  ((t (:foreground ,vsc-split-dark))))
   `(window-divider                   ((t (:foreground ,vsc-split-dark))))
   `(window-divider-first-pixel       ((t (:foreground ,vsc-split-dark))))
   `(window-divider-last-pixel        ((t (:foreground ,vsc-split-dark))))

   ;; -----------------------------------------------------------------------
   ;; 3.5 Minibuffer, highlight, secondary-selection
   ;; -----------------------------------------------------------------------
   `(minibuffer-prompt                ((t (:foreground ,vsc-blue))))
   `(highlight                        ((t (:background ,vsc-dim-highlight))))
   `(secondary-selection              ((t (:background ,vsc-dim-highlight))))

   ;; -----------------------------------------------------------------------
   ;; 3.6 Search / match
   ;; -----------------------------------------------------------------------
   `(isearch                          ((t (:background ,vsc-search-current))))
   `(lazy-highlight                   ((t (:background ,vsc-search))))
   `(match                            ((t (:background ,vsc-search))))

   ;; -----------------------------------------------------------------------
   ;; 3.7 Show-paren
   ;; -----------------------------------------------------------------------
   `(show-paren-match                 ((t (:background ,vsc-dim-highlight))))
   `(show-paren-mismatch              ((t (:foreground ,vsc-red))))

   ;; -----------------------------------------------------------------------
   ;; 3.8 Tooltip
   ;; -----------------------------------------------------------------------
   `(tooltip                          ((t (:background ,vsc-popup-back :foreground ,vsc-popup-front))))

   ;; -----------------------------------------------------------------------
   ;; 2.1 Font-lock syntax faces
   ;; -----------------------------------------------------------------------
   `(font-lock-keyword-face           ((t (:foreground ,vsc-blue))))
   `(font-lock-function-name-face     ((t (:foreground ,vsc-yellow))))
   `(font-lock-function-call-face     ((t (:foreground ,vsc-yellow))))
   `(font-lock-variable-name-face     ((t (:foreground ,vsc-light-blue))))
   `(font-lock-variable-use-face      ((t (:foreground ,vsc-light-blue))))
   `(font-lock-string-face            ((t (:foreground ,vsc-orange))))
   `(font-lock-comment-face           ((t (:foreground ,vsc-green))))
   `(font-lock-doc-face               ((t (:foreground ,vsc-green))))
   `(font-lock-type-face              ((t (:foreground ,vsc-blue-green))))
   `(font-lock-constant-face          ((t (:foreground ,vsc-accent-blue))))
   `(font-lock-number-face            ((t (:foreground ,vsc-light-green))))
   `(font-lock-operator-face          ((t (:foreground ,vsc-front))))
   `(font-lock-bracket-face           ((t (:foreground ,vsc-front))))
   `(font-lock-delimiter-face         ((t (:foreground ,vsc-front))))
   `(font-lock-escape-face            ((t (:foreground ,vsc-yellow-orange))))
   `(font-lock-preprocessor-face      ((t (:foreground ,vsc-pink))))
   `(font-lock-builtin-face           ((t (:foreground ,vsc-blue))))
   `(font-lock-property-name-face     ((t (:foreground ,vsc-light-blue))))
   `(font-lock-property-use-face      ((t (:foreground ,vsc-light-blue))))
   `(font-lock-warning-face           ((t (:foreground ,vsc-yellow))))
   `(font-lock-negation-char-face     ((t (:foreground ,vsc-front))))

   ;; -----------------------------------------------------------------------
   ;; 4.1 Corfu
   ;; -----------------------------------------------------------------------
   `(corfu-default                    ((t (:background ,vsc-popup-back))))
   `(corfu-current                    ((t (:background ,vsc-popup-hl-blue))))
   `(corfu-bar                        ((t (:background ,vsc-split-dark))))
   `(corfu-border                     ((t (:background ,vsc-split-dark))))
   `(corfu-annotations                ((t (:foreground ,vsc-popup-front))))
   `(corfu-deprecated                 ((t (:foreground ,vsc-line-number :strike-through t))))

   ;; -----------------------------------------------------------------------
   ;; 4.2 Vertico
   ;; -----------------------------------------------------------------------
   `(vertico-current                  ((t (:background ,vsc-popup-hl-blue))))

   ;; -----------------------------------------------------------------------
   ;; 4.3 Orderless
   ;; -----------------------------------------------------------------------
   `(orderless-match-face-0           ((t (:foreground ,vsc-blue))))
   `(orderless-match-face-1           ((t (:foreground ,vsc-pink))))
   `(orderless-match-face-2           ((t (:foreground ,vsc-blue-green))))
   `(orderless-match-face-3           ((t (:foreground ,vsc-yellow))))

    ;; -----------------------------------------------------------------------
    ;; 4.4 Magit
    ;; -----------------------------------------------------------------------
    `(magit-branch-local               ((t (:foreground ,vsc-blue))))
    `(magit-branch-remote              ((t (:foreground ,vsc-blue-green))))
    `(magit-hash                       ((t (:foreground ,vsc-line-number))))
    `(magit-tag                        ((t (:foreground ,vsc-yellow-orange))))
    `(magit-section-heading            ((t (:foreground ,vsc-yellow))))
    `(magit-section-highlight          ((t (:background ,vsc-diff-context-hi :extend t))))
    `(magit-diff-added                 ((t (:background ,vsc-diff-green-dark :foreground ,vsc-git-added :extend t))))
    `(magit-diff-added-highlight       ((t (:background ,vsc-diff-green-light :foreground ,vsc-git-added :extend t))))
    `(magit-diff-removed               ((t (:background ,vsc-diff-red-dark :foreground ,vsc-git-deleted :extend t))))
    `(magit-diff-removed-highlight     ((t (:background ,vsc-diff-red-light :foreground ,vsc-git-deleted :extend t))))
    `(magit-diff-context               ((t (:foreground ,vsc-front :background ,vsc-diff-context :extend t))))
    `(magit-diff-context-highlight     ((t (:foreground ,vsc-front :background ,vsc-diff-context-hi :extend t))))
    `(magit-diff-file-heading          ((t (:foreground ,vsc-front :background ,vsc-diff-file :extend t))))
    `(magit-diff-file-heading-highlight ((t (:foreground ,vsc-front :background ,vsc-diff-file-hi :extend t))))
    `(magit-diff-hunk-heading          ((t (:foreground ,vsc-popup-front :background ,vsc-diff-hunk :extend t))))
    `(magit-diff-hunk-heading-highlight ((t (:foreground ,vsc-front :background ,vsc-diff-hunk-hi :extend t))))
    `(magit-diff-hunk-region           ((t (:background ,vsc-selection :foreground ,vsc-front :extend t))))
    `(magit-diff-our                   ((t (:background ,vsc-diff-green-dark :foreground ,vsc-git-added :extend t))))
    `(magit-diff-our-highlight         ((t (:background ,vsc-diff-green-light :foreground ,vsc-git-added :extend t))))
    `(magit-diff-base                  ((t (:background ,vsc-diff-yellow-dark :foreground ,vsc-yellow-orange :extend t))))
    `(magit-diff-base-highlight        ((t (:background ,vsc-diff-yellow-light :foreground ,vsc-yellow :extend t))))
    `(magit-diff-their                 ((t (:background ,vsc-diff-red-dark :foreground ,vsc-git-deleted :extend t))))
    `(magit-diff-their-highlight       ((t (:background ,vsc-diff-red-light :foreground ,vsc-git-deleted :extend t))))
    `(magit-diff-whitespace-warning    ((t (:background ,vsc-red :foreground ,vsc-back :extend t))))

   ;; -----------------------------------------------------------------------
    ;; 4.4a Diff-refine (word-level highlights inside diff hunks)
    ;;      Emacs defaults are #aaffaa / #ffaaaa -- far too bright for dark themes.
    ;; -----------------------------------------------------------------------
    `(diff-refine-added                ((t (:background ,vsc-diff-green-refine))))
    `(diff-refine-removed              ((t (:background ,vsc-diff-red-refine))))
    `(diff-refine-changed              ((t (:background ,vsc-diff-yellow-light))))

   ;; -----------------------------------------------------------------------
   ;; 4.5 Doom-modeline (inherits from mode-line faces set in 3.3)
   ;; -----------------------------------------------------------------------

   ;; -----------------------------------------------------------------------
   ;; 4.6 Flymake
   ;; -----------------------------------------------------------------------
   `(flymake-error                    ((t (:underline (:style wave :color ,vsc-red)))))
   `(flymake-warning                  ((t (:underline (:style wave :color ,vsc-yellow)))))
   `(flymake-note                     ((t (:underline (:style wave :color ,vsc-blue)))))

   ;; -----------------------------------------------------------------------
   ;; 4.7 Eglot (inlay hints + semantic token faces)
   ;; -----------------------------------------------------------------------
   `(eglot-inlay-hint-face            ((t (:foreground ,vsc-line-number))))
   ;; Semantic token type faces — fix defaults that don't match vscode.nvim
   `(eglot-semantic-number            ((t (:inherit font-lock-number-face))))
   `(eglot-semantic-namespace         ((t (:inherit font-lock-type-face))))
   `(eglot-semantic-operator          ((t (:inherit font-lock-operator-face))))
   ;; Semantic token modifier faces — make "decoration-only" modifiers
   ;; transparent so they don't override the token-type color from treesit.
   ;; (readonly/deprecated/documentation keep their defaults which are correct.)
   `(eglot-semantic-declaration       ((t nil)))
   `(eglot-semantic-definition        ((t nil)))
   `(eglot-semantic-modification      ((t nil)))
   `(eglot-semantic-static            ((t nil)))
   `(eglot-semantic-abstract          ((t nil)))
   `(eglot-semantic-async             ((t nil)))

   ;; -----------------------------------------------------------------------
   ;; 4.8 Which-key
   ;; -----------------------------------------------------------------------
   `(which-key-key-face               ((t (:foreground ,vsc-yellow))))
   `(which-key-command-description-face ((t (:foreground ,vsc-blue))))
   `(which-key-separator-face         ((t (:foreground ,vsc-line-number))))

    ;; -----------------------------------------------------------------------
    ;; 4.9 Diff-mode
    ;; -----------------------------------------------------------------------
    `(diff-added                       ((t (:foreground ,vsc-git-added :background ,vsc-diff-green-dark :extend t))))
    `(diff-removed                     ((t (:foreground ,vsc-git-deleted :background ,vsc-diff-red-dark :extend t))))
    `(diff-changed                     ((t (:foreground ,vsc-yellow :background ,vsc-diff-yellow-dark :extend t))))
    `(diff-context                     ((t (:foreground ,vsc-front :background ,vsc-diff-context :extend t))))
    `(diff-indicator-added             ((t (:inherit diff-added))))
    `(diff-indicator-removed           ((t (:inherit diff-removed))))
    `(diff-indicator-changed           ((t (:inherit diff-changed))))
    `(diff-file-header                 ((t (:foreground ,vsc-front :background ,vsc-diff-file-hi :extend t))))
    `(diff-header                      ((t (:foreground ,vsc-blue :background ,vsc-diff-file :extend t))))
    `(diff-hunk-header                 ((t (:foreground ,vsc-popup-front :background ,vsc-diff-hunk :extend t))))

    ;; -----------------------------------------------------------------------
    ;; 4.11 Dired
    ;; -----------------------------------------------------------------------
    `(dired-directory                  ((t (:foreground ,vsc-blue))))
    `(dired-symlink                    ((t (:foreground ,vsc-blue-green))))
    `(dired-marked                     ((t (:foreground ,vsc-yellow))))
    `(dired-flagged                    ((t (:foreground ,vsc-red))))

    ;; -----------------------------------------------------------------------
    ;; 4.12 Whitespace (subtle, matching line-number color)
    ;; -----------------------------------------------------------------------
    `(whitespace-space                 ((t (:foreground ,vsc-whitespace :background ,vsc-back))))
    `(whitespace-tab                   ((t (:foreground ,vsc-whitespace :background ,vsc-back))))
    `(whitespace-newline               ((t (:foreground ,vsc-whitespace :background ,vsc-back))))
    `(whitespace-trailing              ((t (:foreground ,vsc-whitespace :background ,vsc-back))))
    `(whitespace-line                  ((t (:foreground ,vsc-whitespace :background ,vsc-back))))
    `(whitespace-indentation           ((t (:foreground ,vsc-whitespace :background ,vsc-back))))

    ;; -----------------------------------------------------------------------
    ;; 4.13 Markdown
    ;; -----------------------------------------------------------------------
   `(markdown-header-face-1           ((t (:foreground ,vsc-blue))))
   `(markdown-header-face-2           ((t (:foreground ,vsc-yellow))))
   `(markdown-header-face-3           ((t (:foreground ,vsc-blue-green))))
   `(markdown-header-face-4           ((t (:foreground ,vsc-pink))))
   `(markdown-header-face-5           ((t (:foreground ,vsc-light-blue))))
   `(markdown-header-face-6           ((t (:foreground ,vsc-orange))))
   `(markdown-code-face               ((t (:background ,vsc-left-dark))))
   `(markdown-inline-code-face        ((t (:foreground ,vsc-orange))))

   ;; -----------------------------------------------------------------------
   ;; 4.13 Org-mode
   ;; -----------------------------------------------------------------------
   `(org-level-1                      ((t (:foreground ,vsc-blue))))
   `(org-level-2                      ((t (:foreground ,vsc-yellow))))
   `(org-level-3                      ((t (:foreground ,vsc-blue-green))))
   `(org-level-4                      ((t (:foreground ,vsc-pink))))
   `(org-level-5                      ((t (:foreground ,vsc-light-blue))))
   `(org-level-6                      ((t (:foreground ,vsc-orange))))
   `(org-level-7                      ((t (:foreground ,vsc-light-green))))
   `(org-level-8                      ((t (:foreground ,vsc-yellow-orange))))
   `(org-code                         ((t (:foreground ,vsc-orange))))
   `(org-block                        ((t (:background ,vsc-left-dark))))
   `(org-link                         ((t (:foreground ,vsc-blue :underline t)))))

  ;; =========================================================================
  ;; 5.1 ANSI Terminal Colors
  ;; =========================================================================

  (custom-theme-set-variables
   'vscode-dark-plus
   `(ansi-color-names-vector
     [,vsc-back ,vsc-red ,vsc-green ,vsc-yellow
      ,vsc-blue ,vsc-pink ,vsc-blue-green ,vsc-front])
   ;; Level 4 enables function-call and variable-use faces needed to
   ;; match vscode.nvim's full semantic highlighting.
   '))

;; ===========================================================================
;; 6. Treesit Keyword Split
;; ===========================================================================

(defvar vscode-dark-plus--treesit-hooks nil
  "List of (hook . function) pairs installed by the theme for cleanup.")

;; ---------------------------------------------------------------------------
;; 6.1 Control-flow keyword lists per language
;; ---------------------------------------------------------------------------

(defconst vscode-dark-plus--go-control-flow
  '("if" "else" "for" "return" "switch" "case" "break" "continue"
    "default" "fallthrough" "goto" "defer" "go" "select" "range" "import")
  "Go control-flow keywords (Pink).")

(defconst vscode-dark-plus--rust-control-flow
  '("if" "else" "for" "while" "loop" "match" "return" "break"
    "continue" "await" "async" "in" "use")
  "Rust control-flow keywords (Pink).")

(defconst vscode-dark-plus--c-control-flow
  '("if" "else" "for" "while" "do" "switch" "case" "default"
    "break" "continue" "return" "goto")
  "C control-flow keywords (Pink).")

(defconst vscode-dark-plus--cpp-control-flow
  '("if" "else" "for" "while" "do" "switch" "case" "default"
    "break" "continue" "return" "goto" "try" "catch" "throw"
    "co_await" "co_return" "co_yield")
  "C++ control-flow keywords (Pink).")

;; ---------------------------------------------------------------------------
;; 6.2 Helpers to append treesit font-lock rules with :override t
;; ---------------------------------------------------------------------------

(defun vscode-dark-plus--register-feature (feature level)
  "Register FEATURE in `treesit-font-lock-feature-list' at LEVEL (0-indexed).
Does nothing if the feature is already present at that level."
  (when (and (boundp 'treesit-font-lock-feature-list)
             treesit-font-lock-feature-list
             (> (length treesit-font-lock-feature-list) level))
    (let ((existing (nth level treesit-font-lock-feature-list)))
      (unless (memq feature existing)
        (setf (nth level treesit-font-lock-feature-list)
              (append existing (list feature)))))))

(defun vscode-dark-plus--install-rules (language feature level &rest queries)
  "Append treesit override rules for LANGUAGE under FEATURE at LEVEL.
QUERIES are treesit query forms passed to `treesit-font-lock-rules'.
The rules use :override t so they take precedence over built-in rules."
  (setq treesit-font-lock-settings
        (append treesit-font-lock-settings
                (apply #'treesit-font-lock-rules
                       :language language
                       :feature feature
                       :override t
                       queries)))
  (vscode-dark-plus--register-feature feature level)
  (treesit-font-lock-recompute-features))

(defun vscode-dark-plus--install-keyword-rules (language keywords)
  "Append treesit rules for LANGUAGE to color KEYWORDS as control-flow (Pink).
KEYWORDS is a list of keyword strings."
  (vscode-dark-plus--install-rules
   language 'keyword-control 1
   (list (apply #'vector keywords)
         '@vscode-dark-plus-keyword-control)))

;; ---------------------------------------------------------------------------
;; 6.3 Mode hooks
;; ---------------------------------------------------------------------------

(defun vscode-dark-plus--setup-go-keywords ()
  "Install keyword-split and face-fix rules for `go-ts-mode'."
  (vscode-dark-plus--install-keyword-rules 'go vscode-dark-plus--go-control-flow)
  ;; Booleans + nil → Blue (keyword) instead of AccentBlue (constant)
  (vscode-dark-plus--install-rules
   'go 'boolean-keyword 1
   '([(true) (false) (nil)] @font-lock-keyword-face)))

(defun vscode-dark-plus--setup-rust-keywords ()
  "Install keyword-split and face-fix rules for `rust-ts-mode'."
  (vscode-dark-plus--install-keyword-rules 'rust vscode-dark-plus--rust-control-flow)
  ;; Booleans → Blue (keyword) instead of AccentBlue (constant)
  (vscode-dark-plus--install-rules
   'rust 'boolean-keyword 1
   '((boolean_literal) @font-lock-keyword-face)))

(defun vscode-dark-plus--setup-c-keywords ()
  "Install keyword-split and face-fix rules for `c-ts-mode'."
  (vscode-dark-plus--install-keyword-rules 'c vscode-dark-plus--c-control-flow)
  ;; true/false/NULL → Blue (keyword) instead of AccentBlue (constant)
  (vscode-dark-plus--install-rules
   'c 'boolean-keyword 1
   '([(true) (false) (null)] @font-lock-keyword-face)))

(defun vscode-dark-plus--setup-cpp-keywords ()
  "Install keyword-split and face-fix rules for `c++-ts-mode'."
  (vscode-dark-plus--install-keyword-rules 'cpp vscode-dark-plus--cpp-control-flow)
  ;; true/false/nullptr → Blue (keyword) instead of AccentBlue (constant)
  (vscode-dark-plus--install-rules
   'cpp 'boolean-keyword 1
   '([(true) (false) (null)] @font-lock-keyword-face))
  ;; namespace_identifier → Teal (type) instead of AccentBlue (constant)
  (vscode-dark-plus--install-rules
   'cpp 'namespace-face 1
   '((namespace_identifier) @font-lock-type-face))
  ;; Qualified function calls: ios::sync_with_stdio() → Yellow (function-call)
  (vscode-dark-plus--install-rules
   'cpp 'qualified-function 3
   '((call_expression
      function: (qualified_identifier
                 name: (identifier) @font-lock-function-call-face))
     ;; Also handle template function calls like std::move<T>(...)
     (call_expression
      function: (qualified_identifier
                 name: (template_function
                        name: (identifier) @font-lock-function-call-face))))))

(defun vscode-dark-plus--install-hooks ()
  "Install treesit keyword-split hooks for all supported languages."
  (dolist (pair '((go-ts-mode-hook   . vscode-dark-plus--setup-go-keywords)
                  (rust-ts-mode-hook . vscode-dark-plus--setup-rust-keywords)
                  (c-ts-mode-hook    . vscode-dark-plus--setup-c-keywords)
                  (c++-ts-mode-hook  . vscode-dark-plus--setup-cpp-keywords)))
    (add-hook (car pair) (cdr pair))
    (push pair vscode-dark-plus--treesit-hooks)))

;; ===========================================================================
;; 7. Theme Cleanup
;; ===========================================================================

;; ---------------------------------------------------------------------------
;; 7.1 Cleanup function
;; ---------------------------------------------------------------------------

(defun vscode-dark-plus--remove-hooks ()
  "Remove all treesit keyword-split hooks installed by the theme."
  (dolist (pair vscode-dark-plus--treesit-hooks)
    (remove-hook (car pair) (cdr pair)))
  (setq vscode-dark-plus--treesit-hooks nil))

;; ---------------------------------------------------------------------------
;; 7.2 Advice on disable-theme for automatic cleanup
;; ---------------------------------------------------------------------------

(defun vscode-dark-plus--on-disable (theme)
  "Clean up treesit hooks when vscode-dark-plus THEME is disabled."
  (when (eq theme 'vscode-dark-plus)
    (vscode-dark-plus--remove-hooks)))

(advice-add 'disable-theme :before #'vscode-dark-plus--on-disable)

;; Install hooks now
(vscode-dark-plus--install-hooks)

;; ===========================================================================

(provide-theme 'vscode-dark-plus)
;;; vscode-dark-plus-theme.el ends here
