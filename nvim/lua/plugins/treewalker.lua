return {
  "aaronik/treewalker.nvim",
  opts = {
    -- Whether to briefly highlight the node after jumping to it
    highlight = true,

    -- How long should above highlight last (in ms)
    highlight_duration = 250,

    -- The color of the above highlight. Must be a valid vim highlight group.
    -- (see :h highlight-group for options)
    highlight_group = "CursorLine",
  },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>csk",
      "<cmd>Treewalker Up<cr>",
      { silent = true, desc = "Move cursor to previous sibling" }
    )
    vim.keymap.set(
      "n",
      "<leader>csj",
      "<cmd>Treewalker Down<cr>",
      { silent = true, desc = "Move cursor to next sibling" }
    )
    vim.keymap.set(
      "n",
      "<leader>csK",
      "<cmd>Treewalker SwapUp<cr>",
      { silent = true, desc = "Swap with previous sibling" }
    )
    vim.keymap.set(
      "n",
      "<leader>csJ",
      "<cmd>Treewalker SwapDown<cr>",
      { silent = true, desc = "Swap with next sibling" }
    )
  end,
}
