return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<C-n>', '<CMD>Neotree filesystem toggle right<CR>', desc = 'Toggle file explorer' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    local neoTree = require('neo-tree')
    neoTree.setup({
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        follow_current_file = {
          enabled =true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_hidden = false,
        },
      },
    })

    -- keymaps
    vim.keymap.set('n', '<C-n>', '<cmd>Neotree filesystem toggle right<cr>', {noremap = true, silent = true, desc = 'Toggle file explorer' }) -- toggle file explorer
  end,
}
