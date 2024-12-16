local function replace_at(harpoon, idx)
  local old = harpoon:list():get(idx)
  harpoon:list():replace_at(idx)
  harpoon:list():add(old)
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })
  end,
  keys = {
    {
      "<leader><leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Quick menu",
    },
    {
      "<leader><leader>H",
      function()
        -- ----------------------------------------------------------------

        local harpoon = require("harpoon")
        local snacks_picker = require("snacks.picker")

        return snacks_picker({
          finder = function()
            local items = {}
            local test = harpoon:list()

            print(vim.inspect(test.items))

            for i, item in ipairs(test.items) do
              table.insert(items, {
                idx = i,
                file = item.value,
                row = item.context.row,
                col = item.context.col,
              })
            end

            return items
          end,
          layout = {
            hidden = { "input" },
            layout = {
              box = "horizontal",
              width = 0.5,
              height = 0.5,
              {
                box = "vertical",
                border = "rounded",
                title = "Harpoon",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
            },
          },
          win = {
            list = {
              keys = {
                ["<S-j>"] = function()
                  replace_at(harpoon, 1)
                end,
                ["<S-k>"] = function()
                  replace_at(harpoon, 2)
                end,
                ["<S-l>"] = function()
                  replace_at(harpoon, 3)
                end,
                ["<S-ø>"] = function()
                  replace_at(harpoon, 4)
                end,

                ["<C-k>"] = function()
                  print("Move up")
                end,
                ["<C-j>"] = function()
                  print("Move down")
                end,

                ["<S-x>"] = function(test1)
                  print("Clear item")
                  -- TODO: Remove item
                  -- harpoon:list():remove_at()
                end,
                ["<C-x>"] = function(test1)
                  print("Clear list")
                  harpoon:list():clear()
                  -- TODO: Reload picker
                end,
              },
            },
          },
          format = function(item, _)
            -- local file = item.file
            local ret = {}
            local a = snacks_picker.util.align
            local icon = "?" -- Snacks.util.icon(file.ft, "file")
            if item.idx == 1 then
              icon = "󰰇"
            elseif item.idx == 2 then
              icon = "󰰊"
            elseif item.idx == 3 then
              icon = "󰰍"
            end
            ret[#ret + 1] = { a(icon, 3) }
            ret[#ret + 1] = { " " }
            ret[#ret + 1] = { a(item.file, 50) }
            ret[#ret + 1] = { a(string.format("(%d:%d)", item.row, item.col), 10, { align = "right" }) }

            return ret
          end,
          confirm = function(picker, item)
            picker:close()
            harpoon:list():select(item.idx)
          end,
          focus = "list",
        })

        -- ----------------------------------------------------------------
      end,
      desc = "Harpoon: Quick menu (Snacks)",
    },
    {
      "<leader><leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add file",
    },
    {
      "<leader><leader>j",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon: Go to J (file 1)",
    },
    {
      "<leader><leader>J",
      function()
        require("harpoon"):list():replace_at(1)
      end,
      desc = "Harpoon: Set J (file 1)",
    },
    {
      "<leader><leader>k",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon: Go to K (file 2)",
    },
    {
      "<leader><leader>K",
      function()
        require("harpoon"):list():replace_at(2)
      end,
      desc = "Harpoon: Set K (file 1)",
    },
    {
      "<leader><leader>l",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon: Go to L (file 3)",
    },
    {
      "<leader><leader>L",
      function()
        require("harpoon"):list():replace_at(3)
      end,
      desc = "Harpoon: Set L (file 1)",
    },
    {
      "<leader><leader>ø",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon: Go to Ø (file 4)",
    },
    {
      "<leader><leader>Ø",
      function()
        require("harpoon"):list():replace_at(4)
      end,
      desc = "Harpoon: Set Ø (file 1)",
    },
    {
      "<leader><leader>x",
      function()
        require("harpoon"):list():clear()
      end,
      desc = "Harpoon: Clear",
    },
  },
}
