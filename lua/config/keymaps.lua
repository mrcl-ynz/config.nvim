return {
    n = {
        { "<Leader>e", "<Cmd>Ex<CR>", desc = "Open file explorer" },

        { "<Esc>", "<Cmd>nohlsearch<CR>", desc = "Clear search highlights" },

        {
            "j",
            function() return vim.v.count == 0 and "gj" or "j" end,
            expr = true
        },
        {
            "k",
            function() return vim.v.count == 0 and "gk" or "k" end,
            expr = true
        },

        { "<Leader>x", function() vim.cmd("so") end, desc = "Source current file" },
    },
    v = {
        { "J", ":move '>+1<CR>gv=gv", desc = "Move selection down" },
        { "K", ":move '<-2<CR>gv=gv", desc = "Move selection up" },

        { "<", "<gv", desc = "Shift selection left" },
        { ">", ">gv", desc = "Shift selection right" },
    },
    i = {
        { "<A-j>", "<Cmd>move .+1<CR><Esc>==gi", desc = "Move line down" },
        { "<A-k>", "<Cmd>move .-2<CR><Esc>==gi", desc = "Move line up" },
    },
}
