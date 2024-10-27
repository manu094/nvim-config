local options = {
    backup = false,                        -- creates a backup file
    clipboard = "unnamedplus",             -- allows neovim to access the system clipboard
    cmdheight = 1,                         -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                      -- so that `` is visible in markdown files
    fileencoding = "utf-8",                -- the encoding written to a file
    hlsearch = true,                       -- highlight all matches on previous search pattern
    ignorecase = true,                     -- ignore case in search patterns
    mouse = "",                            -- allow the mouse to be used in neovim
    pumheight = 10,                        -- pop up menu height
    showmode = false,                      -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0,                       -- always show tabs
    smartcase = true,                      -- smart case
    smartindent = true,                    -- make indenting smarter again
    cindent = true,
    splitbelow = true,                     -- force all horizontal splits to go below current window
    splitright = true,                     -- force all vertical splits to go to the right of current window
    swapfile = false,                      -- creates a swapfile
    termguicolors = true,                  -- set term gui colors (most terminals support this)
    timeoutlen = 500,                      -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true,
    undofile = true,                       -- enable persistent undo
    updatetime = 300,                      -- faster completion (4000ms default)
    writebackup = false,                   -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                      -- convert tabs to spaces
    shiftwidth = 4,                        -- the number of spaces inserted for each indentation
    tabstop = 4,                           -- insert 4 spaces for a tab
    softtabstop = 4,
    list = true,
    listchars = "tab:  ,trail:‧,nbsp:+",
    cursorline = true,       -- highlight the current line
    number = true,           -- set numbered lines
    relativenumber = true,   -- set relative numbered lines
    numberwidth = 4,         -- set number column width to 2 {default 4}
    signcolumn = "yes",      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,             -- DON'T display lines as one long line
    linebreak = true,
    scrolloff = 10,          -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    laststatus = 0,
    --foldmethod = "indent",                 -- better setting exists as part of the UFO plugin
    foldcolumn = "1",
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,
    timeout = true,
    autowrite = true,
    makeprg = "gcc % -o %< -g", -- command executed upon :make
    equalalways = false,      -- Don't resize remaining windows when one is closed
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
