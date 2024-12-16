return {
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
    { "<leader>fo", "<cmd>Oil<cr>", desc = "[F]ile Management - [O]il" },
  },
}
