;;=========================================================================
;;; Package Settings
;;=========================================================================
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; powerline
(setq powerline-default-separator 'wave)

;; spaceline
(spaceline-emacs-theme)
(spaceline-helm-mode)

;; anzu
(global-anzu-mode)
(setq anzu-cons-mode-line-p nil)

;; smooth-scrolling
(smooth-scrolling-mode)
(setq smooth-scroll-margin 2)

;; golden-ratio
(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)

;; beacon
(beacon-mode)
(setq beacon-size 25)

;; rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; smartparens
(smartparens-global-mode)
(require 'smartparens-config)

;; highlight-numbers
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; volatile-highlights
(volatile-highlights-mode 1)

;; avy
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "C-\"") 'avy-goto-char-2)

;; helm
(require 'helm-config)
(helm-mode)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

;; helm-swoop
(global-set-key (kbd "C-s") 'helm-swoop)

;; auto-complete
(ac-config-default)
(add-to-list 'ac-modes 'org-mode)
(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)

;; yasnippet
(yas-global-mode)
(global-set-key (kbd "C-c C-y t") 'yas-describe-tables)

;; auto-yasnippet
(global-set-key (kbd "C-c C-y c") 'aya-create)
(global-set-key (kbd "C-c C-y e") 'aya-expand)

;; neotree
(global-set-key [F8] 'neotree-toggle)

;; undo-tree
(global-undo-tree-mode)

;; goto-chg
(global-set-key (kbd "C-<") 'goto-last-change)

;; git-gutter and git-gutter-fringe
(require 'git-gutter-fringe)
(global-git-gutter-mode)
(set-face-foreground 'git-gutter-fr:added "green")
(set-face-foreground 'git-gutter-fr:deleted "red")
(set-face-foreground 'git-gutter-fr:modified "yellow")
(fringe-helper-define 'git-gutter-fr:added nil
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "XXXXXXXX"
  "XXXXXXXX"
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX...")
(fringe-helper-define 'git-gutter-fr:deleted nil
  "XXXXXXXX"
  "XXXXXXXX"
  "XXXXXXXX")
(fringe-helper-define 'git-gutter-fr:modified nil
  "XXXXXXXX"
  "XXXXXXXX"
  "........"
  "........"
  "........"
  "XXXXXXXX"
  "XXXXXXXX")

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; whole-line-or-region
(whole-line-or-region-global-mode)

;; popup-kill-ring
(global-set-key (kbd "M-y") 'popup-kill-ring)

;; move-text
(move-text-default-bindings)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; auto-highlight-symbol
(global-auto-highlight-symbol-mode 1)
(define-key auto-highlight-symbol-mode-map (kbd "<M-S-left>") nil)
(define-key auto-highlight-symbol-mode-map (kbd "<M-S-right>") nil)
(define-key auto-highlight-symbol-mode-map (kbd "M--") nil)

;; iedit
(require 'iedit)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-:") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(define-key mc/keymap (kbd "<return>") nil)

;; buffer-move
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

;; which-key
(which-key-mode)

;; flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)

;; yafolding
(add-hook 'prog-mode-hook #'yafolding-mode)
(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)
(define-key yafolding-mode-map (kbd "C-`") 'yafolding-toggle-element)

;; fill-column-indicator
(setq fci-rule-column 80)
(setq fci-rule-width 11)

;; diminish
(diminish 'anzu-mode)
(diminish 'helm-mode)
(diminish 'beacon-mode)
(diminish 'undo-tree-mode)
(diminish 'which-key-mode)
(diminish' git-gutter-mode)
(diminish 'visual-line-mode)
(diminish 'auto-revert-mode)
(diminish 'golden-ratio-mode)
(diminish 'volatile-highlights-mode)
(diminish 'whole-line-or-region-local-mode)
(diminish 'yas-minor-mode "YA")


;;=========================================================================
;;; General Settings
;;=========================================================================
;; personal information
(setq user-full-name "Qilong Liu"
      user-mail-address "liu6699002@gmail.com")

;; initial window settings
(setq initial-frame-alist
      '((width . 110)
        (height . 35)
        (font . "Consolas-10")))

(setq frame-title-format
      (format
       "%%b%%+--%d--%s@%s"
       (emacs-pid) (user-login-name) (system-name)))

;; disable startup message
(setq inhibit-startup-message t)

;; disable the display of menu/tool/scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; set theme
(load-theme 'zenburn t)
;(load-theme 'spacemacs-dark t)

;; modeline settings
; show cursor position
(column-number-mode 1)

; show time and date
(setq display-time-day-and-date t)
(display-time-mode 1)

; show file size
(size-indication-mode 1)

;; change the cursor type to bar
(setq-default cursor-type 'bar)

;; turn on highlighting current line
(global-hl-line-mode 1)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
(global-visual-line-mode 1)

;; show line numbers
(global-linum-mode 1)

;; customize the width of both fringes
(fringe-mode '(16 . 8))

;; allow one to see matching pairs of parentheses and other characters
(show-paren-mode 1)

;; make trailing whitespace at the end of a line visible
(setq-default show-trailing-whitespace t)

;; control whether tabs are used for indentation
(setq-default indent-tabs-mode nil)

;; change the indentation level for CC modes (C, C++, Java, etc.)
(setq-default c-basic-offset 4)

;; remove text in active region if inserting text
(delete-selection-mode 1)

;; let you interactively do things with buffers and files
;(ido-mode 1)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; make emacs just ask "y/n" instead
(defalias 'yes-or-no-p 'y-or-n-p)

;; enable upcase-region command
(put 'upcase-region 'disabled nil)

;; turn the alarm off totally
(setq ring-bell-function 'ignore)

;; let you move point from window to window using Shift and the arrow keys
(windmove-default-keybindings)

;; set the default directory
(setq default-directory "~/")

;; build a list of recently opened files saved across sessions
(recentf-mode 1)
(setq recentf-max-saved-items 100
      recentf-max-menu-items 100)
(run-at-time nil (* 5 60) 'recentf-save-list)

;; make all backup and autosave files go into a same place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))


;;=========================================================================
;;; Org-mode Settings
;;=========================================================================
(add-to-list 'load-path "~/.emacs.d/elpa/org-9.1.9")
(require 'org)

;; basics
(setq org-log-into-drawer t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-export-use-babel nil)
(setq org-export-with-smart-quotes t)
(setq org-directory "D:/Downloaded/Org")
(setq org-default-notes-file (concat org-directory "/capture.org"))
(global-set-key (kbd "C-c l") 'org-store-link)

;; todo
(setq org-log-done t)
(setq org-todo-keywords
      '((sequence "TODO(t!)" "STARTED(s!)" "|" "DONE(d!)")
        (sequence "|" "CANCELED(c!)")))

;; agenda
(setq org-agenda-files (list org-directory))
(global-set-key (kbd "C-c a") 'org-agenda)

;; capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("n" "Note" entry (file+headline org-default-notes-file "Notes")
         "* %?\n %i\n\n Entered on %U\n From: %a" :empty-lines 1)
        ("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n Entered on %U\n From: %a" :empty-lines 1)
        ("s" "Study")
        ("sb" "Book" entry (file+headline "D:/Downloaded/Org/study.org" "Books")
         "* TODO %?" :empty-lines 1)
        ("sp" "Paper" entry (file+headline "D:/Downloaded/Org/study.org" "Papers")
         "* TODO %?" :empty-lines 1)
        ("sc" "Course" entry (file+headline "D:/Downloaded/Org/study.org" "Courses")
         "* TODO %?" :empty-lines 1)
        ("so" "Other" entry (file+headline "D:/Downloaded/Org/study.org" "Others")
         "* TODO %?" :empty-lines 1)
        ("j" "Journal" entry (file+datetree "D:/Downloaded/Org/journal.org")
         "* %?\n %i" :empty-lines 1)))

;; babel
(org-babel-do-load-languages 'org-babel-load-languages
                             '((shell      . t)
                               (emacs-lisp . t)
                               (C          . t)
                               (calc       . t)
                               (java       . t)
                               (js         . t)
                               (python     . t)
                               (R          . t)
                               (matlab     . t)))


;;=========================================================================
;;; added after installing a package
;;=========================================================================
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (git-gutter-fringe yafolding git-gutter whole-line-or-region git-timemachine magit highlight-numbers auto-highlight-symbol diminish golden-ratio volatile-highlights spaceline spacemacs-theme zenburn-theme doom-themes htmlize buffer-move goto-chg 2048-game helm-swoop fill-column-indicator helm-mode-manager hungry-delete popup-kill-ring smooth-scrolling beacon flycheck yapfify jedi yasnippet-snippets auto-yasnippet yasnippet iedit multiple-cursors anzu helm-ag expand-region move-text rainbow-delimiters which-key moe-theme undo-tree solarized-theme smex smartparens powerline neotree indent-guide helm avy auto-complete))))

