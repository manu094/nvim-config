local groups = {
    "Normal",
    "NonText",
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignInfo",
    "DiagnosticSignHint",
    "DiagnosticSignOk",
    "SignColumn",
    "FoldColumn",
    "Folded",
    "LineNr",
    "CursorLineNr",
    "QuickFixLine",
    "GitSignsAdd",
    "GitSignsChange",
    "GitSignsDelete",
    "BufferDefaultCurrentADDED",
    "BufferDefaultCurrentCHANGED",
    "BufferDefaultCurrentDELETED",
    "BufferDefaultCurrentERROR",
    "BufferDefaultCurrentHINT",
    "BufferDefaultCurrentIndex",
    "BufferDefaultCurrentINFO",
    "BufferDefaultCurrentMod",
    "BufferDefaultCurrentSign",
    "BufferDefaultCurrentTarget",
    "BufferDefaultCurrentWARN",
    "DevIconDefaultCurrent",
    "debugBreakpoint",
    "ZenBg",
    "NormalNC",
    "BufferCurrent",
}

for _, group in ipairs(groups) do
    local cmd1 = "highlight " .. group .. " guibg=none"
    local cmd2 = "highlight " .. group .. " ctermbg=none"
    vim.cmd(cmd1)
    vim.cmd(cmd2)
end
