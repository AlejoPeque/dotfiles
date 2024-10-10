return {"ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000, -- Para cargarlo primero
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end,
}
