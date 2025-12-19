require("mason").setup()

local ensure_installed = {'ts_ls', 'lua_ls', 'pyright', 'bashls', 'html'}
require("mason-lspconfig").setup {
  automatic_installation = true,
  ensure_installed = ensure_installed,
}

local servers = {'ts_ls', 'lua_ls', 'pyright', 'clangd', 'bashls', 'html'}
for _, server in ipairs(servers) do 
  vim.lsp.enable(server)
end
