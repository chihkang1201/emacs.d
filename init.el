;; INSTALL PACKAGES
;; -----------------------------------------------------------------
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(elpy-enable)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    base16-theme
    elpy
    ein))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; -----------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
(setq inferior-lisp-program "/usr/bin/clisp")
(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(setq elpy-rpc-python-command "python3")
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; -----------------------------------------------------------------
;; End of Installation

;; ---------------- IRC Configuration -----------------------------
(require 'circe)
(setq circe-network-options
      '(("Freenode"
	 :tls t
	 :nick "yijing"
	 :sasl-username "yijing"
	 :sasl-password "chihkAng12O1"
	 :channels ("#python.tw")
	 )))
;;(require 'erc-sasl)
;;  (add-to-list 'erc-sasl-server-regexp-list "irc\\.freenode\\.net")
;;  e.g. irc\\.freenode\\.net, or .* for any host
;;(defun irc ()
;;  "Connect to the freenode"
;;  (interactive)
;;  (erc :server "irc.freenode.net"
;;       :port 6697
;;       :nick "yijing"
;;       :password "chihkAng12O1"))
;; 
;;(global-set-key "\C-ci"  'irc)
;; ---------------- End of IRC configuration ----------------------

;; ---------------Theme Configuration ------------------------------
;; Note that use-package tries to defer packages if at all possible,
;; so you may need to add :demand to the use-package block
;;(let (base16-theme-256-color-source terminal))
(load-theme 'borland-blue t) ;; load base16 theme
;; ---------------End of Theme configuration -----------------------
