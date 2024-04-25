# Nur Rony's Dotfiles

My dotfiles :smile: for Zsh on **MacOS**. Clone the repository and Run `setup.sh` to setup some initial requirements

My most favourite parts are `.functions` and `.dockerfunctions`

### Installation

To get all done in a minutes you can use the [setup script](https://github.com/nmrony/dotfiles/blob/master/setup) script

```sh
curl -s https://raw.githubusercontent.com/nmrony/dotfiles/master/setup | bash
```

### Customization

Do not forget to add or edit git username and email in `.extra` and `.gitconfig` with yours.

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

I have switched from Vim to NeoVim. To setup NeoVim Editor, Please check [`NVIM`](https://github.com/nurrony/nvim) repository for more on editor.

### Terminal theme and tweaks

<p align="center">
 <img src="./cli-snap.png" alt="cli snap" />
</p>

I use **iTerm2** and **Zsh** together with these followings, so you need to install these as well

- [Starship Prompt][starship-link]
- [Catppuccin for ITerm Theme][catppuccin-iterm].

You can import my settings by importing [iTerm Profile][iterm-profile-file] file

### Special thanks to

- [Mathias Bynens](https://twitter.com/mathias)
- [Paul Irish](https://twitter.com/paul_irish)
- [Starship Theme Contributors][starship-link] for Starship theme

[starship-link]: https://starship.rs/
[catppuccin-iterm]: https://github.com/catppuccin/iterm
[iterm-profile-file]: ./assets/Rony-iTerm.json
