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
    vim.keymap.set("n", "<C-k>", "<cmd>Treewalker Up<cr>", { silent = true, desc = "Move cursor to previous sibling" })
    vim.keymap.set("n", "<C-j>", "<cmd>Treewalker Down<cr>", { silent = true, desc = "Move cursor to next sibling" })
    vim.keymap.set("n", "<C-K>", "<cmd>Treewalker SwapUp<cr>", { silent = true, desc = "Swap with previous sibling" })
    vim.keymap.set("n", "<C-J>", "<cmd>Treewalker SwapDown<cr>", { silent = true, desc = "Swap with next sibling" })
  end,
}
