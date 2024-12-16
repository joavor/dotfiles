return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    require("mini.comment").setup()

    require("mini.cursorword").setup({ delay = 500 })

    require("mini.pairs").setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- Examples:
    -- - saiw) - [S]urrouna [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    require("mini.diff").setup()

    -- require("mini.completion").setup()
    --
    -- local imap_expr = function(lhs, rhs)
    --   vim.keymap.set("i", lhs, rhs, { expr = true })
    -- end
    -- imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
    -- imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

    -- local gen_loader = require("mini.snippets").gen_loader
    -- require("mini.snippets").setup({
    --   snippets = {
    --     gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),
    --     gen_loader.from_lang(),
    --   },
    -- })
    --
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    --
    -- require("lspconfig").cssls.setup({
    --   capabilities = capabilities,
    -- })
  end,
}
