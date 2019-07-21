;;=========================================================================
;;; Package Settings
;;=========================================================================
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; theme
(load-theme 'zenburn t)
;(load-theme 'spacemacs-dark t)

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

;; volatile-highlights
(volatile-highlights-mode 1)

;; avy
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "C-\"") 'avy-goto-char-2)
(global-set-key (kbd "C-:") 'avy-goto-word-1)
(global-set-key (kbd "C-|") 'avy-goto-line)

;; ace-window
(global-set-key (kbd "C-x o") 'ace-window)

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

;; ac-company
(add-to-list 'load-path "~/.emacs.d/elpa/ac-company")
(require 'ac-company)
;(ac-company-define-source ac-source-company-elisp company-elisp
;                          (symbol . "z"))
;(add-hook 'emacs-lisp-mode-hook
;          (lambda ()
;            (add-to-list 'ac-sources 'ac-source-company-elisp)))

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)

;; yasnippet
(yas-global-mode)
(global-set-key (kbd "C-c C-y t") 'yas-describe-tables)

;; yasnippet-snippets
;; NOTE: need to delete "param-comment", "return-comment",
;;       "type-inline-comment", "type-multiline-comment"
;;       inside js-mode as they have conditions on js2-mode
(require 'yasnippet-snippets)

;; auto-yasnippet
(global-set-key (kbd "C-c C-y c") 'aya-create)
(global-set-key (kbd "C-c C-y e") 'aya-expand)

;; dumb-jump
(setq dumb-jump-selector 'helm)
(global-set-key (kbd "M-g j") 'dumb-jump-go)
(global-set-key (kbd "M-g b") 'dumb-jump-back)
(global-set-key (kbd "M-g q") 'dumb-jump-quick-look)

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

;; json-mode

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-enable-current-element-highlight t)

;; ac-html
;; NOTE: could make the editing slow if added
(defun setup-ac-for-html ()
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
  (interactive)
  (tide-setup)
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (ac-company-define-source ac-source-company-tide company-tide))

;; add-node-modules-path
(require 'add-node-modules-path)
(add-hook 'js-mode-hook #'add-node-modules-path)
(add-hook 'web-mode-hook #'add-node-modules-path)

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
(add-hook 'rainbow-mode-hook (lambda () (diminish 'rainbow-mode)))
(add-hook 'tern-mode-hook (lambda () (diminish 'tern-mode "TN")))
(add-hook 'emmet-mode-hook (lambda () (diminish 'emmet-mode "EM")))
(add-hook 'eldoc-mode-hook (lambda () (diminish 'eldoc-mode "EL")))

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
(run-at-time nil (* 60 60) 'recentf-save-list)

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
    (company-tern add-node-modules-path rainbow-mode tide indium ace-window change-inner popwin smart-forward ac-emmet json-mode ac-html tern tern-auto-complete js2-mode react-snippets emmet-mode web-mode rainbow-identifiers dumb-jump hlinum git-gutter-fringe yafolding git-gutter whole-line-or-region git-timemachine magit highlight-numbers auto-highlight-symbol diminish golden-ratio volatile-highlights spaceline spacemacs-theme doom-themes htmlize buffer-move goto-chg 2048-game helm-swoop fill-column-indicator helm-mode-manager hungry-delete popup-kill-ring smooth-scrolling beacon flycheck yapfify jedi auto-yasnippet yasnippet iedit multiple-cursors anzu helm-ag expand-region move-text rainbow-delimiters which-key moe-theme undo-tree solarized-theme smex smartparens powerline neotree indent-guide helm avy auto-complete))))

