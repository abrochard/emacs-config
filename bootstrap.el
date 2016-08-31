;; bootstrap.el
;; kickstart the config by pulling the latest
;; and runs babel load on the org files

(defvar my-start-time (current-time) "Time when Emacs was started")
(defvar config-no-auto-update nil)
(defvar config-load-path (file-name-directory (or load-file-name buffer-file-name)))

(if (not config-no-auto-update)
    (shell-command (concat "cd " config-load-path " && git pull")))

(package-initialize)
(require 'org)
(org-babel-load-file (concat config-load-path "configuration.org"))
(org-babel-load-file (concat config-load-path "cheatsheet.org"))

(message "Start up time %.2fs" (float-time (time-subtract (current-time) my-start-time)))

;; bootstrap.el ends here
