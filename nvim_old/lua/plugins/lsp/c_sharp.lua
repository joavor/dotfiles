return {
  {
    "iabdelkareem/csharp.nvim",
    dependencies = {
      { "williamboman/mason.nvim", config = true, opts = { ensure_installed = { "csharpier", "netcoredbg" } } },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          -- This line is essential to making automatic installation work
          -- :exploding-brain
          handlers = {},
          automatic_installation = {
            -- These will be configured by separate plugins.
            exclude = {
              "delve",
              "python",
            },
          },
          -- DAP servers: Mason will be invoked to install these if necessary.
          ensure_installed = {
            "bash",
            "codelldb",
            "php",
            "python",
            "omnisharp",
            "netcoredbg",
          },
        },
      },
      "mfussenegger/nvim-dap",
      "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
    },
    config = function()
      require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
      require("csharp").setup()
    end,
  },
  {
    "MoaidHathot/dotnet.nvim",
    cmd = "DotnetUI",
    opts = {},
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
}
