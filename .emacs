(require 'xcscope)

(global-font-lock-mode 1)
(show-paren-mode 1)

;Show trailing whitespaces
(setq-default show-trailing-whitespace t)

; don't show startup messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

; show column numbers
(column-number-mode t)

;Delete trailing whitespace
(global-set-key (kbd "M-d") 'delete-trailing-whitespace)

;Going to a particular line
(global-set-key (kbd "M-g") 'goto-line)

; Hide or show blocks
(add-hook 'c-mode-common-hook
 (lambda()
  (local-set-key (kbd "C-c <right>") 'hs-show-block)
  (local-set-key (kbd "C-c <left>")  'hs-hide-block)
  (local-set-key (kbd "C-c <up>")    'hs-hide-all)
  (local-set-key (kbd "C-c <down>")  'hs-show-all)
  (hs-minor-mode t)))

;; Tab-width
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)


;; whitespace-mode
(require 'whitespace)
(setq whitespace-style
  (quote (face trailing tab-mark lines-tail)))
(setq whitespace-line-column 80)
(set-face-attribute 'whitespace-line nil :background "cyan" :foreground "white")
(global-whitespace-mode 1)

;; auto-wrap on C files
;;(setq-default fill-column 80)
(add-hook 'c-mode-hook
          (lambda ()
            (set-fill-column 80)))
(add-hook 'c-mode-hook 'turn-on-auto-fill)

(add-hook 'text-mode-hook
          (lambda ()
            (set-fill-column 70)))
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; Manual Tab
(global-set-key (kbd "C-c TAB") 'insert-tab-char)
(defun insert-tab-char ()
  (interactive)
  (insert "\t")
)

(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))


(setq emerge-diff-options "--ignore-all-space")

; Git commit mode and hooks for it
(define-minor-mode git-committing-mode
  "dummy")
(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . git-committing-mode))
(add-hook 'git-committing-mode-hook
          (lambda ()
            (set-fill-column 70)))
(add-hook 'git-committing-mode-hook 'turn-on-auto-fill)

