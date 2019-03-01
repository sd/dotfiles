These are Sebastian Delmont's "dot files", inspired/forked/copied from [holman](http://github.com/holman) and [mrsimo](http://github.com/mrsimo).

You can [read the oroginal holman's post on the subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## dotfiles

The setup described here includes customization for:

* OSX
* iTerm.app
* SublimeText
* bash
* git
* screen


## install

    git clone git://github.com/sd/dotfiles
    cd dotfiles
    bundle
    rake install

You can put it anywhere. I like to have in my Dropbox folder, so that if I ever change something it will be replicated on all my other machines without having to pull the repository.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`, which sets up a few paths that'll be different on your particular machine.



## Z Shell notes

http://sourabhbajaj.com/mac-setup/iTerm/zsh.html
