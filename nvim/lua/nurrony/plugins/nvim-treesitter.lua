return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require('nvim-treesitter.configs')

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          'json',
          'java',
          'javascript',
          'typescript',
          'tsx',
          'xml',
          'yaml',
          "make",
          "html",
          "sql",
          "hcl",
          'css',
          'markdown',
          'markdown_inline',
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
          'query',
          'regex',
          -- 'prisma',
          -- 'svelte',
          -- 'graphql',
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      })

      -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
      require('ts_context_commentstring').setup {}
    end,
 }
