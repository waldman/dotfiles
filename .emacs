;;;; Leon's .emacs file
;; Leon Waldman
;; Last edit: Fri Oct 11 17:46:24 2013

;;; Bite-Compile everything
;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;;; Package Manager
(require 'package)
;; Marmalade Repo
(add-to-list 'package-archives 
    '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Emacs Lisp Package Archive
(add-to-list 'package-archives
    '("elpa" . "http://tromey.com/elpa/"))
;; M Emacs Lisp Package Archive
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Sunrise Commander package
(add-to-list 'package-archives
    '("SC"   . "http://joseito.republika.pl/sunrise-commander/"))
(package-initialize)

;;; Enabling Evil Mode
(require 'evil)
(evil-mode 1)

;;; Main Load Path
(add-to-list 'load-path "~/.emacs.d/")

;;; Setting up Theme Color
(add-to-list 'load-path "~/.emacs.d/color-theme-twilight.el")
(require 'color-theme)
(eval-after-load "color-theme"
    (progn
        (color-theme-initialize)
        (load-file "~/.emacs.d/color-theme-twilight.el")
        (load-file "~/.emacs.d/color-theme-terminal.el")
        (setq color-theme-is-global nil)
        (color-theme-twilight)))

;;; Setting default font
(setq default-frame-alist '((font . "Monospace-10")))

;;; No Blinking Cursor
(blink-cursor-mode -1)

;;; Cursor Color
(setq evil-default-cursor t)
(set-cursor-color "#FFFF00") 

;;; WindMove
(windmove-default-keybindings)

;;; Tab default width/spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 120 4))

;;; Autosave/Backup files
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs_saves" t)))
(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;; Increase fringe size
(set-fringe-mode 11)

;;; Hilight Current Line
(require 'hl-line)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#330")

;;; Minimap
(require 'minimap)

;;; Centered Cursor Mode
(require 'centered-cursor-mode)
(setq global-centered-cursor-mode t)
(global-set-key (kbd "<Scroll_Lock>") 'centered-cursor-mode)

;;; Line Numbers
(require 'linum)
(global-linum-mode 1)

;;; Pairing
(electric-pair-mode +1)
;; (smartparens-global-mode 1)
(show-smartparens-global-mode t)
(setq sp-show-pair-delay 0)

;;; No startup msg  
(setq inhibit-startup-message t)        ; Disable startup message

;;; Disabling the toolbar and menubar
(tool-bar-mode -1)
;; (menu-bar-mode -1)

;;; VC Options
(setq vc-make-backup-files t)
(setq vc-follow-symlinks t)

;;; Hippie-Expand
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

;;; Auto-Complete
(require 'auto-complete)
(global-auto-complete-mode t)

(when
  (require 'auto-complete nil t)
  ;; (require 'auto-complete-yasnippet)
  ;; (require 'auto-complete-python)
  ;; (require 'auto-complete-css) 
  ;; (require 'auto-complete-cpp)  
  ;; (require 'auto-complete-emacs-lisp)  
  ;; (require 'auto-complete-semantic)  
  ;; (require 'auto-complete-gtags)

  (global-auto-complete-mode t)
  (setq ac-auto-start 3)
  (setq ac-dwim t)
  (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-symbols)))

;;; Debugger Bindings
(global-set-key (kbd "<f6>") 'gud-next)
(global-set-key (kbd "<f7>") 'gud-cont)
(global-set-key (kbd "<f8>") 'gud-break)
(global-set-key (kbd "<f9>") 'gud-remove)

;;; Bookmarks+
(require 'bookmark+)
(global-set-key (kbd "<f2>") 'bmkp-next-bookmark-this-file/buffer-repeat)
(global-set-key (kbd "<f3>") 'bmkp-toggle-autonamed-bookmark-set/delete)
(global-set-key (kbd "S-<f3>") 'bmkp-previous-bookmark-this-file/buffer-repeat)

;;; Ido
(require 'ido)
(ido-mode t)
(global-set-key "\C-x\C-b" 'ibuffer)

;;; Yasnippet
;;(add-to-list 'load-path "~/.emacs.d/packages")
;;(require 'yasnippet)
;;(yas-global-mode t)

;;; Icicles
(icicle-mode 1)

;;; Git Gutter
(global-git-gutter+-mode t)
(require 'git-gutter-fringe+)

;;;; Languages Settings
;;; GoLang
(require 'go-mode-load)

;;; Yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
 '(lambda ()
    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;; Lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; Python
;; Setting indent
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq auto-complete-mode t)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

;; Elpy
(elpy-enable)
(global-set-key (kbd "<f10>") 'iedit-mode)

;; Jedi
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t) 

;; 80 Column highlight
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))

;;; RPM-Spec mode
(autoload 'rpm-spec-mode "rpm-spec-mode.el" "RPM spec mode." t)
(setq auto-mode-alist (append '(("\\.spec" . rpm-spec-mode))
    auto-mode-alist))

;; Changelog
(defun my-rpm-changelog-increment-version ()
  (interactive)
  (goto-char (point-min))
  (let* ((max (search-forward-regexp rpm-section-regexp))
         (version (rpm-spec-field-value "Version" max)))
    (rpm-add-change-log-entry "")
    )
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
