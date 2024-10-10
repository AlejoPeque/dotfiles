return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,  -- Para asegurarte de que se cargue antes de otros temas
    opts = {
      transparent = true,
      style = "moon",
      terminal_colors = true,  -- Usar los colores del tema en el terminal
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",  -- Hacer las barras laterales transparentes
        floats = "transparent",    -- Hacer las ventanas flotantes transparentes
      },
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors)
        highlights.Normal = { bg = "NONE" }  -- Desactiva el fondo de las líneas resaltadas
        highlights.CursorLine = { bg = "NONE" }  -- Desactiva el fondo de la línea del cursor
        highlights.LineNr = { bg = "NONE" }  -- Desactiva el fondo de los números de línea
        highlights.LineNr = { fg = "#717171", bg = "NONE" }
      end,
    },
}
