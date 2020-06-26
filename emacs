;;title of buffer
(setq frame-title-format "Emacs: %b %+%+ %f")
 
;; display the time
(display-time)
 
;; set font
;;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")

;; set the width and height of the window
(add-to-list 'default-frame-alist (cons 'width 115))
(add-to-list 'default-frame-alist (cons 'height 55))
 
;; don't show the toolbar
(tool-bar-mode -1)
 
;; set position of window
;;(set-frame-position (selected-frame) 50 0)
 
;; disable the generation of backup files (filename~)
(setq make-backup-files nil)
 
(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)))
 
;; dont use tabs!
(custom-set-variables
'(indent-tabs-mode nil))
(custom-set-faces)
 
;; turn off scroll bar
(scroll-bar-mode nil)
 
;; disable startup message
(setq inhibit-startup-message t)
 
;; reload .emacs
(global-set-key "\M-r" '(lambda () (interactive) (load-file "~/.emacs")))
 
;; Indent all
(defun indent-all ()
  "Indent entire buffer."
  (interactive)
  (indent-region (point-min) (point-max) nil)
  )
 
;; Reload the current file
(defun reload-file ()
  "Reload current buffer."
  (interactive)
  (find-file (buffer-name))
  )
 
(defun emacs-format-cpp ()
   "Format the whole buffer."
   (c++-mode)
   (indent-region (point-min) (point-max) nil)
   (untabify (point-min) (point-max))
   (save-buffer)
)
 
;; turn off prompting
(setq tempo-interactive nil)
 
;; key bindings
(global-set-key [f2] 'goto-line)
(global-set-key [f3] 'replace-regexp)
(global-set-key [f4] 'hexlify-buffer)
;;(global-set-key [f4] 'eshell)
(global-set-key [f5] 'ff-find-other-file)
(global-set-key [f6] 'ediff)
;;(global-set-key [f7] 'sgml-mode)
(global-set-key [f7] 'ibuffer)
(global-set-key [f8] 'ediff-revision)
(global-set-key [f9] 'ediff-directories)
(global-set-key [f10] 'indent-all)
(global-set-key [f11] 'font-lock-fontify-buffer)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key "\M-#" 'linum-mode)
 
;;----Ediff stuff----
;; Use M-x ediff-buffers or M-x ediff-files to compare two files
;; don't open up new window
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)
 
;; show files side by side
(setq ediff-split-window-function 'split-window-horizontally)
 
;; use a wide window
(add-hook 'ediff-startup-hook 'ediff-toggle-wide-display)
 
;; ignore differences in whitespace
(setq ediff-diff-options "-w")
 
;; default directory
(setq default-directory "~/")
 
;; Some new Colors for Font-lock.
(setq font-lock-mode-maximum-decoration t)
(require 'font-lock)
(setq font-lock-use-default-fonts nil)
(setq font-lock-use-default-colors nil)
(copy-face 'default 'font-lock-string-face)
(set-face-foreground 'font-lock-string-face "#0aaf0a")
(copy-face 'italic 'font-lock-comment-face)
(set-face-foreground 'font-lock-comment-face "RoyalBlue")
(copy-face 'bold 'font-lock-function-name-face)
;;(set-face-foreground 'font-lock-function-name-face "#0a20af")
(set-face-foreground 'font-lock-function-name-face "#6b9dfa")
(copy-face 'default 'font-lock-keyword-face)
(set-face-foreground 'font-lock-keyword-face "#cc5551")
(copy-face 'default 'font-lock-type-face)
(set-face-foreground 'font-lock-type-face "red")
 
;; line numbers
;;(require 'linum)
;;(global-linum-mode 1)

;; subversion support
;;(require 'psvn)
 
;; move buffers with arroow keys
(windmove-default-keybindings 'meta)
 
;; copy line - M-w
(defadvice kill-ring-save (before slick-copy activate compile)
      "When called interactively with no active region, copy a single line instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (message "Copied line")
         (list (line-beginning-position)
               (line-beginning-position 2)))))    (defadvice kill-region (before slick-cut activate compile)
      "When called interactively with no active region, kill a single line instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (list (line-beginning-position)
               (line-beginning-position 2)))))    (defadvice yank (before slick-copy activate)
      "Position point when yanking lines."
      (let ((kill (current-kill 0 t)))
        (when (eq ?\n (elt kill (1- (length kill))))
          (beginning-of-line))))
 
(setq linum-format "  %d ")

;; make mouse scrolling better
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))) (setq mouse-wheel-progressive-speed nil)

;;(load-file "~/examples/el-monokai-theme/monokai-theme.el")
;;(load-theme 'monokai t)
;;(require 'color-theme)
;;(load-file "~/tomorrow-night-theme.el")

(setq c++-default-style "linux"
      c++-basic-offset 3)
(setq c-default-style "linux"
      c-basic-offset 3)

;;(require 'ido)
;;(ido-mode 1)

(show-paren-mode 1)
(setq-default tab-width 4)

;;(add-to-list 'load-path "/")
;;(require 'go-mode)

;; golint
;;(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
;;(require 'golint)

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-to-list 'load-path "/Users/mike/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; highlight line with the cursor, preserving the colors
(require 'hl-line)
(set-face-attribute 'hl-line nil :inherit nil :background "gray80")
(global-hl-line-mode 1)