# dotfiles

## About

These are my personal dotfiles. I mainly work in the [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) using an Ubuntu distro.

The rest of this README is supposed to help me how to maintain, sync, and modify them. You are welcome to use anything here, but these instructions are mostly for me to remember how to set up a new system.

## Usage

I sync my dotfiles with [GNU Stow](https://www.gnu.org/software/stow/) using [Brandon Invergo's](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) technique ([more reading](https://github.com/xero/dotfiles)).

Inside your home directory lives a `dotfiles` folder. Inside `dotfiles`, you have folders to store each type of dotfile configuration you may want to use (e.g. `bash`, `zsh`, `git`, etc.). You can then `stow`/`stow -D` these configurations to add or remove them from you home directory's dotfiles. GNU Stow makes symlinks in your home directory to these files (technically, it symlinks the files up a directory, meaning `dotfiles` *must* live in your home directory for the files to be symlinked into `~`).

This technique is portable, flexible, and maintainable. You can add or remove existing configurations on-the-fly, and new configurations are simple to add. Setting up a new machine's dotfiles is very straightforward, too.

Before this setup, I had all my dotfiles in a Dropbox folder, and I had to manually symlink them every time. Needless to say, this setup is much easier to use. Now I have my dotfiles in source control, I can switch between multiple configurations for the same dotfiles, and Stow handles all the symlinking.

### A Note on the Windows Subsystem for Linux

I use these dotfiles inside the Windows Subsystem for Linux (Ubuntu distro). They may or may not work for you out-of-the-box on other platforms (although I have used them successfully on OS X).

I recommend you store your code, files, etc. in Windows and use them in WSL. WSL can read Windows files, but Windows cannot read WSL files, so you can use your files in both Windows (e.g. a code editor) and WSL (e.g. Nix tools, git, etc.).

Also, I highly recommed you mount your Windows filesystem in Linux under `/c` rather than `/mnt/c` **with metadata** as that will allow you to use Windows directories easily in Linux. Sometimes Linux things need to connect to their Windows counterparts (e.g. the Sublime plugin for Oh My Zsh). You can do it quite easily by editing `/etc/wsl.conf` according to [these instructions](https://github.com/Microsoft/WSL/issues/1918#issuecomment-368269436).

### A Note on Absolute Paths

I'm in the process of converting some absolute paths I used when I started with these dotfiles. Not all of them may have been updated yet.

To help WSL connect with Windows, I have a symlink to my Windows user directory within my WSL home directory: `~/colby -> /c/Users/colby/`. Some of the symlinks are pointed at this symlink, expecting it to resolve to a Windows home directory with specific concents. But when I move machines, I can just update the one symlink pointing at my Windows user and get the rest of them to work.

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

After that, change to the home directory, clone this repo (which has submodules like `.oh-my-zsh`), and `cd` into it:
```sh
$ cd ~
$ git clone --recursive https://github.com/colbin8r/dotfiles.git
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
