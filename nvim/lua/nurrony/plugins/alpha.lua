
return {
  'goolord/alpha-nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  enabled = true,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local fortune = require("alpha.fortune")

    local header_collection = {}

    header_collection.default = {
      "                                                    ",
      " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                    ",
    }

    local header = header_collection.default

    -- Make the header a bit more fun with some color!
    local function colorize_header()
      local lines = {}

      for _, chars in pairs(header) do
        local line = {
          type = "text",
          val = chars,
          opts = {
            hl = "Function",
            shrink_margin = true,
            position = "center",
          },
        }

        table.insert(lines, line)
      end

      return lines
    end

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene<CR>"),
      dashboard.button("󱁐 ff", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("󱁐 fr", "  Find recent file", ":Telescope oldfiles<CR>"),
      dashboard.button("󱁐 fs", " Find word", ":Telescope live_grep<CR>"),
      dashboard.button("q", "󰍃 Quit Neovim", ":qa<CR>"),
    }

    -- Everyone could use a good fortune cookie from time to time, right?
    dashboard.section.footer.val = fortune()

    -- Hide all the unnecessary visual elements while on the dashboard, and add
    -- them back when leaving the dashboard.
    local group = vim.api.nvim_create_augroup("CleanDashboard", {})

    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "AlphaReady",
      callback = function()
        vim.opt.showtabline = 0
        vim.opt.showmode = false
        vim.opt.showcmd = false
        vim.opt.ruler = false
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      group = group,
      pattern = "<buffer>",
      callback = function()
        vim.opt.showtabline = 2
        vim.opt.showmode = false
        vim.opt.showcmd = true
        vim.opt.ruler = true
      end,
    })

    alpha.setup({
      layout = {
        { type = "padding", val = 1 },
        { type = "group", val = colorize_header() },
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        dashboard.section.footer,
      },
      opts = { margin = 5 },
    })
  end
}
