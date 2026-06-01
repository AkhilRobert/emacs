;;; completion.el --- Completion framework configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Modern completion using the Vertico stack:
;; - Vertico: Vertical completion UI
;; - Marginalia: Rich annotations in minibuffer
;; - Orderless: Flexible pattern matching
;; - Company: In-buffer completion popup
;; - Embark: Contextual actions on candidates

;;; Code:

;; ============================================================================
;; Vertico - Vertical Completion UI
;; ============================================================================

(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-cycle t           ; Cycle through candidates
        vertico-count 15))        ; Number of candidates to show

;; ============================================================================
;; Orderless - Flexible Completion Matching
;; ============================================================================

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

;; ============================================================================
;; Marginalia - Rich Annotations
;; ============================================================================

(use-package marginalia
  :init
  (marginalia-mode)) ; Align annotations to the right

;; ============================================================================
;; Company - In-buffer Completion (for code)
;; ============================================================================

(defun my/company-frontends ()
  (if (and (display-graphic-p)
           (require 'company-childframe nil t)
           (fboundp 'posframe-workable-p)
           (posframe-workable-p))
      '(company-childframe-unless-just-one-frontend
        company-preview-if-just-one-frontend
        company-echo-metadata-frontend)
    '(company-pseudo-tooltip-unless-just-one-frontend
      company-preview-if-just-one-frontend
      company-echo-metadata-frontend)))

(defun my/company-setup-frontends ()
  (setq-local company-frontends (my/company-frontends)))

(use-package company
  :hook (company-mode . my/company-setup-frontends)
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-require-match nil
        company-tooltip-align-annotations t
        company-format-margin-function #'company-detect-icons-margin
        company-backends '(company-capf))

  ;; Keep manual completion available via CAPF.
  (setq tab-always-indent 'complete))

;; Cape - Completion At Point Extensions
(use-package cape
  :init
  ;; Add useful completion sources
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

;; ============================================================================
;; Embark - Contextual Actions
;; ============================================================================

(use-package embark
  :bind
  (("C-." . embark-act)         ; Pick action with completion
   ("C-;" . embark-dwim)        ; Do what I mean (smart action)
   ("C-h B" . embark-bindings)) ; Show keybindings in context
  
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; ============================================================================
;; Which-Key - Show Available Keybindings
;; ============================================================================

(use-package which-key
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5        ; Show after 0.5s
        which-key-idle-secondary-delay 0.05
        which-key-popup-type 'side-window
        which-key-side-window-location 'bottom
        which-key-side-window-max-height 0.25
        which-key-sort-order 'which-key-key-order-alpha
        which-key-allow-imprecise-window-fit nil)
  
  ;; Prefix descriptions
  (which-key-add-key-based-replacements
    "C-c c" "compile"
    "C-c e" "lsp"
    "C-c g" "git"
    "C-x p" "project"))

(provide 'completion)
;;; completion.el ends here
