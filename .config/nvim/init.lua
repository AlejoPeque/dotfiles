require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- Relative Numbers
-- Para Neovim en Lua
-- vim.wo.relativenumber = true
-- vim.opt.signcolumn = "yes"

-- Italic and Bold
vim.api.nvim_set_hl(0, "Comment", { italic = true })  -- Para comentarios
-- vim.api.nvim_set_hl(0, "Function", { bold = true })  -- Para funciones

-- Cambia el color de la línea actual
-- vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2A2A2A' })  -- usa el color que prefieras


-- Configurar plegado de código
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]])

vim.opt.termguicolors = true  -- Asegura que Neovim use colores verdaderos

-- Code Runner
require('code_runner').setup({
    filetype = {
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
          },
          python = "python3 -u",
          typescript = "ts-node $fileName",
          javascript = "node $fileName",
          rust = "rustc $fileName && ./$fileNameWithoutExt",
          go = "go run $fileName",
          c = function(...)
            local c_base = {
              "cd $dir &&",
              "clang $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
              "/tmp/$fileNameWithoutExt",
            }
            local c_exec = {
              "&& /tmp/$fileNameWithoutExt &&",
              "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
              c_base[4] = input
              require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
            end)
          end,
        },
})


vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })

-- Personaliza CMDLINE
vim.cmd([[
  highlight NoiceCmdline guibg=#1E1E1E guifg=#C678DD
  highlight NoicePopupmenu guibg=#1E1E1E guifg=#ABB2BF
]])

-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7596e4" })  -- Cambia el color del número de la línea actual



-- THEME
vim.o.background = "dark"
vim.cmd([[colorscheme mellow]]) -- Change the theme here
vim.cmd("syntax reset")

