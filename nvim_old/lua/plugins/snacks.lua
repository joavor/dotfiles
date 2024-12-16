return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 15000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    zen = {
      show = {
        statusline = false,
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
                ]],
      },
      sections = {
        { section = "header" },
        -- {
        --   pane = 1,
        --   section = "terminal",
        --   enabled = function()
        --     return Snacks.git.get_root() ~= nil
        --   end,
        --   cmd = "echo $PWD",
        --   height = 1,
        --   padding = 1,
        -- },
        { section = "keys", padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 0, padding = 1 },
        -- { icon = " ", title = "Projects", section = "projects", indent = 0, padding = 1 },
        -- { section = "startup" },
        -- {
        --   pane = 1,
        --   icon = " ",
        --   title = "Git Status",
        --   section = "terminal",
        --   enabled = function()
        --     return Snacks.git.get_root() ~= nil
        --   end,
        --   cmd = "clear && git status --short --branch --untracked-files=normal",
        --   -- height = 1,
        --   padding = 1,
        -- },
      },
    },
  },
  keys = {
    {
      "<leader><esc>",
      function()
        Snacks.dashboard()
      end,
      desc = "Show dashboard",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit: Log",
    },
    {
      "<leader>t",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle terminal",
    },
    {
      "<leader>sn",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show notification history",
    },
  },
}
