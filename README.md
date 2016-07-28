# Personal Emacs Configuration

![Screenshot](/screenshot.JPG)

Written in Org mode

## How to setup
Git clone this repo wherever you want, and just insert the following at the top of your init file
```
(setq config-load-path "~/emacs-config/")
(package-initialize)
(require 'org)
(org-babel-load-file (concat config-load-path "configuration.org"))
```
And adjust config-load-path to the location of where you git cloned.

### For Windows Users
I tried to make this config also work on Windows. Obviously it won't be as good.
You will need to do some extra things:
- Install [Cygwin](https://www.cygwin.com/) at `C:\cygwin64\`
- Install [Aspell](http://aspell.net/win32/) at `C:\Aspell\` with at least one dictionary

## How to use
Most of the useful key bindings linked to this config are recorded in a cheat sheet that you can summon via
```
M-x cheatsheet-show
```

## Overview
File | Purpose
------------ | -------------
README.md | This file
configuration.org | Main org file with all the configuration in elisp blocks
elfeed.org | Separate list of blogs and RSS feeds for elfeed to grab
sreenshot.JPG | Just a screenshot of the beast
extra | Folder to place any extra .el files to be loaded on startup

## Inspired by the superbs
* https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
* https://github.com/purcell/emacs.d

## TODO:
- shave time off org babel with http://www.holgerschurig.de/en/emacs-efficiently-untangling-elisp/

## Other repos to check out:
- https://github.com/magnars/.emacs.d
- https://github.com/bbatsov/prelude
- https://github.com/emacs-tw/awesome-emacs
- https://github.com/overtone/emacs-live
- https://github.com/syl20bnr/spacemacs
- https://github.com/eschulte/emacs24-starter-kit
- https://github.com/xiaohanyu/oh-my-emacs
- https://github.com/rdallasgray/graphene
- https://github.com/sachac/.emacs.d
