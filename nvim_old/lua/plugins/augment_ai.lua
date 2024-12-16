return {
  -- {
  --   "augmentcode/augment.vim",
  -- },
  {
    "olimorris/codecompanion.nvim",
    config = function()
      local cc = require("codecompanion")
      cc.setup({
        strategies = {
          chat = {
            adapter = "anthropic",
          },
          inline = {
            adapter = "anthropic",
          },
        },
      })

      cc.adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "",
            },
          })
        end,
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
