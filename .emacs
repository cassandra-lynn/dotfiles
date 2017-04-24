(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (The_Fox_and_the_Grapes)))
 '(custom-safe-themes (quote ("1006645a524f4a421d7eb3c6a7ee60fc73a9500de7b98b41069b79fb7c0973be" "14717f6b2e63554e12a80bbda17c99ba762cdfc3b465483a7fa454189a4c411f" "3e843d098c9fa7e023bc44797a40786f5c61ecc88b79f99887031b6670428710" "d9caca7fd19f391d7cb3f0742aa22193f31d5e59dbfd19ef44d817c540c7aa3a" "38c72b5ff9b3a573eb7289c9882e4c04f9b71bfbfc98bc8ce6b62a108841dc13" "7ba875b052f3102ca798950a126f71f960efbf6e65f6d7465675e2eaaf19afe1" "32fdcdbeb8e39a163c76a30b64dca3edd847dec67b24722a61aa7279b13944ba" default)))
 '(python-shell-interpreter "python3")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key [C-tab] 'toggle-window-split)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x))) ; Load Dired X when Dired is loaded.

(setq dired-omit-mode t) ; Turn on Omit mode.
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$") ; Omit dot files
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
                               (when indent-tabs-mode
                                 (guess-style-guess-tab-width))))
(add-hook 'python-mode-hook 'linum-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'indent-according-to-mode)

(add-hook 'sh-mode-hook 'linum-mode)
(add-hook 'lisp-mode-hook 'linum-mode)

(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'backward-kill-word)
(global-set-key (kbd "M-[ c") 'forward-word)
(global-set-key (kbd "M-[ d") 'backward-word)

(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))

(global-set-key "\M-Y" 'yank-pop-forwards) ; M-Y (Meta-Shift-Y)

