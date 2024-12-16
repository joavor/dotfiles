return {
  "mbbill/undotree",
  opts = {},
  config = function()
    vim.cmd("let g:undotree_WindowLayout = 4")
    vim.cmd("let g:undotree_DiffpanelHeight = 20")
    vim.cmd("let g:undotree_SplitWidth = 40")
    vim.cmd("let g:undotree_HelpLine = 0")
    vim.cmd("let g:undotree_SetFocusWhenToggle = 1")
    vim.cmd('let g:undotree_TreeVertShape = "|"')
    vim.cmd('let g:undotree_TreeNodeShape = "×"')
    vim.cmd('let g:undotree_TreeSplitShape = "/"')
    vim.cmd('let g:undotree_TreeReturnShape = ""')
  end,
}
