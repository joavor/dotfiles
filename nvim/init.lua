-- All configuration is moved to separate files

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- Set tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

-- Set file formats
vim.opt.ffs = "unix,dos"

vim.g.augment_workspace_folders = {
  vim.fn.expand("~/Development/personal/repos/dotfiles/"),
  vim.fn.expand("~/Development/apto/repos/icore-worker/"),
}

vim.g.augment_chat_history_dir = vim.fn.expand("~/.local/share/nvim/augment/chat_history")

-- Enable chat history
vim.g.augment_save_chat_history = true
-- Set chat history format (optional)
vim.g.augment_chat_history_format = "markdown"

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function(ctx)
    local msg = "Started macro recording ["
      .. vim.fn.reg_recording()
      .. "]\n\n"
      .. "Buffer ["
      .. ctx.buf
      .. "]\n"
      .. "File ["
      .. ctx.file
      .. "]"
    vim.notify(msg)
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function(ctx)
    local msg = "Stopped macro recording ["
      .. vim.fn.reg_recording()
      .. "]\n\n"
      .. "Buffer ["
      .. ctx.buf
      .. "]\n"
      .. "File ["
      .. ctx.file
      .. "]"
    vim.notify(msg)
  end,
})

local is_in_tmux = vim.fn.system({ "test", "-n", "$TMUX" })

if is_in_tmux then
  print("true")
else
  print("false")
end
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux tmux-sessions<CR>")
vim.keymap.set("n", "<C-a>", "<cmd>silent !tmux tmux-session-actions<CR>")
vim.keymap.set("n", "<leader>X", function()
  local file = vim.fn.expand("%:p")
  vim.fn.system({ "tmux", "popup", file })
end, { desc = "Execute current file" })

require("config")
require("lsp")
require("_custom")

-- Remove unnecessary keymaps
local keymaps = { "gI" }
for _, k in pairs(keymaps) do
  vim.keymap.del("n", k)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
