# Personal Emacs Configuration

![Screenshot](/screenshot.JPG)

Written in Org mode.

This will always be work in progress.

## How to setup
Git clone this repo wherever you want, and just insert the following at the top of your init file
```lisp
(load-file "~/emacs-config/bootstrap.el")
```
where the path to bootstrap.el is adjusted to wherever you cloned this repo.
This will also automatically pull the latest version of the config on startup, unless you forbid it with
```lisp
(setq config-no-auto-update t)
```

### For Windows Users
I tried to make this config also work on Windows. Obviously it won't be as good.
You will need to do some extra things:
- Install [Cygwin](https://www.cygwin.com/) at `C:\cygwin64\`
- Install [Aspell](http://aspell.net/win32/) at `C:\Aspell\` with at least one dictionary

## How to use
Most of the useful key bindings linked to this config are recorded in a cheat sheet that you can summon via
```lisp
M-x cheatsheet-show
```

## Essential Packages
- Helm. After a full year of playing with both, finally chose Helm over Ido.
- Company. For code completion.
- Whole-line-or-region. Underrated IMO.
- Magit. Best git client for Emacs out there.
- Flycheck. Checks syntax everywhere.
- use-package. Amazing for a clean config file.
- Projectile. For all the projects.
- Multiple-cursors. Also underrated.

## File Overview
File | Purpose
------------ | -------------
README.md | This file
bootstrap.el | Kickstart the config load process
configuration.org | Main org file with all the configuration in elisp blocks
snippets.org | Snippets collection compiled via `org-sync-snippets`
elfeed.org | Separate list of blogs and RSS feeds for elfeed to grab
cheatsheet.org | Dedicated to loading the cheatsheet extension
sreenshot.JPG | Just a screenshot of the beast
extra | Folder to place any extra .el files to be loaded on startup

## Inspired by the superbs
* https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
* https://github.com/purcell/emacs.d
* https://github.com/jwiegley/use-package
* http://www.holgerschurig.de/en/emacs-efficiently-untangling-elisp/

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
- https://github.com/hlissner/.emacs.d
- https://github.com/angrybacon/dotemacs
- https://github.com/howardabrams/dot-files
- https://github.com/caisah/emacs.dz

## Resources for more:
- [Reddit #1](https://www.reddit.com/r/emacs/comments/2edbau/what_are_some_great_emacsd_examples/)
- [Reddit #2](https://www.reddit.com/r/emacs/comments/4kv163/i_wanna_see_your_init_files_share_em/)
