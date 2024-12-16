return {
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
}
