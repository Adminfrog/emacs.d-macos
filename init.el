;; insomniaSalt:
;; "this is my current emacs configuration. nothing too special. now gtfo"

;; I am using M-x customize for almost everything and I prefer having these
;; things NOT here but in a spererate file that is never edited by hand.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file) ;; booyah!

;; (m)elpa
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; some stuff here might also be interesting:
;;https://download.tuxfamily.org/user42/elpa/packages/

(package-initialize)

;;;; here be things I can't live without

;; sane backups
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;;;; keybinds
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<s-f5>") 'browse-url-conkeror)
;; peace brother
(global-set-key (kbd "C-/") 'hippie-expand)


;; it baffles me how this is not the default function name.
(defun docker-ps ()
  "List docker containers."
  (interactive)
  (docker-utils-pop-to-buffer "*docker-containers*")
  (docker-container-mode)
  (tablist-revert))

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; the M-q thing
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;;(global-set-key (kbd "M-x") 'helm-M-x)
;; ^- I have tried this and did NOT like it too much, see HELM section below

;;; HELM
;; I like the idea of HELM, but that UX gives me all kinds of cancer so I give up (for now)
;; stays here as comments maybe I will try again sometime

;;(require 'helm-config)

;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

;; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t
;;       helm-echo-input-in-header-line t)

;; (setq helm-autoresize-max-height 0)
;; (setq helm-autoresize-min-height 20)
;; (helm-autoresize-mode 1)
;; (helm-mode 1)


;; experimental stuff below, 

;; let's go crazy and ditch gnome
;;(require 'exwm)
;;(require 'exwm-config)
;;(require 'exwm-systemtray)
;;(exwm-systemtray-enable)
;;  from tty, start like this:    xinit -- vt01
;;(exwm-config-default)
;;(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;;(exwm-enable-ido-workaround)

;; this helps with deamonized emacs to trigger hooks on exit. systemd will instantly restart it
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

;; eshell
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-buffer-shorthand t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (setenv "PAGER" "cat")
     (set-face-attribute 'eshell-prompt nil :foreground "#1e7990")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
               '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (setq eshell-cmpl-cycle-completions nil)

     ;; TODO: submit these via M-x report-emacs-bug
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))

(defun eshell/cds ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory "src")))


(defun eshell/cdl ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory "lib")))


(defun eshell/cdg ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory ".git")))

;; these two haven't made it upstream yet
(when (not (functionp 'eshell/find))
  (defun eshell/find (dir &rest opts)
    (find-dired dir (mapconcat (lambda (arg)
                                 (if (get-text-property 0 'escaped arg)
                                     (concat "\"" arg "\"")
                                   arg))
                               opts " "))))


(when (not (functionp 'eshell/rgrep))
  (defun eshell/rgrep (&rest args)
    "Use Emacs grep facility instead of calling external grep."
    (eshell-grep "rgrep" args t)))


(defun eshell/extract (file)
  (let ((command (some (lambda (x)
                         (if (string-match-p (car x) file)
                             (cadr x)))
                       '((".*\.tar.bz2" "tar xjf")
                         (".*\.tar.gz" "tar xzf")
                         (".*\.bz2" "bunzip2")
                         (".*\.rar" "unrar x")
                         (".*\.gz" "gunzip")
                         (".*\.tar" "tar xf")
                         (".*\.tbz2" "tar xjf")
                         (".*\.tgz" "tar xzf")
                         (".*\.zip" "unzip")
                         (".*\.Z" "uncompress")
                         (".*" "echo 'Could not extract the file:'")))))
    (eshell-command-result (concat command " " file))))


;; crashed desktop files annoy during next start
(defun desktop-owner-advice (original &rest args)
  (let ((owner (apply original args)))
    (if (and owner (/= owner (emacs-pid)))
        (and (car (member owner (list-system-processes)))
             (let (cmd (attrlist (process-attributes owner)))
               (if (not attrlist) owner
                 (dolist (attr attrlist)
                   (and (string= "comm" (car attr))
                        (setq cmd (car attr))))
                 (and cmd (string-match-p "[Ee]macs" cmd) owner))))
      owner)))
(advice-add #'desktop-owner :around #'desktop-owner-advice)


;; quicklisp slime setup
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
;;(setq slime-contribs '(slime-fancy))



;;;; eval-in-repl setup

;; Shell support
(require 'eval-in-repl-shell)
(add-hook 'sh-mode-hook
          '(lambda()
             (local-set-key (kbd "C-<return>") 'eir-eval-in-shell)))
;; Version with opposite behavior to eir-jump-after-eval configuration
(defun eir-eval-in-shell2 ()
  "eval-in-repl for shell script (opposite behavior)

This version has the opposite behavior to the eir-jump-after-eval
configuration when invoked to evaluate a line."
  (interactive)
  (let ((eir-jump-after-eval (not eir-jump-after-eval)))
    (eir-eval-in-shell)))
(add-hook 'sh-mode-hook
          '(lambda()
             (local-set-key (kbd "C-M-<return>") 'eir-eval-in-shell2)))


;; Place REPL on the left of the script window when splitting.
;;(setq eir-repl-placement 'left)

;;; ielm support (for emacs lisp)
(require 'eval-in-repl-ielm)
;; Evaluate expression in the current buffer.
(setq eir-ielm-eval-in-current-buffer t)
;; for .el files
(define-key emacs-lisp-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for *scratch*
(define-key lisp-interaction-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for M-x info
(define-key Info-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)

;; likkle convenience converting md to org (because org-mode is way superior
(defun markdown-convert-buffer-to-org ()
  "Convert the current buffer's content from markdown to orgmode format and save it with the current buffer's file name but with .org extension."
  (interactive)
  (shell-command-on-region (point-min) (point-max)
                           (format "pandoc -f markdown -t org -o %s"
                                   (concat (file-name-sans-extension (buffer-file-name)) ".org"))))


;; $PATH!!
(exec-path-from-shell-initialize)


;; Dash at point for MeckMeck

;; (add-to-list 'load-path "/path/to/dash-at-point")
;; (autoload 'dash-at-point "dash-at-point"
;;           "Search the word at point with Dash." t nil)
;; (global-set-key "\C-cd" 'dash-at-point)
;; (global-set-key "\C-ce" 'dash-at-point-with-docset)

;;;;; EOF



