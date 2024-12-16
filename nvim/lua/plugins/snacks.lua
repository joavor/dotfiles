---@diagnostic disable: undefined-global

local function get_listed_bufs()
  return vim.tbl_filter(function(bufnr)
    return vim.api.nvim_buf_get_option(bufnr, "buflisted")
  end, vim.api.nvim_list_bufs())
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
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
        -- { section = "keys", padding = 1 },
        -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 0, padding = 1 },
      },
    },
    explorer = {
      enabled = true,
      -- replace_netrw = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
    lazygit = { enabled = true },
    terminal = {
      start_insert = false,
      opts = {
        term_normal = {
          "<esc>",
          function(self)
            self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
            if self.esc_timer:is_active() then
              self.esc_timer:stop()
              vim.cmd("stopinsert")
            else
              self.esc_timer:start(200, 0, function() end)
              return "<esc>"
            end
          end,
          mode = "t",
          expr = true,
          desc = "Double escape to normal mode",
        },
      },
    },
  },
  keys = {
    {
      "<leader>tt",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle zen",
    },
    -- Top Pickers & Explorer
    {
      "<leader>f.",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart [F]ind Files [.]",
    },
    {
      "<leader><leader><leader>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>f/",
      function()
        Snacks.picker.grep()
      end,
      desc = "[F]ind [G]rep",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "[F]ind [N]otifications",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer()
      end,
      desc = "[F]ile [E]xplorer",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "[F]ind [P]rojects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "[F]ind [R]ecent",
    },
    -- git
    {
      "<leader>fgb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "[F]ind [G]it [B]ranches",
    },
    {
      "<leader>fgl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "[F]ind [G]it [l]og",
    },
    {
      "<leader>fgs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "[F]ind [G]it [S]tatus",
    },
    {
      "<leader>fgS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "[F]ind [G]it [S]tash",
    },
    {
      "<leader>fgd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "[F]ind [G]it [D]iff (Hunks)",
    },
    {
      "<leader>fgL",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "[F]ind [G]it [L]og File",
    },
    -- search
    {
      '<leader>f"',
      function()
        Snacks.picker.registers()
      end,
      desc = "[F]ind [R]egisters",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "[F]ind [C]ommand History",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "[F]ind in [H]elp pages",
    },
    {
      "<leader>fi",
      function()
        Snacks.picker.icons()
      end,
      desc = "[F]ind [I]cons",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "[F]ind [K]eymaps",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.marks()
      end,
      desc = "[F]ind [M]arks",
    },
    {
      "<leader>fH",
      function()
        Snacks.picker.man()
      end,
      desc = "[F]ind in Man Pages ([H]elp)",
    },
    {
      "<leader>fq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "[F]ind [Q]uickfix List",
    },
    {
      "<leader>f<leader>",
      function()
        Snacks.picker.resume()
      end,
      desc = "[ ] Resume last find",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "[F]ind [U]ndo History",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>fls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "[F]ind LSP [S]ymbols",
    },
    {
      "<leader>flS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "[F]ind LSP Workspace [S]ymbols",
    },
  },
}
