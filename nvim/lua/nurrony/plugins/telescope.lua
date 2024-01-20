-- set keymaps

local config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      oldfiles = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
  })
  -- keymaps
  local keymap = vim.keymap -- for conciseness

  keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Find git status" })
  keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Find git commits" })
  keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
  keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
  keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "List keymaps" })
  keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Show help" })
  keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
  keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find the buffers" })
  keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
end

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  branch = "0.1.x",
  config = config,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Show help" },
    {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "List keymaps" },
    {"<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Find git status" },
    {"<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Find git commits" },
    {"<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
    {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Fuzzy find the buffers"},
    {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
    {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
  },
}
