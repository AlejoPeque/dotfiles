---@type ChadrcConfig
local M = {}

M.ui = {
  -- theme = "aquarium",
  -- transparency = true,
  statusline = { theme = "vscode", },
  cmp = {
    style = "default",
  },
  lsp = {
    signature = nil
  }
}
M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")

-- Asegúrate de tener el plugin de Emmet instalado en tu configuración de plugins
vim.cmd [[
  " Autocommands para habilitar Emmet en HTML y CSS
  autocmd FileType html,css setlocal omnifunc=emmet_complete
  autocmd FileType html,css inoremap <C-E> <C-X><C-O>
]]

return M