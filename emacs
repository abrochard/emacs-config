(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ce371b56cf0952d838db6dafd92aaa6e3aadd74199c06ed7440da9df5595c4ae" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "118717ce0a2645a0cf240b044999f964577ee10137b1f992b09a317d5073c02d" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" default)))
 '(ecb-options-version "2.40")
 '(global-auto-complete-mode t)
 '(minimap-window-location (quote right)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

(add-hook 'sgml-mode-hook
        (lambda ()
          ;; Default indentation to 2, but let SGML mode guess, too.
          (set (make-local-variable 'sgml-basic-offset) 4)
          (sgml-guess-indent)))

;; automation stuff
(add-hook 'php-mode-hook 'flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))

;; modes
(show-paren-mode 1)
(electric-pair-mode 1)

(require 'yasnippet)
(yas-global-mode 1)
(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; flycheck
(require 'flycheck)
(flycheck-mode 1)

(require 'psvn)
(load-file "~/.emacs.d/psvn.el")

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'avy-goto-char)

(require 'helm)
(define-key global-map (kbd "M-s M-w") 'helm-occur)

;; remap
;;(setq mac-option-modifier nil
;;      mac-command-modifier 'meta
;;      x-select-enable-clipboard t)

;;(global-set-key (kbd "C-\'") (kbd "{"))
;;(global-set-key (kbd "C-=") (kbd "}"))
;;(global-set-key (kbd "²") (kbd "<"))

;; to quickly revert a buffer
(define-key global-map (kbd "C-c r") 'revert-buffer)

;; scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; ecb layout
(setq ecb-layout-name "left3")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)

;; aliases
(defalias 'qrr 'quickrun-region)
(defalias 'fff 'fiplr-find-file)
(defalias 'ffd 'fiplr-find-directory)

;; fuzzy search
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/workspace/")(fiplr-find-file)))

;; theme
(require 'dracula-theme)
(load-theme 'dracula t)

;; smex
(require 'smex)
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

(exec-path-from-shell-copy-env "PATH")


;; easy xml format
(require 'sgml-mode)

(defun reformat-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))

;; go format hook
(require 'go-mode)
(add-hook 'before-save-hook #'gofmt-before-save)

;; org mode underscore
(setq org-export-with-sub-superscripts nil)

;; win-switch
(require 'win-switch)
(global-set-key (kbd "C-x o") 'win-switch-dispatch)
(win-switch-setup-keys-default)

;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; multiple cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; python setup
(require 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(setq python-shell-interpreter "~/anaconda/bin/ipython")

;; which-key
(require 'which-key)
(which-key-mode 1)

(provide '.emacs)
;;; .emacs end here
