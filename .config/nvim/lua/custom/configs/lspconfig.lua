local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = {
  "ts_ls",
  "tailwindcss",
  "eslint",
  "gopls",
  "pyright",
  "jdtls",
  "cssls",  -- Asegúrate de que esté en la lista de servidores
}

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Aquí puedes agregar la configuración específica para cssls
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less", "sass" },  -- Soporte para los tipos de archivo
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
    sass = {
      validate = true,
    },
  },
})

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
