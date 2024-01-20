return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim"},
  config = function()
    local lualine = require("lualine")
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        globalstatus = true,
        theme = 'tokyonight',
      },
    })
  end,
}
