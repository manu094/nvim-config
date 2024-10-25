local options = {
    WindowLayout = 3, -- Tree shows up as a window on the right side
    ShortIndicators = 1, -- Shortens timestamps
    SplitWidth = 35, -- Window size
    DiffpanelHeight = 15, -- Diff panel height
    SetFocusWhenToggle = 1, -- Focuses undo tree when opened
    TreeNodeShape = "*",
    TreeVertShape = '|',
    TreeSplitShape = '/',
    TreeReturnShape = '\\',
    RelativeTimestamp = 0, -- Set relative timestamps
    HighlightChangedText = 1, -- Highlight changed text

}

for k, v in pairs(options) do
  vim.g["undotree_" .. k] = v
end

-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- function vim.g.Undotree_CustomMap()
--     keymap( "n", "J", "<plug>UndotreeNextState", opts)
--     keymap( "n", "K", "<plug>UndotreePreviousState", opts)
-- end
