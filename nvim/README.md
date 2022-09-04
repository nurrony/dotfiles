# Neovim Setup and Customization

I now use Neovim and rather configuring it from scratch I opted into an awesome config provider called [NvChad][nvchad-link]. It is blazing fast and easily customizable.

## Prerequisites

1. [NvChad][nvchad-install-doc-link]
1. [NodeJS][nodejs-link]
1. [Go][golang-link]

## Customization

To have my configuration please do these followings

1. Copy `custom` folder inside `$HOME/.config/nvim/lua`
2. Open `nvim` and run `:PackerSync`

## Supported Languages and Tools

My customization comes with NvChad buit-ins + these following plugins and setup out of the box.

1. Plugins

   - ToogleTerm
   - AutoCloseTag
   - TrueZen

1. Languages

   - HTML
   - CSS
   - Javascript
   - Typescript
   - React + Angular + Vue
   - Bash + Zsh
   - Lua
   - Golang
   - JSON
   - TOML

1. Linters and Formatters
   - Prettier
   - ESlint
   - Shell-Format
   - Shell Checker
1. DevOps
   - Docker
   - Terraform
   - Kubernetes

## Special thanks to

- NvChad Contributors
- [Siduck](https://www.github.com/siduck)

## ToDo

<!-- Links -->

[golang-link]: https://go.dev
[nodejs-link]: https://nodejs.org
[nvchad-link]: https://nvchad.com
[nvchad-install-doc-link]: https://nvchad.com/quickstart/install#pre-requisites
