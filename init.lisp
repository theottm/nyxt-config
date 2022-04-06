;; enable C-SPC to toggle mark in visual-mode
(define-configuration buffer
  ((override-map (let ((map (make-keymap "override-map")))
                   (define-key map
                       "M-x" 'execute-command
		       ;; "C-space" 'nothing
		       "C-h e" 'nyxt/message-mode:list-messages
		       "C-x k" 'delete-current-buffer
		       )))))

(define-configuration buffer
    ((default-modes (append '(emacs-mode dark-mode) %slot-default%))))

(asdf:load-system :nx-fruit)

;; (asdf:load-system :nx-mapper)
(load-after-system :nx-mapper (nyxt-init-file "mapper.lisp"))

(define-configuration buffer
  ((default-modes
    (append
     ;; Either of them or both, depending on what functionality you want
     '(nx-mapper/stylor-mode:stylor-mode
       nx-mapper/stylor-mode:rural-mode)
     %slot-default%)))
