(load "~/.emacs.d/vendor/color-theme-almost-monokai.el")
(color-theme-almost-monokai)

;; agda mode
(load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda-mode locate")))

;; proof general
(load "~/.emacs.d/vendor/proofgeneral/generic/proof-site.el")

;; proof general: load tags files and autocomplet with alt-space
;;(add-hook 'proof-mode-hook
;;   (lambda () (local-set-key '(meta space) 'tag-complete-symbol)))

;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)

;; agda input mode
(require 'agda-input)
(add-hook 'proof-mode-hook
  (lambda () (set-input-method "Agda")))
;;(add-hook 'org-mode-hook
;;  (lambda () (set-input-method "Agda")))

;; highlight TAGS
(add-hook 'proof-mode-hook
  (lambda () (font-lock-add-keywords nil
     '(("\\<\\(FIXME\\|TODO\\|XXX+\\|BUG\\):" 1 font-lock-warning-face prepend)))))

(set-default-font "dejavu sans mono 10")
(set-fontset-font "fontset-default" 'unicode '("dejavu sans mono". "unicode-bmp"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(agda2-include-dirs (quote ("/home/wires/opt/agda-lib-trunk/src" ".")))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(org-startup-indented t)
 '(proof-electric-terminator-enable t)
 '(proof-follow-mode (quote follow))
 '(proof-script-fly-past-comments t)
 '(proof-three-window-enable t)
 '(scroll-bar-mode nil)
 '(size-indication-mode t))

;;(custom-set-faces
;; '(proof-locked-face ((((type x) (class color (background dark)) (:background "#228"))))))

;; markdown mode
(load "~/.emacs.d/vendor/markdown-mode.el")

;; coq + latex multimode
(load "~/.emacs.d/vendor/two-mode-mode.el")

;; on opening .lagda file drop to multi mode
(add-to-list 'auto-mode-alist '("\\.lcoq\\'" . two-mode-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
(require 'gist)

(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-b") 'ido-switch-buffer)

;; disable toolbar
(tool-bar-mode)
