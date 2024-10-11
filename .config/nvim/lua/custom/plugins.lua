local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  { "mattn/emmet-vim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "css",
      "scss",
      "html",
      "json",
      "lua",
      "python",
      "go",
      "rust",
      "java",
    },
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "terryma/vim-multiple-cursors",
  },
  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
    config = function(_)
      vim.g.crystal_auto_format = 1
    end
  },
  {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    keys = {
      {
        "<leader>fs",
        function() require("rip-substitute").sub() end,
        mode = { "n", "x" },
        desc = " rip substitute",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function ()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    opts = {
      handlers = {},
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettier",
        "typescript-language-server",
        "tailwindcss-language-server",
        "gopls",
        "black",
        "mypy",
        "ruff",
        "pyright",
        "rust-analyzer",
        "clangd",
        -- "clangd-format",
        "codelldb",
        "css-lsp",
        "html-lsp",
      }
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require("rust-tools").setup({})
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "VimEnter", "BufWinEnter", "InsertEnter" },
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "java",
        "python",
        "go",
        "rust",
        "json",
      }
      return opts
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.g.copilot_filetypes = {
        ["TelescopePrompt"] = false,
        ["grug-far"] = false,
        ["grug-far-history"] = false,
      }
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_workspace_folders = "~/Projects"
      local keymap = vim.keymap.set
      local opts = { silent = true }
      keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
      keymap("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)
      keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
      keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
      keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)
    end,
  },
  { "mfussenegger/nvim-jdtls", event = "BufRead" },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local hooks = require "ibl.hooks"
      -- Crear el grupo de resaltado en el hook de configuración de resaltado
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
          vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#FFFFFF", nocombine = true })
      end)

      require("ibl").setup({
        indent = {
          char = "|",
        },
        exclude = {
          buftypes = { "terminal" },
          filetypes = { "help", "packer" },
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
          highlight = { "IndentBlanklineContextChar" },
        },
      })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#5489b8",  -- Ajusta el color de fondo aquí
        stages = "slide",    -- Estilo de animación para las notificaciones
        timeout = 5000,                  -- Duración antes de que las notificaciones desaparezcan (en milisegundos)
        max_width = 80,                  -- Ancho máximo de los mensajes de notificación
        min_width = 50,                  -- Ancho mínimo de los mensajes de notificación
        max_height = 10,                 -- Número máximo de líneas para un mensaje
        level = vim.log.levels.INFO,     -- Nivel mínimo de registro para mostrar notificaciones
        top_down = true,                 -- Posicionar las notificaciones de arriba hacia abajo
      })

      -- Establecer 'notify' como el sistema de notificaciones predeterminado
      vim.notify = require("notify")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true, -- habilita la UI personalizada para cmdline
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          },
        },
        popupmenu = {
          enabled = true, -- habilita el popupmenu en cmdline
        },
        messages = {
          enabled = true, -- habilita los mensajes estilizados
        },
        notify = {
          enabled = true, -- usa `nvim-notify` si está instalado
        },
        lsp = {
          hover = {
            enabled = false, -- deshabilita el hover de LSP en Noice
          },
          signature = {
            enabled = false, -- puedes mantener habilitada la firma si lo deseas
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim", -- Dependencia requerida para Noice UI
      "rcarriga/nvim-notify", -- Opcional para mejores notificaciones
    }
  },
  {
    "CRAG666/code_runner.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "jupyter-vim/jupyter-vim",
    requires = { 'nvim-lua/plenary.nvim' }
  }
}
return plugins
