;;=========================================================================
;;; Package Settings
;;=========================================================================
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; load path setup
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; theme
(load-theme 'zenburn t)
;(load-theme 'spacemacs-dark t)
;(load-theme 'gruvbox-light-hard t)

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

;; popwin
(require 'popwin)
(popwin-mode 1)
(push '(Buffer-menu-mode :noselect t) popwin:special-display-config)

;; beacon
(beacon-mode)
(setq beacon-size 25)
(setq beacon-color "#F8C471")

;; rainbow-mode
(setq rainbow-x-colors nil)
(add-hook 'prog-mode-hook 'rainbow-mode)

;; rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; rainbow-identifiers
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;; smartparens
(smartparens-global-mode)
(require 'smartparens-config)

;; smart-forward
(require 'smart-forward)
(global-set-key (kbd "<C-M-up>") 'smart-up)
(global-set-key (kbd "<C-M-down>") 'smart-down)
(global-set-key (kbd "<C-M-left>") 'smart-backward)
(global-set-key (kbd "<C-M-right>") 'smart-forward)

;; hlinum
(hlinum-activate)
(set-face-foreground 'linum-highlight-face "black")
(set-face-background 'linum-highlight-face "#FBB117")

;; highlight-numbers
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; highlight-indentation
(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

;; volatile-highlights
(volatile-highlights-mode 1)

;; iy-go-to-char
(require 'iy-go-to-char)
(setq iy-go-to-char-override-local-map nil)
(global-set-key (kbd "C-c f") 'iy-go-up-to-char)
(global-set-key (kbd "C-c b") 'iy-go-up-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

;; avy
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "C-\"") 'avy-goto-char-2)
(global-set-key (kbd "C-|") 'avy-goto-line)

;; avy-zap
(global-set-key (kbd "M-z") 'avy-zap-to-char-dwim)
(global-set-key (kbd "M-Z") 'avy-zap-up-to-char-dwim)

;; ace-window
(global-set-key (kbd "C-x o") 'ace-window)

;; helm
(require 'helm-config)
(helm-mode 1)
(setq-default helm-display-buffer-default-height 16)
(setq helm-default-display-buffer-functions '(display-buffer-in-side-window))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

;; helm-swoop
(defvar helm-display-help-buffer-regexp '("*.*Helm.*Help.**"))
(defvar helm-display-buffer-regexp
  `("*.*helm.**"
    (display-buffer-in-side-window)
    (inhibit-same-window . t)
    (side . bottom)
    (window-height . 0.4)))
(defun display-helm-window (buffer &optional resume)
  (let ((display-buffer-alist
         (list helm-display-help-buffer-regexp
               helm-display-buffer-regexp)))
    (helm-default-display-buffer buffer)))
(setq helm-swoop-split-window-function 'display-helm-window)
(global-set-key (kbd "C-s") 'helm-swoop)

;; auto-complete
(ac-config-default)
(add-to-list 'ac-modes 'org-mode)
(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

;; company
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(dolist (pyhook '(python-mode-hook
                  inferior-python-mode-hook))
  (add-hook pyhook
            (lambda()
              (auto-complete-mode -1)
              (company-mode)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-anaconda
                             company-capf
                             company-yasnippet
                             company-dabbrev
                             company-keywords
                             company-files)))))

;; ac-company
(require 'ac-company)
;(ac-company-define-source ac-source-company-elisp company-elisp
;                          (symbol . "z"))
;(add-hook 'emacs-lisp-mode-hook
;          (lambda ()
;            (add-to-list 'ac-sources 'ac-source-company-elisp)))

;; yasnippet
(yas-global-mode)
(global-set-key (kbd "C-c y t") 'yas-describe-tables)

;; yasnippet-snippets
;; NOTE: need to delete "param-comment", "return-comment",
;;       "type-inline-comment", "type-multiline-comment"
;;       inside js-mode as they have conditions on js2-mode
(require 'yasnippet-snippets)

;; auto-yasnippet
(global-set-key (kbd "C-c y c") 'aya-create)
(global-set-key (kbd "C-c y e") 'aya-expand)

;; dumb-jump
(setq dumb-jump-selector 'helm)
(global-set-key (kbd "M-g j") 'dumb-jump-go)
(global-set-key (kbd "M-g b") 'dumb-jump-back)
(global-set-key (kbd "M-g q") 'dumb-jump-quick-look)

;; ag
(setq ag-reuse-buffers 't)
(setq ag-highlight-search t)

;; helm-ag

;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; helm-projectile
(helm-projectile-on)

;; neotree
(global-set-key (kbd "C-x t") 'neotree-toggle)

;; undo-tree
(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-_") nil)
(define-key undo-tree-map (kbd "M-_") nil)

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

;; git-timemachine

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; mark-lines
(require 'mark-lines)
(global-set-key (kbd "C-M-,") 'mark-lines-previous-line)

;; whole-line-or-region
(whole-line-or-region-global-mode)

;; popup-kill-ring
(global-set-key (kbd "M-y") 'popup-kill-ring)

;; move-text
(move-text-default-bindings)

;; move-dup
(require 'move-dup)
(global-set-key (kbd "C-c u") 'md-duplicate-up)
(global-set-key (kbd "C-c d") 'md-duplicate-down)

;; change-inner
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; auto-highlight-symbol
(require 'auto-highlight-symbol)
(add-hook 'prog-mode-hook #'auto-highlight-symbol-mode)
(define-key auto-highlight-symbol-mode-map (kbd "<M-S-left>") nil)
(define-key auto-highlight-symbol-mode-map (kbd "<M-S-right>") nil)
(define-key auto-highlight-symbol-mode-map (kbd "M--") nil)

;; iedit
(require 'iedit)

;; multiple-cursors
(require 'multiple-cursors)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)
(define-key mc/keymap (kbd "<return>") nil)
(global-set-key (kbd "C->") 'mc/mark-pop)
(global-set-key (kbd "C-:") 'mc/edit-lines)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "M-+") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-_") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-_") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)

;; buffer-move
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

;; which-key
(which-key-mode)

;; yafolding
(add-hook 'prog-mode-hook #'yafolding-mode)
(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)
(define-key yafolding-mode-map (kbd "C-`") 'yafolding-toggle-element)

;; fill-column-indicator
(setq fci-rule-column 80)
(setq fci-rule-width 11)

;; hungry-delete
;(global-hungry-delete-mode)

;; miniedit
(miniedit-install)

;; flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-indication-mode 'right-fringe)
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; pyvenv
(setenv "WORKON_HOME" "C:/Users/Qilong/anaconda3/envs")
(pyvenv-mode 1)

;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(setq markdown-command "D:/Apps/MultiMarkdown-Windows-6.4.0/bin/multimarkdown.exe")

;; json-mode

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))
(add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.jsx?\\'" . flycheck-mode))
                             (enable-minor-mode
                              '("\\.jsx?\\'" . prettier-js-mode))))

;; ac-html
;; NOTE: could make the editing slow if added
(defun setup-ac-for-html ()
  "Setup for ac-html."
  (require 'ac-html)
  (require 'ac-html-default-data-provider)
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  (ac-html-setup)
  (push 'ac-source-html-tag ac-sources)
  (push 'ac-source-html-attr ac-sources)
  (push 'ac-source-html-attrv ac-sources)
  (auto-complete-mode))
;(add-hook 'html-mode-hook 'setup-ac-for-html)
;(add-hook 'web-mode-hook 'setup-ac-for-html)

;; emmet-mode
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; ac-emmet
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)
(add-hook 'web-mode-hook 'ac-emmet-html-setup)

;; tern-mode
(add-hook 'js-mode-hook 'tern-mode)
(add-hook 'web-mode-hook 'tern-mode)

;; tern-auto-complete
(eval-after-load 'tern
  '(progn
     (tern-ac-setup)
     (define-key tern-mode-keymap (kbd "<C-tab>") 'tern-ac-complete)))

;; tide
(defun setup-tide-mode ()
  "Tide mode setup."
  (interactive)
  (tide-setup)
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (ac-company-define-source ac-source-company-tide company-tide))

;; web-beautify
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'web-mode
  '(progn
     (define-key web-mode-map (kbd "C-c b h") 'web-beautify-html)
     (define-key web-mode-map (kbd "C-c b j") 'web-beautify-js)))

;; prettier-js

;; add-node-modules-path
(require 'add-node-modules-path)
(add-hook 'js-mode-hook #'add-node-modules-path)
(add-hook 'web-mode-hook #'add-node-modules-path)

;; lorem-ipsum

;; google-this
(google-this-mode 1)

;; diminish
(diminish 'anzu-mode)
(diminish 'helm-mode)
(diminish 'beacon-mode)
(diminish 'yas-minor-mode)
(diminish 'undo-tree-mode)
(diminish 'which-key-mode)
(diminish 'projectile-mode)
(diminish' git-gutter-mode)
(diminish 'visual-line-mode)
(diminish 'google-this-mode)
(diminish 'auto-revert-mode)
(diminish 'golden-ratio-mode)
(diminish 'volatile-highlights-mode)
(diminish 'whole-line-or-region-local-mode)
(diminish 'highlight-indentation-current-column-mode)
(add-hook 'rainbow-mode-hook (lambda () (diminish 'rainbow-mode)))
(add-hook 'tern-mode-hook (lambda () (diminish 'tern-mode "TN")))
(add-hook 'emmet-mode-hook (lambda () (diminish 'emmet-mode "EM")))
(add-hook 'eldoc-mode-hook (lambda () (diminish 'eldoc-mode "ED")))
(add-hook 'anaconda-mode-hook (lambda () (diminish 'anaconda-mode "AN")))
(add-hook 'flycheck-mode-hook (lambda () (diminish 'flycheck-mode "FC")))
(add-hook 'prettier-js-mode-hook (lambda () (diminish 'prettier-js-mode "PR")))


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
        ;(font . "DejaVu Sans Mono-10")))

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

;; customize the modeline
(column-number-mode 1)
(size-indication-mode 1)

;; set the cursor type and color
(setq-default cursor-type 'bar)
;(set-cursor-color "#3498DB")

;; turn on highlighting current line
(global-hl-line-mode 1)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
(global-visual-line-mode 1)

;; show line numbers
(global-linum-mode 1)

;; customize the width of both fringes
(fringe-mode '(16 . 13))

;; allow one to see matching pairs of parentheses and other characters
(show-paren-mode 1)

;; make trailing whitespace at the end of a line visible
(setq-default show-trailing-whitespace t)

;; control whether tabs are used for indentation
(setq-default indent-tabs-mode nil)

;; set the indentation level for CC modes (C, C++, Java, etc.)
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

;; let you move point from window to window using <Shift> and the arrow keys
(windmove-default-keybindings)

;; undo and redo window configuration
(winner-mode 1)

;; set the default directory
(setq default-directory "~/")

;; prefer the utf-8 coding system
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; give meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; set up ediff (emacs' diff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; build a list of recently opened files saved across sessions
(recentf-mode 1)
(setq recentf-max-saved-items 100
      recentf-max-menu-items 100)
(run-at-time nil (* 60 60) 'recentf-save-list)

;; make all backup and autosave files go into a same place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))

;; mark the current line
(defun mark-whole-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil))
(global-set-key (kbd "C-.") 'mark-whole-line)

;; join the line you're on with the line above it in a resonable manner
(global-set-key (kbd "M-j") 'join-line)

;; provide a variety of completions and expansions
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line))
(global-set-key (kbd "M-/") 'hippie-expand)

;; make C-z do nothing
(global-unset-key (kbd "C-z"))


;;=========================================================================
;;; Org-mode Settings
;;=========================================================================
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
    (company-anaconda pyvenv anaconda-mode lorem-ipsum tern-auto-complete tern gruvbox-theme iy-go-to-char google-this ag highlight-indentation miniedit move-dup prettier-js web-beautify add-node-modules-path change-inner popwin smart-forward ac-emmet json-mode ac-html react-snippets emmet-mode rainbow-identifiers hlinum git-gutter-fringe yafolding git-gutter whole-line-or-region highlight-numbers auto-highlight-symbol volatile-highlights buffer-move goto-chg 2048-game helm-mode-manager hungry-delete popup-kill-ring smooth-scrolling beacon iedit anzu helm-ag expand-region move-text moe-theme undo-tree smex powerline neotree auto-complete))))

