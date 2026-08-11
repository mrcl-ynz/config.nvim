local M = {}

M.leader_key = vim.keycode("<Space>")

M.mappings = {
    {
        mode = "n",
        "<Leader>e",
        "<Cmd>Explore<CR>",
        desc = "Open file explorer",
    },

    { mode = "n", "<Esc>", "<Cmd>nohlsearch<CR>", desc = "Clear highlights" },

    {
        mode = "n",
        "<A-->",
        "<Cmd>new<CR>",
        desc = "New window in horizontal split",
    },
    {
        mode = "n",
        "<A-|>",
        "<Cmd>vnew<CR>",
        desc = "New window in vertical split",
    },

    { mode = "n", "<C-h>", "<C-w>h", desc = "Move focus to left window" },
    { mode = "n", "<C-j>", "<C-w>j", desc = "Move focus to lower window" },
    { mode = "n", "<C-k>", "<C-w>k", desc = "Move focus to upper window" },
    { mode = "n", "<C-l>", "<C-w>l", desc = "Move focus to right window" },

    {
        mode = "n",
        "<A-j>",
        "<Cmd>move .+1<CR>==",
        desc = "Move current line down",
    },
    {
        mode = "n",
        "<A-k>",
        "<Cmd>move .-2<CR>==",
        desc = "Move current line up",
    },

    {
        mode = "i",
        "<A-j>",
        "<Cmd>move .+1<CR><Esc>==gi",
        desc = "Move current line down",
    },
    {
        mode = "i",
        "<A-k>",
        "<Cmd>move .-2<CR><Esc>==gi",
        desc = "Move current line up",
    },

    {
        mode = "v",
        "<A-j>",
        ":move '>+1<CR>gv=gv",
        desc = "Move selection down",
    },
    { mode = "v", "<A-k>", ":move '<-2<CR>gv=gv", desc = "Move selection up" },

    {
        mode = "n",
        "j",
        function() return vim.v.count == 0 and "gj" or "j" end,
        expr = true,
    },
    {
        mode = "n",
        "k",
        function() return vim.v.count == 0 and "gk" or "k" end,
        expr = true,
    },

    {
        mode = "v",
        "j",
        function()
            return vim.fn.mode() == "v" and vim.v.count == 0 and "gj" or "j"
        end,
        expr = true,
    },
    {
        mode = "v",
        "k",
        function()
            return vim.fn.mode() == "v" and vim.v.count == 0 and "gk" or "k"
        end,
        expr = true,
    },

    { mode = "v", "<", "<gv", desc = "Shift selection left" },
    { mode = "v", ">", ">gv", desc = "Shift selection right" },
}

return M
