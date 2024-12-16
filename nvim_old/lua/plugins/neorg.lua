return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function()
    require("neorg").setup({
      load = {
        ["core.concealer"] = {
          config = {
            code_block = {
              conceal = true,
            },
          },
        },
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = false,
          },
        },
      },
    })
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2

    local builtin = require("telescope.builtin")

    -- General keybinds
    vim.keymap.set("n", "<leader>nj<leader>", "<cmd>Neorg journal today<cr>", { desc = "[N]eorg [J]ournal today [ ]" })
    vim.keymap.set("n", "<leader>njN", "<cmd>Neorg journal yesterday<cr>", { desc = "[N]eorg [J]ournal yesterday [N]" })
    vim.keymap.set("n", "<leader>njn", "<cmd>Neorg journal tomorrow<cr>", { desc = "[N]eorg [J]ournal tomorrow [n]" })
    vim.keymap.set("n", "<leader>njg", "<cmd>Neorg journal custom<cr>", { desc = "[N]eorg [J]ournal [G]o to date" })
    vim.keymap.set("n", "<leader>njl", "<cmd>Neorg journal toc open<cr>", { desc = "[N]eorg [J]ournal [L]ist" })
    vim.keymap.set(
      "n",
      "<leader>nju",
      "<cmd>Neorg journal toc update<cr>",
      { desc = "[N]eorg [J]ournal [U]pdate list" }
    )

    vim.keymap.set("n", "<leader>nn<leader>", "<Plug>(neorg.dirman.new-note)", { desc = "[N]eorg [N]ote create [ ]" })
    vim.keymap.set("n", "<leader>nnf", function()
      builtin.find_files({ cwd = "~/notes" })
    end, { desc = "[N]eorg [N]otes [F]ind" })
    vim.keymap.set("n", "<leader>nng", function()
      builtin.live_grep({ cwd = "~/notes" })
    end, { desc = "[N]eorg [N]otes [G]rep" })

    -- Neorg specific

    -- Tasks
    vim.keymap.set(
      "n",
      "<leader>ntu",
      "<Plug>(neorg.qol.todo-items.todo.task-undone)",
      { desc = "[N]eorg [T]ask: Mark as [U]ndone" }
    )
    vim.keymap.set(
      "n",
      "<leader>ntd",
      "<Plug>(neorg.qol.todo-items.todo.task-done)",
      { desc = "[N]eorg [T]ask: Mark as [D]one" }
    )
    vim.keymap.set(
      "n",
      "<leader>ntc",
      "<Plug>(neorg.qol.todo-items.todo.task-cancelled)",
      { desc = "[N]eorg [T]ask: Mark as [C]ancelled" }
    )
    vim.keymap.set(
      "n",
      "<leader>ntp",
      "<Plug>(neorg.qol.todo-items.todo.task-pending)",
      { desc = "[N]eorg [T]ask: Mark as [P]ending" }
    )
    vim.keymap.set(
      "n",
      "<leader>nt!",
      "<Plug>(neorg.qol.todo-items.todo.task-important)",
      { desc = "[N]eorg [T]ask: Mark as important [!]" }
    )

    -- Lists
    vim.keymap.set("i", "<m-cr>", "<Plug>(neorg.itero.next-iteration)", {})
    vim.keymap.set("n", ">>", "<Plug>(neorg.promo.promote.nested)", {})
    vim.keymap.set("n", "<<", "<Plug>(neorg.promo.demote.nested)", {})

    -- Navigation
    vim.keymap.set("n", "<cr>", "<Plug>(neorg.esupports.hop.hop-link)", {})
  end,
}
