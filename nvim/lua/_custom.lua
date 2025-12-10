local function get_migrations_path()
  -- Get the full path of the current buffer
  local buf_path = vim.api.nvim_buf_get_name(0)

  -- Extract the directory path
  local dir_path = vim.fn.fnamemodify(buf_path, ":p:h")

  -- Find the position of "schema-model" in the path
  local cutoff = string.find(dir_path, "schema%-model")

  if not cutoff then
    vim.notify("Directory 'schema-model' not found in path", vim.log.levels.ERROR)
    return nil
  end

  -- Trim the path at "schema-model"
  local base_path = string.sub(dir_path, 1, cutoff - 1)

  -- Append "schema-model/migrations" to the trimmed path
  local migrations_path = base_path .. "migrations"

  return migrations_path
end

local function get_highest_migration_number(dir)
  local highest = 0

  -- Use vim.loop to read directory contents
  local uv = vim.loop
  local handle = uv.fs_scandir(dir)
  if not handle then
    vim.notify("Could not read directory: " .. dir, vim.log.levels.ERROR)
    return nil
  end

  while true do
    local name, type = uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if type == "file" then
      -- Match filenames like "V1.2.3.45__description.sql"
      local n_str = name:match("^V%d+%.%d+%.%d+%.(%d+)__")
      if n_str then
        local n = tonumber(n_str)
        if n and n > highest then
          highest = n
        end
      end
    end
  end

  return highest
end
local function get_highest_migration_prefix(dir)
  local uv = vim.loop
  local handle = uv.fs_scandir(dir)
  if not handle then
    vim.notify("Could not read directory: " .. dir, vim.log.levels.ERROR)
    return nil
  end

  local highest_n = -1
  local highest_prefix = nil

  while true do
    local name, type = uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if type == "file" then
      -- Match filenames like "V1.2.3.45__description.sql"
      local full_prefix, n_str = name:match("^(V%d+%.%d+%.%d+%.)(%d+)__")
      if n_str then
        local n = tonumber(n_str)
        if n and n > highest_n then
          highest_n = n
          highest_prefix = full_prefix
        end
      end
    end
  end

  return highest_prefix
end

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

-- Create migration from buffer

local function create_migration()
  local migrations_path = get_migrations_path()
  local latest_migration_v = get_highest_migration_prefix(migrations_path)
  local next_migration_no = get_highest_migration_number(migrations_path) + 1

  Snacks.input({
    prompt = "Migration file name (without extension)",
    default = latest_migration_v .. next_migration_no .. "__",
  }, function(filename)
    local full_file_path = migrations_path .. "/" .. filename .. ".sql"
    -- get the current buffer's content as a table of lines
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- convert the table of lines into a single string with newlines
    local content = table.concat(lines, "\n")

    -- open the new file in write mode
    local file = io.open(full_file_path, "w")

    if file then
      -- write the content to the file
      file:write(content)
      file:close()
      vim.cmd("edit " .. full_file_path)
      Snacks.notify("buffer content copied to: " .. filename, vim.log.levels.info)
    else
      Snacks.notify("error: could not open file for writing: " .. filename, vim.log.levels.error)
    end
  end)
end

map("n", "<leader>rd", create_migration, { desc = "Create migration" })
cmd("CCreateMigration", create_migration, { desc = "Create migration" })
