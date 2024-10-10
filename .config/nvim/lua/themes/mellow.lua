return {
  "mellow-theme/mellow.nvim",
  config = function()
    vim.cmd("colorscheme mellow")
    vim.g.mellow_italic_functions = true
    vim.g.mellow_bold_functions = true
    vim.g.mellow_transparent = true
    vim.g.mellow_highlight_overrides = {
      ["NormalNC"] = { link = "Normal" },
      ["CursorLine"] = { bg = "NONE" },  -- Eliminar el resaltado de la línea actual
      ["CursorLineNr"] = { fg = "#eeeeee" }  -- Cambiar el color del número de línea activo a blanco
    }
  end,
}
