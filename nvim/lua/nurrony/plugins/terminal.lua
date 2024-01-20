return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {'<C-`>', '<CMD>Toggleterm<CR>', desc = 'Toggle Terminal'},
  },
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-`>]],
      direction = "float",
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = true,
      persist_mode = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
      insert_mappings = true,
      float_opts = {
        border = "double",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}
