return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
    },
    keys = {
      { "<leader>fm", "<cmd>Oil<cr>", desc = "[F]ile [M]anagement" },
    },
  },
}
