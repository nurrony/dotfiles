local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "xml",
    "lua",
    "bash",
    "make",
    "html",
    "css",
    "tsx",
    "sql",
    "hcl",
    "json",
    "yaml",
    "markdown",
    "typescript",
    "javascript",
    "dockerfile",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    "bash-language-server",
    "terraform-ls",
    "cfn-lint",
    "shfmt",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "yamlfmt",
    "prettier",
    "eslint-lsp",
    "yaml-language-server",
    "typescript-language-server",
    "dockerfile-language-server",
    "docker-compose-language-service"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    side = "right"
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
