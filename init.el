;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'nil ;; 回车无作用
                      auto-completion-tab-key-behavior 'nil ;; tab 键无作用，只使用 C-l
                      auto-completion-enable-snippets-in-popup t ;; 在自动补全中显示 snippets
                      auto-completion-enable-help-tooltip t ;; 自动补全中显示文档提示
                      :disabled-for org)
     ;; better-defaults
     emacs-lisp
     git
     helm
     ;; lsp
     ;; markdown
     ;; multiple-cursors
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     ;; treemacs
     latex
     markdown
     (ranger :variables
             ranger-show-preview t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(cdlatex posframe yasnippet-snippets sis org-fragtog matlab-mode)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(google-translate)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default spacemacs-27.1.pdmp)
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font 'nil

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.0

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|10.*\\)")
          ("http" . "127.0.0.1:1080")
          ("https" . "127.0.0.1:1080")))
  ;; (setq configuration-layer-elpa-archives
  ;;   '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;     ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;    ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; 不使用fill（就是不维持文本的一定列宽度不变）
  (spacemacs/toggle-auto-fill-mode-off)
  ;; Make movement keys work like they should
  ;; 上下移动光标时按照所见行移动，而非逻辑行
  ;; https://stackoverflow.com/questions/20882935/how-to-move-between-visual-lines-and-move-past-newline-in-evil-mode
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  ;;
  ;; ranger configuration
  ;;
  ;; You can set the number of folders to nest to the left, adjusted by =z-= and =z+=
  (setq ranger-enter-with-minus t)
  (setq ranger-cleanup-eagerly t)
  (setq ranger-parent-depth 1)
  (setq ranger-show-hidden t)

  ;; doom-modeline 配置
  (setq doom-modeline-buffer-file-name-style 'file-name)

  ;;
  ;; origami 配置
  ;;
  ;; https://github.com/gregsexton/origami.el/issues/69#issue-314088428
  ;; imenu based fold parser
  (defun origami-parser-imenu-flat (create)
    "Origami parser producing folds for each imenu entry, without nesting."
    (require 'imenu)
    (lambda (content)
      (let ((orig-major-mode major-mode))
        (with-temp-buffer
          (insert content)
          (funcall orig-major-mode)
          (let* ((items
                  (-as-> (imenu--make-index-alist t) items
                         (-flatten items)
                         (-filter 'listp items)))
                 (positions
                  (-as-> (-map #'cdr items) positions
                         (-filter 'identity positions)
                         (-map-when 'markerp 'marker-position positions)
                         (-filter 'natnump positions)
                         (cons (point-min) positions)
                         (-snoc positions (point-max))
                         (-sort '< positions)
                         (-uniq positions)))
                 (ranges
                  (-zip-pair positions (-map '1- (cdr positions))))
                 (fold-nodes
                  (--map
                   (-let*
                       (((range-beg . range-end) it)
                        (line-beg
                         (progn (goto-char range-beg)
                                (line-beginning-position)))
                        (offset
                         (- (min (line-end-position) range-end) line-beg))
                        (fold-node
                         (funcall create line-beg range-end offset nil)))
                     fold-node)
                   ranges)))
            fold-nodes)))))
  (evil--add-to-alist 'origami-parser-alist 'matlab-mode 'origami-parser-imenu-flat)

  ;; 语言编码设置
  ;; (modify-coding-system-alist 'process "[mM][aA][gG][iI][tT]" 'utf-8)

  ;; 设置 treemacs 使用的 python.exe 的路径
  ;; (setq treemacs-python-executable "c:/Program Files/Python37/python.exe")

  ;; 最大化
  (spacemacs/toggle-maximize-frame-on)

  ;; 将粘贴命令绑定到 C-v
  (define-key evil-insert-state-map (kbd "C-v") #'yank)

  ;; 打开菜单栏
  (spacemacs/toggle-menu-bar-on)

  ;; 字体设置
  ;;
  ;;
  ;; 需要设置上面的 dotspacemacs-default-font 'nil，才能让这里的设置生效
  ;; https://emacs-china.org/t/topic/4554/6
  ;; 经测试，下面的默认字体 Consolas 的 :name 如果设为下面 cnfonts 自动生成的那种很长的名称，doom-modeline 图标会显示不正常。
  (set-face-attribute
   'default nil
   :font (font-spec
          :name "Consolas"
          :weight 'normal
          :slant 'normal
          :size 17.0)
   )
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec
      :name "黑体"
      :weight 'normal
      :slant 'normal
      :size 18.0)
     )
    )

  ;; Auto generated by cnfonts
  ;; <https://github.com/tumashu/cnfonts>

  ;; (set-face-attribute
  ;;  'default nil
  ;;  :font (font-spec :name "-outline-Consolas-bold-italic-normal-mono-*-*-*-*-c-*-iso10646-1"
  ;;                   :weight 'normal
  ;;                   :slant 'normal
  ;;                   :size 15.0))
  ;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;   (set-fontset-font
  ;;    (frame-parameter nil 'font)
  ;;    charset
  ;;    (font-spec :name "-outline-黑体-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
  ;;               :weight 'normal
  ;;               :slant 'normal
  ;;               :size 16.0)))


  ;;
  ;; org 相关命令
  ;;
  ;; org-tempo 让 <s tab 可以使用
  ;; (require 'org-tempo)
  (with-eval-after-load 'org
    ;; latex 相关设置
    (setq org-latex-compiler "pdflatex")
    (plist-put org-format-latex-options :scale 1.5)
    (setq org-preview-latex-default-process 'dvisvgm)
    )
  ;; org-fragtog自动打开或关闭org数学公式预览
  (add-hook 'org-mode-hook 'org-fragtog-mode)
  ;; 自动分行
  (add-hook 'org-mode-hook 'spacemacs/toggle-truncate-lines-off)
  ;; 一些 minor mode
  (add-hook 'org-mode-hook 'org-cdlatex-mode)
  ;; (add-hook 'org-src-mode-hook 'cdlatex-mode)
  (add-hook 'org-mode-hook 'smartparens-mode)


  ;;
  ;; 使用 smart-input-source 代替 pyim 进行中文输入
  ;;
  (require 'sis)

  (when (eq system-type 'windows-nt)
    ;; (setq smart-input-source-external-ism "im-select.exe")
    ;; (setq smart-input-source-english "1033")
    ;; (setq-default smart-input-source-other "2052")
    (sis-ism-lazyman-config "1033" "2052" 'im-select)
    )

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)

  ;; inline 模式退出时不删除启始的空格
  (setq sis-inline-tighten-head-rule 0)

  ;; ;; enable the /follow context/ and /inline region/ mode for specific buffers
  ;; (dolist (hook '(text-mode-hook prog-mode-hook org-mode-hook))
  ;;   (add-hook hook #'sis-follow-context-mode))

  ;; (dolist (hook '(text-mode-hook prog-mode-hook org-mode-hook))
  ;;   (add-hook hook #'sis-inline-mode))

  ;;---------------------------------------------
  ;;---------------------------------------------
  ;; ;; 已被代替的 pyim 配置
  ;; (require 'pyim)
  ;;

  ;; ;; 默认输入法设置
  ;; (setq default-input-method "pyim")
  ;; ;; 使用小鹤双拼输入法方案
  ;; (setq pyim-default-scheme 'xiaohe-shuangpin)

  ;; ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; ;; 我自己使用的中英文动态切换规则是：
  ;; ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; (setq-default pyim-english-input-switch-functions
  ;;               '(
  ;;                 pyim-probe-auto-english
  ;;                 pyim-probe-program-mode
  ;;                 pyim-probe-isearch-mode
  ;;                 pyim-probe-org-latex-mode
  ;;                 ))
  ;; (setq-default pyim-punctuation-half-width-functions
  ;;               '(pyim-probe-punctuation-line-beginning
  ;;                 pyim-probe-punctuation-after-punctuation))
  ;; ;; 设置编码转化为中文的快捷键
  ;; (global-set-key (kbd "M-n") 'pyim-convert-string-at-point)
  ;; ;; 开启拼音搜索功能
  ;; (pyim-isearch-mode 1)

  ;; (setq pyim-page-length 8)

  ;; ;; 如果用 emacs26, 建议设置
  ;; ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; ;; 手动安装 posframe 包。
  ;; (setq pyim-page-tooltip 'posframe)

  ;; ;; (setq pyim-translate-trigger-char ";")

  ;; ;; 在 pyim 中使用 evil-escape ，也就是 fd 键
  ;; ;; 比较两次输入的时间差
  ;; ;; 参考 https://github.com/tumashu/pyim/issues/260#issuecomment-570921604
  ;; (defun my-pyim-self-insert-command (orig-func)
  ;;   (interactive "*")
  ;;   (if (and (local-variable-p 'last-event-time)
  ;;            (floatp last-event-time)
  ;;            (< (- (float-time) last-event-time) 0.2))
  ;;       (set (make-local-variable 'temp-evil-escape-mode) t)
  ;;     (set (make-local-variable 'temp-evil-escape-mode) nil)
  ;;     )
  ;;   (if (and temp-evil-escape-mode
  ;;            (equal (pyim-entered-get) "f")
  ;;            (equal last-command-event ?d))
  ;;       (progn
  ;;         (push last-command-event unread-command-events)
  ;;         (pyim-outcome-handle 'pyim-entered)
  ;;         (pyim-terminate-translation))
  ;;     (progn
  ;;       (call-interactively orig-func)
  ;;       (set (make-local-variable 'last-event-time) (float-time))
  ;;       ))
  ;;   )
  ;; (advice-add 'pyim-self-insert-command :around #'my-pyim-self-insert-command)
  ;;---------------------------------------------
  ;;---------------------------------------------
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cdlatex-command-alist nil)
 '(cdlatex-math-symbol-alist (quote ((48 ("\\varnothing" "\\emptyset")) (49 ("\\(")))))
 '(cdlatex-use-dollar-to-ensure-math nil)
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files (quote ("~/Documents/org_notebooks/mynotebook.org")))
 '(org-capture-templates
   (quote
    (("c" "capturing in general" entry
      (file "~/Documents/org_notebooks/INBOX.org")
      ""))))
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data add-node-modules-path vmd-mode mmm-mode markdown-toc gh-md lsp-ui lsp-treemacs lsp-python-ms lsp-java helm-lsp outshine yapfify yaml-mode web-beautify utop tuareg caml tide typescript-mode seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake pytest pyenv-mode py-isort prettier-js pippel pipenv pyvenv pip-requirements ocp-indent ob-elixir nodejs-repl mvn minitest meghanada maven-test-mode livid-mode skewer-mode simple-httpd live-py-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc importmagic epc ctable concurrent deferred helm-pydoc lsp-mode markdown-mode dash-functional groovy-mode groovy-imports pcache gradle-mode git-gutter-fringe+ fringe-helper git-gutter+ flycheck-pos-tip flycheck-ocaml merlin flycheck-credo emojify emoji-cheat-sheet-plus dune cython-mode company-emoji company-anaconda chruby bundler inf-ruby browse-at-remote blacken anaconda-mode pythonic alchemist elixir-mode counsel swiper ivy yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons smeargle smart-input-source shell-pop restart-emacs rainbow-delimiters pyim posframe popwin pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-brain open-junk-file nameless multi-term move-text magit-svn magit-section magit-gitflow macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy font-lock+ flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish devdocs define-word company-quickhelp column-enforce-mode cnfonts clean-aindent-mode centered-cursor-mode cdlatex auto-yasnippet auto-highlight-symbol auto-compile auctex aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pyim-dicts
   (quote
    ((:name "pyim-bigdict" :file "c:/Users/Kristing/pyim-bigdict.pyim.gz")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
