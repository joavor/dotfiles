---@diagnostic disable-next-line: undefined-global
---@diagnostic disable-next-line: lowercase-global
vim = vim

local utils = require("utils.keymaps")
utils.map("n", "<leader>j", "<cmd>echo 'test'<cr>", { desc = "Test" })

utils.map("n", "ge", "<cmd>echo 'TODO: Execute code block if any'<cr>", { desc = "TODO: Execute code block" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Window (pane) navigation using Vim motions
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
-- vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
-- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
-- vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
-- vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
-- vim.keymap.set("n", "<leader>fa", function()
--   builtin.find_files({ hidden = true })
-- end, { desc = "[F]ind [A]ll files" })
-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
--
-- vim.keymap.set("n", ";", "<cmd>Telescope cmdline<cr>", { desc = "[;] Telescope command line" })
--
-- -- Slightly advanced example of overriding default behavior and theme
-- vim.keymap.set("n", "<leader>ft", function()
--   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = false,
--   }))
-- end, { desc = "[/] Fuzzily search in current buffer" })
--
-- -- It's also possible to pass additional configuration options.
-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
-- vim.keymap.set("n", "<leader>f/", function()
--   builtin.live_grep({
--     grep_open_files = true,
--     prompt_title = "Live Grep in Open Files",
--   })
-- end, { desc = "[F]ind [/] in Open Files" })
--
-- -- Shortcut for searching your Neovim configuration files
-- vim.keymap.set("n", "<leader>fc", function()
--   builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[F]ind Neovim [C]onfiguration files" })

-- Keymap for closing (deleting) a buffer
vim.keymap.set("n", "<leader>bq", function()
  vim.cmd("bd")
end, { desc = "Quit buffer" })

vim.keymap.set("n", "<leader>bn", function()
  local filename = vim.fn.input("Filename: ")
  local command = string.format("e %s", filename)
  vim.cmd(command)
end, { desc = "New buffer" })

vim.keymap.set("n", "<leader>bs", function()
  vim.cmd("w")
end, { desc = "Save buffer" })

vim.keymap.set("n", "<leader>u", function()
  vim.cmd("UndotreeToggle")
end, { desc = "Toggle undotree" })

vim.keymap.set("n", "<leader>h", function()
  require("blockheader").prompt_and_write()
end, { desc = "[H]eader" })

vim.keymap.set("n", "<leader>?", function()
  print(vim.lsp.get_clients())
end, { desc = "[H]eader" })

vim.keymap.set("n", "<leader>.b", function()
  vim.cmd(":terminal dotnet build")
end, { desc = "[.]NET [B]uild" })

vim.keymap.set("n", "<leader>.pr", function()
  vim.cmd(":terminal dotnet restore")
end, { desc = "[.]NET [P]ackage [R]estore" })

vim.keymap.set("n", "<leader>.pa", function()
  local project = "./Icore.Hours.csproj"
  local package = "package"
  local command = string.format(":terminal dotnet add %s package ", project, package)
  vim.cmd(command)
end, { desc = "[.]NET [P]ackage [A]dd" })

vim.keymap.set("n", "<leader>.r", function()
  require("csharp").run_project()
end, { desc = "[.]NET [R]un" })

vim.keymap.set("n", "<leader>.d", function()
  -- require("csharp").debug_project()
  require("dap").continue()
end, { desc = "[.]NET [D]ebug" })

vim.keymap.set("n", "gqj", function()
  vim.cmd(":cnext")
end)

vim.keymap.set("n", "gqk", function()
  vim.cmd(":cprev")
end)

vim.keymap.set("n", "<leader>aa", function()
  vim.cmd(":Augment chat")
end, { desc = "[A]I [A]sk question" })

vim.keymap.set("n", "<leader>ah", function()
  vim.cmd(":Augment chat-history")
end, { desc = "[A]I chat [H]istory" })

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
