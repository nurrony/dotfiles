# Nur Rony's Dotfiles

My dotfiles :smile: for Zsh on **MacOS**. Clone the repository and Run `setup.sh` to setup some initial requirements

My most favourite parts are `.functions` and `.dockerfunctions`

### Installation

To get all done in a minutes you can use the [setup script](https://github.com/nmrony/dotfiles/blob/master/setup) script

```sh
curl -s https://raw.githubusercontent.com/nmrony/dotfiles/master/setup | bash
```

### Customization

Do not forget to edit git username and email in `.extra` and `.gitconfig` with yours.

**Happy Hacking!!**

### Developers macOS defaults (?) :wink:

When setting up a new Mac, you may want to set some sensible macOS defaults:

```sh
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):

```sh
./brew.sh
```

### Configure Vim Editor

To setup Vim Editor, symlink/copy just `.vimrc` into your `HOME` directory. You can just copy and paste `.vimrc` without even copying the whole repository. Once you have `.vimrc` on your home directory please execute `vim` command to configure it automatically.

> 📝 You must have latest [Vim](https://www.vim.org/download.php) and [Git](https://git-scm.com/downloads) installed on your machine

### Terminal theme and tweaks

<p align="center">
 <img src="./cli-snap.png" alt="cli snap" />
</p>

I use **iTerm2** and **Zsh** together with these followings, so you need to install these as well

- [Starship Prompt][1]
- [Shade of Purple for ITerm Theme][2].

You can import my settings from [iterm2][4] directory

### Special thanks to

- [Mathias Bynens](https://twitter.com/mathias)
- [Paul Irish](https://twitter.com/paul_irish)
- [Starship Theme Contributors][1] for Starship theme

[1]: https://starship.rs/
[2]: https://github.com/ahmadawais/Shades-of-Purple-iTerm2
[3]: fonts/
[4]: iterm2/
