return {
  "augmentcode/augment.vim",
  keys = {
    {
      "<leader>aa",
      mode = { "n" },
      function()
        vim.cmd("Augment chat-toggle")
      end,
      desc = "Toggle Augment chat",
    },
    {
      "<leader>ac",
      mode = { "n", "v" },
      function()
        vim.cmd("Augment chat")
      end,
      desc = "Augment chat",
    },
    {
      "<leader>aC",
      mode = { "n", "v" },
      function()
        vim.cmd("Augment chat-new")
      end,
      desc = "New Augment chat",
    },
  },
}
