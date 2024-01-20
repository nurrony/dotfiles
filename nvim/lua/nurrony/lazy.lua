local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = { { import = "nurrony.plugins" }, { import = 'nurrony.plugins.lsp' } }
local opts = {
  rtp = {
    disabled_plugins = {
      'gzip',
      'tutor',
      'tohtml',
      'matchit',
      'tarPlugin',
      'zipPlugin',
      'matchparen',
      'netrwPlugin',
    },
  },
  install = {
    colorscheme = { "tokyonight" },
  },

  checker = {
    enabled = true,
    notify = false,
  },

  change_detection = {
    notify = false,
  },
}

require("lazy").setup(plugins, opts)
