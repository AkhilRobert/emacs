;;; keybindings.el --- Global Keybindings -*- lexical-binding: t -*-

;;; Commentary:
;; Global keybindings that are not already covered elsewhere.

;;; Code:

(global-set-key (kbd "C-x C-k") #'kill-this-buffer)
(global-set-key (kbd "C-c C-y") #'my/copy-current-line-paste-below)

(global-set-key (kbd "C-x p d") #'project-dired)

(global-set-key (kbd "C-c c b") #'compile)
(global-set-key (kbd "C-c c r") #'recompile)

(with-eval-after-load 'compile
  (define-key compilation-mode-map (kbd "n") #'next-error)
  (define-key compilation-mode-map (kbd "p") #'previous-error))

(global-set-key (kbd "M-o") #'other-window)
(winner-mode 1)
(global-set-key (kbd "C-c <left>") #'winner-undo)
(global-set-key (kbd "C-c <right>") #'winner-redo)

(global-set-key (kbd "C-c s") #'scratch-buffer)

(provide 'keybindings)
;;; keybindings.el ends here
