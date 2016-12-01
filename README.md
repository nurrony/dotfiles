Nur Rony's Dotfiles
===================
My dotfiles :smile: for Zsh on **MacOS**. Clone the repository and Run `setup.sh` to setup some initial requirements 

My most favourite parts are `.functions` and `.dockerfunctions`

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
### Terminal theme and tweaks
<p align="center">
 <img src="./cli-snap.png" alt="cli snap" />
</p>

I use **iTerm2** and **Zsh** together and **[Powerlevel9][1]** as theme. 
You need to install these followings to get look like my terminal theme

1. [Dracula theme for iTerm2][2]
1. [SourceCodePro Powerline Awesome Regular][3] - Font size: 15

You can import my settings from [iterm2][4] directory

### Special thanks to

- [Mathias Bynens](https://twitter.com/mathias)
- [Jess Frazelle](https://twitter.com/jessfraz)
- [Paul Irish](https://twitter.com/paul_irish)

[1]: https://github.com/bhilburn/powerlevel9k
[2]: https://draculatheme.com/iterm/
[3]: fonts/SourceCodePro+Powerline+Awesome+Regular.ttf
[4]: iterm2/
