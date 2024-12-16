local map = vim.keymap.set
local cmd = vim.api.nvim_create_user_command

-- Run

local function c_run()
  local project_root = vim.fs.root(0, { ".run.sh" })
  local command = project_root .. "/.run.sh"

  -- require("snacks").terminal(command, {
  --   auto_close = false,
  --   auto_insert = true,
  -- })

  vim.cmd('silent !tmux split-window -dh -p 32 "' .. command .. '"')
end

map("n", "<leader>rr", c_run, { desc = "Run .run.sh" })
cmd("CRun", c_run, { desc = "Run .run.sh" })

-- Docker run

local function docker_run()
  local project_root = vim.fs.root(0, { "Dockerfile" })
  local command = "cd " .. project_root .. " && " .. "docker run --rm -it $(docker build -q .)"

  -- require("snacks").terminal(command, {
  --   auto_close = false,
  --   auto_insert = false,
  -- })

  vim.cmd('silent !tmux split-window -dh -p 32 "' .. command .. '"')
end

map("n", "<leader>rd", docker_run, { desc = "Docker run" })
cmd("CDockerRun", docker_run, { desc = "Docker run" })
