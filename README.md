# Nur Rony's Dotfiles

My dotfiles :smile: for Zsh on **MacOS**. Clone the repository and Run `setup.sh` to setup some initial requirements

My most favourite parts are `.functions` and `.containerfunctions`

### Installation

To get all done in a minutes you can use the [setup script](https://github.com/nurrony/dotfiles/blob/master/setup) script

```sh
curl -s https://raw.githubusercontent.com/nurrony/dotfiles/master/setup | bash
```

### Customization

Do not forget to add or edit git username and email in `.extra` and `.gitconfig` with yours. Also other path (i.e: `DOCKER_NETWORK_NAME`, `SSH_KEY_FILE_NAME`, `DEV_ZONE`, `DEV_ZONE_CONFIG_PATH`)

**Happy Hacking!!**

### Developers macOS defaults (?) :wink:

When setting up a new Mac, you may want to set some sensible macOS defaults:

```sh
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):

```sh
brew bundle install --file=./Brewfile
```

### Configure Vim Editor

I have switched from Vim to NeoVim. To setup NeoVim Editor, Please check [`My NeoVim PDE`](https://github.com/nurrony/nvim) repository for more on NeoVim configuration.

### Terminal configurations
The dotfiles comes with these popular terminal emulators.

- [Kitty](./kitty/): Copy `kitty` directory in `~/.config/`
- [ghostty](./ghostty/): Copy `ghostty` directory in `~/.config/`
- [WezTerm](./wezterm/): Copy `wezterm` directory in `~/.config`
- [Alacritty](./alacritty/): Copy `alacritty` directory in `~/.config`
- [Iterm2](./assets/iterm2/Rony-iTerm.json): Import this file and make it default

### Terminal theme and tweaks

<p align="center">
 <img src="./cli-snap.png" alt="cli snap" />
</p>

I use **WezTerm** and **Zsh** with **PowerLevel10k** together with these followings, so you need to install these as well

- Zsh Themes
  - There are configuration for most popular ZSH prompt themes. Uncomment the lines in [`zshrc`](./.zshrc) to load the theme.
    - [Powerlevel10k][p10k-link]
    - [Starship][starship-link]
    - [Oh My Posh][omp-link]
  - Terminal Theme: [Catppuccin Theme][catppuccin].
- Any Nerd Font of your choice. I like [JetBrains Mono](https://www.programmingfonts.org/#jetbrainsmono)
- You can import my settings by importing [iTerm Profile][iterm-profile-file] file

### Special thanks to

- [Mathias Bynens](https://twitter.com/mathias)
- [Paul Irish](https://twitter.com/paul_irish)
- [Oh My Posh Contributors][omp-link] for Oh My Posh theme
- [Starship Contributors][starship-link] for Starship theme
- [Powerlevel10k Contributors][p10k-link] for Powerlevel10k theme

[omp-link]: https://ohmyposh.dev/
[starship-link]: https://starship.rs/
[iterm-profile-file]: assets/iterm2/Rony-iTerm.json
[p10k-link]: https://github.com/romkatv/powerlevel10k
[catppuccin]: https://github.com/catppuccin
