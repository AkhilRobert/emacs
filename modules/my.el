;;; my.el --- Personal functions and utilities -*- lexical-binding: t -*-


;;; Commentary:
;; Various personal utilities and helper functions that don't fit into other modules.

;;; Code:
(defun my/copy-buffer-path ()
  "Copy the current buffer's file path to the clipboard."
  (interactive)
    (let ((file-path (or (buffer-file-name) default-directory)))
        (when file-path
          (kill-new file-path)
          (message "Copied path: %s" file-path))))

(provide 'my)
;;; my.el ends here
