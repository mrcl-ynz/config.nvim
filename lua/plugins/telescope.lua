local keymaps = {
    { "<Leader>ff", "find_files", desc = "Telescope: find files" },
    { "<Leader>fg", "live_grep", desc = "Telescope: live grep" },
    { "<Leader>fh", "help_tags", desc = "Telescope: help tags" },
}

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local builtin = require('telescope.builtin')

        vim.iter(keymaps):each(function (x)
            vim.keymap.set("n",x[1], builtin[x[2]], { desc = x.desc })
        end)
    end
}
