return {
    -- moving around, searching and patterns
    ignorecase = true,
    smartcase = true,

    -- displaying text
    scrolloff = 8,
    linebreak = true,
    breakindent = true,
    fillchars = { eob = " " },
    number = true,
    relativenumber = true,

    -- syntax, highlighting and spelling
    termguicolors = true,
    cursorline = true,
    colorcolumn = { 80 },

    -- multiple windows
    laststatus = 3,
    winborder = "rounded",
    winblend = 15,
    splitbelow = true,
    splitright = true,

    -- messages and info
    shortmess = "aoOstTIcCF",

    -- selecting text
    clipboard = "unnamed",

    -- editing text
    undofile = true,
    pumheight = 10,
    pumblend = 15,
    pumborder = "rounded",

    -- tabs and indenting
    shiftround = true,
    expandtab = true,
    smartindent = true,

    -- mapping
    timeoutlen = 250,

    -- the swap file
    updatetime = 50,

    -- various
    signcolumn = "yes",
    inccommand = "split",
}
