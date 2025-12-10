return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason.nvim",
      "saghen/blink.cmp",
    },

    opts = {
      servers = {
        ts_ls = {},
        cssls = {},
        -- csharp_ls = {},
        tailwindcss = {},
        jsonls = {},
        emmet_language_server = {},
        bashls = {},
        sqls = {},
        gopls = {},
      },
    },

    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local capabilities = require("blink-cmp").get_lsp_capabilities()

      mason.setup()

      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      local opt = {
        -- ...
        signs = {
          left = "",
          right = "",
          diag = "●",
          arrow = "    ",
          up_arrow = "    ",
          vertical = " │",
          vertical_end = " └",
        },
        blend = {
          factor = 0.22,
        },
        -- ...
      }

      require("tiny-inline-diagnostic").setup(opt)
    end,
  },
}
