# dotfiles

## About

These are my personal dotfiles. I mainly work in the [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) using an Ubuntu distro.

The rest of this README is supposed to help me how to maintain, sync, and modify them.

## Usage

I sync my dotfiles with [GNU Stow](https://www.gnu.org/software/stow/) using [Brandon Invergo's](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) technique ([more reading](https://github.com/xero/dotfiles).

Inside your home directory lives a `dotfiles` folder. Inside `dotfiles`, you have folders to store each type of dotfile configuration you may want to use (e.g. `bash`, `zsh`, `git`, etc.). You can then `stow`/`stow -D` these configurations to add or remove them from you home directory's dotfiles. GNU Stow makes symlinks in your home director to these files.

This technique is portable, flexible, and maintainable. You can add or remove existing configurations on-the-fly, and new configurations are simple to add. Setting up a new machine's dotfiles is very straightforward, too.

Before this setup, I had all my dotfiles in a Dropbox folder, and I had to manually symlink them every time. This setup is much easier to use.

### Installing

Make sure Stow is installed:
```sh
$ stow --help
$ which stow
```

If it's not, Stow is easy to install on Ubuntu:
```sh
$ sudo apt-get install stow
```

After that, change to the home directory, clone this repo, and `cd` into it:
```sh
$ cd ~
$ git clone https://github.com/colbin8r/dotfiles.git
$ cd dotfiles
```

From here, you just `stow` the configurations you want to use:
```sh
$ stow bash
$ stow zsh
$ stow git
$ stow ...
```

### Uninstalling Configurations

Make sure you're in your `dotfiles` directory:
```sh
$ cd ~/dotfiles
```

Run `stow -D [configuration]` to remove the configuration's symbolic links:
```sh
$ stow -D zsh
```

### Updating Configurations

You can pull down updates to configurations with Git. When a configuration in the `dotfiles` has changed, you need to manually re-stow it:
```sh
$ cd ~/dotfiles
$ git pull
$ stow -R zsh
```

### Adding New Configurations

New configurations are easy to add. Make a new folder in `dotfiles`:
```sh
$ cd ~/dotfiles
$ mkdir new-zsh-configuration
```

Move the dotfiles from you home directory into the new configuration:
```sh
$ mv ~/.zsh* dotfiles/new-zsh-configuration
```

You can also move folders or parts of folders. For example, if you have a script that you want to be available in `~/bin`, just mimic the directory structure exactly in the configuration folder:
```sh
$ cd ~/dotfiles/my-custom-script
$ mkdir bin
$ mv ~/bin/my-script bin
```

Make sure to commit and push any new configurations:
```sh
$ cd ~/dotfiles
$ git add my-new-configuration/
$ git commit -m 'Added my-new-configuration'
$ git push origin master
```
