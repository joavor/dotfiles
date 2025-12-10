local lspconfig = require("lspconfig")

-- Common keymaps
local function add_common_keymaps()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show definition" })

  -- vim.keymap.set("n", "gD", vim.lsp.buf.definition, { buffer = 0, desc = "Go to definition" })
  -- vim.keymap.set("n", "gd", vim.lsp.buf.implementation, { buffer = 0, desc = "Go to implementation" })
  -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0, desc = "Go to type definition" })

  vim.keymap.set("n", "gen", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, { buffer = 0, desc = "Go to next diagnostic message" })
  vim.keymap.set("n", "geN", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, { buffer = 0, desc = "Go to previous diagnostic message" })
end

-- Settings

-- vim.diagnostic.config({
--   float = false,
--   virtual_lines = { current_line = true },
-- })

-- LSP

vim.lsp.handlers["client/registerCapability"] = (function(overridden)
  return function(err, res, ctx)
    local result = overridden(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
      return
    end
    -- Call your custom on_attach logic...
    -- my_on_attach(client, vim.api.nvim_get_current_buf())
    return result
  end
end)(vim.lsp.handlers["client/registerCapability"])

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = function(args)
    local token = args.data.token
    if token.type == "variable" and token.modifiers.defaultLibrary then
      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@lsp.mod.defaultLibrary")
    end
  end,
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = function()
    print("Attached to Lua LSP")

    add_common_keymaps()
  end,
})

-- C#
lspconfig.csharp_ls.setup({
  on_attach = function()
    print("Attached to C# LSP")

    add_common_keymaps()

    vim.keymap.set("n", "<leader>rr", function()
      -- local snacks = require("snacks")
      -- local terminal = snacks.terminal.toggle(nil, { auto_close = false, auto_insert = true, start_insert = false })
      local cmd = "ls"
      local term = Snacks.terminal.open(nil, {
        auto_insert = false,
        win = {
          split = "below",
          height = 0.4,
          position = "bottom",
          focusable = true,
          enter = false,
          show = true,
          hide = false,
        },
      })
      local chan = vim.bo[term.buf].channel
      vim.defer_fn(function()
        vim.fn.chansend(chan, { cmd .. "\r\n" })
      end, 100)
    end, { buffer = 0, desc = "Run (.NET)" })
  end,
})

-- Go
lspconfig.gopls.setup({
  on_attach = function()
    print("Attached to Go LSP")

    add_common_keymaps()
  end,
})

-- Fish
lspconfig.fish_lsp.setup({
  on_attach = function()
    print("Attached to Fish LSP")

    add_common_keymaps()
  end,
})

-- !!! https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "html", "cssls", "ansiblels", "eslint", "jsonls", "ts_ls", "yamlls", "dockerls" }

-- lsps with default config
vim.lsp.enable(servers)

vim.lsp.config("roslyn", {}) -- no vim.lsp.enable() necessary here

-- IMPORTANT: vim diagnostic configuration AFTER LSPs are loaded
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})
