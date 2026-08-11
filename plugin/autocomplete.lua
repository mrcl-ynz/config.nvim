vim.opt.autocomplete = true
vim.opt.completeopt = { "popup", "noselect", "noinsert" }

vim.keymap.set(
    "i",
    "<Tab>",
    function() return vim.fn.pumvisible() ~= 0 and "<C-N>" or "<Tab>" end,
    { expr = true }
)
vim.keymap.set(
    "i",
    "<S-Tab>",
    function() return vim.fn.pumvisible() ~= 0 and "<C-P>" or "<S-Tab>" end,
    { expr = true }
)
