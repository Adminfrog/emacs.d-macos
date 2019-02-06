(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote luatex))
 '(browse-url-browser-function (quote browse-url-conkeror))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (Doughlaff)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "ad1e1d4fd0b19a4627de1753835e57566a7941ba3e726d57a40d4864ec69546b" default)))
 '(desktop-save-mode t)
 '(display-time-default-load-average 0)
 '(display-time-mode t)
 '(enable-kinsoku t)
 '(erc-autojoin-channels-alist (quote (("irc.freenode.net" "#emacs" "#conkeror" "#go-nuts"))))
 '(erc-autojoin-timing (quote ident))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp)))
 '(erc-nick "insomniaSalt")
 '(erc-nickserv-passwords (quote ((freenode (("insomniaSalt" . "xxxxxx"))))))
 '(erc-prompt-for-nickserv-password t)
 '(erc-services-mode t)
 '(erc-system-name "GNU Emacs 26.1")
 '(erc-track-mode nil)
 '(erc-user-full-name "Justin Case")
 '(fci-rule-color "red")
 '(fci-rule-use-dashes t)
 '(fci-rule-width 2)
 '(fill-column 79)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (describe-symbol . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (disassemble . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-default-find-tag)
     (org-capture . helm-org-completing-read-tags)
     (org-set-tags . helm-org-completing-read-tags)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file . ido)
     (find-file-at-point . helm-completing-read-sync-default-handler)
     (ffap . helm-completing-read-sync-default-handler)
     (execute-extended-command . ido)
     (dired-do-rename . helm-read-file-name-handler-1)
     (dired-do-copy . helm-read-file-name-handler-1)
     (dired-do-symlink . helm-read-file-name-handler-1)
     (dired-do-relsymlink . helm-read-file-name-handler-1)
     (dired-do-hardlink . helm-read-file-name-handler-1)
     (switch-to-buffer . ido))))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(nyan-mode t)
 '(org-babel-load-languages (quote ((awk . t) (emacs-lisp . t) (shell . t))))
 '(package-selected-packages
   (quote
    (dash-at-point go-direx go-gopath go-rename go-scratch go-stacktracer go-tag golden-ratio google csv csv-mode go-complete go-eldoc go-errcheck go-fill-struct mbsync 0xc org vagrant vagrant-tramp neotree flymake-go go-autocomplete auto-complete exec-path-from-shell eval-in-repl bash-completion fill-column-indicator markdown-preview-mode markdown-mode+ markdown-preview-eww aws-snippets clojure-mode common-lisp-snippets go-snippets yasnippet hardcore-mode go-guru go-playground golint go-mode docker docker-api docker-compose-mode dockerfile-mode haskell-mode lorem-ipsum elixir-mode elpy pyvenv gpastel desktop+ desktop-environment slime slime-docker magithub god-mode eshell-fixed-prompt eshell-git-prompt pulseaudio-control exwm-edit eyebrowse auctex kubernetes kubernetes-tramp exwm conkeror-minor-mode cpputils-cmake disaster flymake-cppcheck format-all function-args google-c-style lua-mode flylisp fennel-mode sudo-edit nyan-mode rainbow-mode solarized-theme)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tooltip-use-echo-area nil)
 '(transient-mark-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "dark slate gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Source Code Pro for Powerline"))))
 '(font-lock-builtin-face ((t (:foreground "royal blue"))))
 '(font-lock-comment-face ((t (:foreground "dark goldenrod"))))
 '(font-lock-string-face ((t (:foreground "forest green" :slant italic))))
 '(mode-line-inactive ((t (:background "#0c5770" :foreground "#2a90aa"))))
 '(org-document-title ((t (:foreground "midnight blue" :weight bold :height 1.5))))
 '(show-paren-match ((t (:background "gold" :foreground "cyan" :weight bold))))
 '(show-paren-mismatch ((t (:background "red" :foreground "white"))))
 '(tooltip ((t (:inherit variable-pitch :background "sandy brown" :foreground "black"))))
 '(vertical-border ((t (:foreground "deep sky blue")))))
