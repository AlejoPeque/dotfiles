return {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("oldworld").setup({
        terminal_colors = true,
        styles = {
            booleans = { italic = true, bold = true },
        },
        integrations = {
            alpha = true,
            cmp = true,
            flash = true,
            gitsigns = true,
            hop = false,
            indent_blankline = true,
            lazy = true,
            lsp = true,
            markdown = true,
            mason = true,
            navic = false,
            neo_tree = false,
            neorg = false,
            noice = true,
            notify = true,
            rainbow_delimiters = true,
            telescope = true,
            treesitter = true,
        },
    })
    end
}
