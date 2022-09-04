local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
  "html",
  "cssls",
  "emmet_ls",
  -- "clangd",
  "volar",
  "jsonls",
  "tsserver",
  "yamlls",
  "dockerls",

}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
