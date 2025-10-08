return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = { "rafamadriz/friendly-snippets" },

  -- use a release tag to download pre-built binaries
  version = "1.0.0",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "super-tab",
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

-- return {
-- { "L3MON4D3/LuaSnip", keys = {} },
-- {
--   "saghen/blink.cmp",
--   dependencies = {
--     "rafamadriz/friendly-snippets",
--   },
--   event = { "InsertEnter", "CmdlineEnter" },
--   opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
--   version = "*",
--   config = function()
--     require("blink.cmp").setup({
--       snippets = { preset = "luasnip" },
--       signature = { enabled = true },
--       appearance = {
--         use_nvim_cmp_as_default = false,
--         nerd_font_variant = "normal",
--       },
--       sources = {
--         default = { "lsp", "path", "snippets", "buffer" },
--         providers = {
--           cmdline = {
--             min_keyword_length = 2,
--           },
--         },
--       },
--       keymap = {
--         ["<C-f>"] = {},
--       },
--       cmdline = {
--         enabled = true,
--         completion = { menu = { auto_show = true } },
--         keymap = {
--           ["<CR>"] = { "accept_and_enter", "fallback" },
--         },
--       },
--       completion = {
--         menu = {
--           border = "none",
--           scrolloff = 1,
--           scrollbar = false,
--           draw = {
--             columns = {
--               { "kind_icon" },
--               { "label", "label_description", gap = 1 },
--               { "kind" },
--               { "source_name" },
--             },
--           },
--         },
--         documentation = {
--           window = {
--             border = "rounded",
--             scrollbar = false,
--           },
--           auto_show = true,
--           auto_show_delay_ms = 500,
--         },
--       },
--     })
--     require("luasnip.loaders.from_vscode").lazy_load()
--   end,
-- },
-- }
