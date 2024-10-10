return {"rebelot/kanagawa.nvim",
    config = function ()
      require("kanagawa").setup({
        italic_comments = true,
        italic_keywords = true,
        italic_functions = true,
        italic_variables = true,
        italic_strings = true,
        italic_constants = true,
        italic_classes = true,
        italic_exceptions = true,
        italic_operators = true,
        italic_numbers = true,
        -- transparent = true,
        hide_eob = false,
        custom_colors = {},
      })
    end
}
