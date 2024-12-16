return {
  -- Modify the statusline
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    require("lualine").setup({
      options = {
        theme = "everforest",
        icons_enabled = true,
      },
    })
  end,
}
