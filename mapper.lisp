(import 'nx-mapper:make-mapping)

(define-configuration nx-mapper/stylor-mode:settings
  ((nx-mapper/stylor-mode:scripts
    (list
     (make-mapping "FSF" '(match-domain "fsf.org")
                   :script (ps:ps (setf (ps:@ document body |innerHTML|)
                                        "This was invoked by some sample JavaScript.")))))
   (nx-mapper/stylor-mode:external-themes
    (list
     (make-mapping "GitHub" '(match-domain "github.com")
                   :style (cl-css:css '(("a[href*=watchers]"
                                         :display "none !important"))))
     (make-mapping "Lisp Documentation" '(match-domain "lisp.se" "lispworks.com")
                   :style (lambda (theme)
                             (theme:themed-css theme
                               (*
                                :background-color theme:background
                                :color theme:text))))
     (make-mapping "Medium" '(match-domain "medium.com")
                    :style (asdf:system-relative-pathname :nx-mapper "styles/medium.css"))
     (make-mapping "Nord Startpage" '(match-domain "startpage.com")
                   :style (quri:uri "https://bpa.st/raw/4WYA"))))
   (nx-mapper/stylor-mode:internal-themes
    (list
     (make-mapping "Modus Operandi" nil
                   :background-color "white"
                   :text-color "black"
                   :primary-color "#093060"
                   :secondary-color "#f0f0f0"
                   :tertiary-color "#dfdfdf"
                   :quaternary-color "#005a5f"
                   :accent-color "#8f0075"
                   :font-family "Iosevka"
                   :stylist (make-instance 'nx-mapper/stylor-mode:user-stylist))
     (make-mapping "Modus Vivendi" nil
                   :dark-p t
                   :background-color "black"
                   :text-color "white"
                   :primary-color "#c6eaff"
                   :secondary-color "#323232"
                   :tertiary-color "#323232"
                   :quaternary-color "#a8a8a8"
                   :accent-color "#afafef"
                   :font-family "Iosevka"
                   :stylist (make-instance 'nx-mapper/stylor-mode:user-stylist))))))

(define-configuration nx-mapper/stylor-mode:stylist
  ((nx-mapper/stylor-mode:name "Minimal UI")
   (nx-mapper/stylor-mode:prompt-style
    (lambda (theme)
      (theme:themed-css theme
        (* :font-family theme:font-family)
        ("#prompt-modes"
         :display "none")
        ("#prompt-area"
         :background-color theme:tertiary
         :color theme:quaternary
         :border "1px solid"
         :border-color (if (theme:dark-p theme:theme) theme:quaternary theme:text))
        ("#input"
         :background-color theme:tertiary
         :color theme:text)
        (".source-content"
         :border "none"
         :border-collapse collapse)
        (".source-name"
         :background-color theme:background
         :color theme:text
         :font-style "italic")
        (".source-content th"
         :padding-left "0"
         :background-color theme:background
         :font-weight "bold")
        (".source-content td"
         :padding "0 2px")
        ("#selection"
         :font-weight "bold"
         :background-color theme:secondary
         :color theme:text))))
   (nx-mapper/stylor-mode:buffer-style
    (lambda (theme)
      (theme:themed-css theme
        (body
         :font-family theme:font-family
         :background-color theme:background
         :color theme:text)
        ("h1,h2,h3,h4,h5,h6"
         :font-family "IBM Plex Sans"
         :color theme:primary)
        ("p,pre,td"
         :font-family "IBM Plex Sans"
         :color theme:text)
        (pre
         :background-color theme:tertiary)
        ("button,a:link"
         :color theme:text
         :font-family "IBM Plex Sans")
        (".button, .button:hover , .button:visited, .button:active"
         :background-color theme:secondary
         :border "1px solid"
         :border-color (if (theme:dark-p theme:theme) theme:quaternary theme:text)
         :color theme:text)
        (code
         :font-family "Iosevka"
         :background-color theme:tertiary))))
   (nx-mapper/stylor-mode:status-style
    (lambda (theme)
      (theme:themed-css theme
        (body
         :font-family theme:font-family
         :height "100%"
         :width "100%"
         :border "1px solid"
         :border-color (if (theme:dark-p theme:theme) theme:quaternary theme:text)
         :box-sizing "border-box"
         :line-height "20px"
         :display "flex"
         :flex-direction "column"
         :background theme:tertiary
         :flex-wrap "wrap")
        ("#container"
         :display "flex"
         :height "100%"
         :width "100%"
         :line-height "20px"
         :justify-content "space-between"
         :align-items "center")
        ("#buttons"
         :display "flex"
         :align-items "center"
         :justify-content "center"
         :line-height "20px"
         :height "100%")
        ("#url"
         :font-weight "bold"
         :max-width "60%"
         :padding-right "0"
         :padding-left "5px"
         :background-color theme:tertiary
         :color theme:text
         :box-sizing "border-box"
         :z-index "auto")
        ("#tabs" :display "none")
        ("#modes"
         :padding-right "2px"
         :background-color theme:tertiary
         :box-sizing "border-box"
         :color theme:text
         :display "flex"
         :justify-contents "flex-end"
         :z-index "auto")
        (.button
         :color theme:text))))
   (nx-mapper/stylor-mode:message-style
    (lambda (theme)
      (theme:themed-css theme
        (body
         :color theme:text
         :background-color theme:background
         :font-family theme:font-family))))
   (nx-mapper/stylor-mode:hint-style
    (lambda (theme)
      (theme:themed-css theme
        (".nyxt-hint"
         :background-color theme:primary
         :color theme:background
         :font-weight "bold"
         :padding "0px 3px"
         :border-radius "2px"
         :z-index #.(1- (expt 2 31))))))))
