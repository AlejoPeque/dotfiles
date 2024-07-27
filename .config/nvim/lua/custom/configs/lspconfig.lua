local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = { "tsserver", "tailwindcss", "eslint", "gopls", "pyright" }

local function setup_server(server, config)
  lspconfig[server].setup(config)
end

local common_config = {
  on_attach = on_attach,
  capabilities = capabilities
}

for _, lsp in ipairs(servers) do
  if lsp == "gopls" then
    setup_server(lsp, vim.tbl_extend("force", common_config, {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }))
  else
    setup_server(lsp, common_config)
  end
end
