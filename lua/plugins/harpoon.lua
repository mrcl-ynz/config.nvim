return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local harpoon = require("harpoon")
        local list = harpoon:list()

        local keymaps = {
            { "<Leader>ma", function() list:add() end, desc = "Add file to list" },
            { "<Leader>mr", function() list:remove() end, desc = "Remove file from list" },
            { "<Leader>mq", function() harpoon.ui:toggle_quick_menu(list) end, desc = "Toggle quick menu" },

            { "<A-p>", function() list:prev() end, desc = "Go to previous file in list" },
            { "<A-n>", function() list:next() end, desc = "Go to next file in list" },
        }

        vim.iter({1, 2, 3, 4}):each(function (x)
            table.insert(keymaps, { "<Leader>m" .. x, function() list:select(x) end, desc = "Select file #" .. x })
        end)

        harpoon:setup()

        vim.iter(keymaps):each(function(x)
            vim.keymap.set("n", x[1], x[2], { desc = "Harpoon: " .. x.desc })
        end)
    end
}
