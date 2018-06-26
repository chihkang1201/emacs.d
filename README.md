# README.me
This is my emacs configuration tree, continually used and tweaked since 2017, and it may be some improvement.
These days it's somewhat geared towards OS X, but it is known to also work on Linux and Windows.

Emacs itself comes with support for many programming languages. This config adds improved defaults and extended
support for the following, listed in the approximate order of how much I use them, from most to least:

Lisp
Python

In particular, there's a nice config for autocompletion with company, and flycheck is used to immediately highlight
syntax errors in Python.

Installation
To install, clone this repo to ~/.emacs.d, i.e. ensure that the init.el contained in this repo ends up at ~/.emacs.d/init.el:

git clone https://github.com/purcell/emacs.d.git ~/.emacs.d
Upon starting up Emacs for the first time, further third-party packages will be automatically downloaded and installed.
If you encounter any errors at that stage, try restarting Emacs, and possibly running M-x package-refresh-contents before
doing so.

Updates
Update the config with git pull. You'll probably also want/need to update the third-party packages regularly too:

M-x package-list-packages, then U followed by x.

You should usually restart Emacs after pulling changes or updating packages so that they can take effect. Emacs should usually
restore your working buffers when you restart due to this configuration's use of the desktop and session packages.

Changing themes and adding your own customization
To add your own customization, use M-x customize, M-x customize-themes etc. and/or create a file ~/.emacs.d/lisp/init-local.el which
looks like this:

... your code here ...

(provide 'init-local)
If you need initialisation code which executes earlier in the startup process, you can also create an ~/.emacs.d/lisp/init-preload-local.el
file.

If you plan to customize things more extensively, you should probably just fork the repo and hack away at the config to make it
your own! Remember to regularly merge in changes from this repo, so that your config remains compatible with the latest package
and Emacs versions.

Please note that I cannot provide support for customised versions of this configuration.

