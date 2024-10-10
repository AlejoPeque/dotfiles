return {
  "killitar/obscure.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
        booleans = { italic = true, bold = true },
    },
    on_highlights = function(hl,c)
        hl.Comment = { fg = "#ffffff" }
        -- Or
        hl.Comment = { fg = c.orange }
    end
  },
  config = function()
    require("obscure").setup(opts)
  end,
}
