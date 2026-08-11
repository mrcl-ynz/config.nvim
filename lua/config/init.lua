local options = require("config.options")
local keymap_config = require("config.keymaps")

vim.iter(options):each(function(name, value) vim.opt[name] = value end)

vim.g.mapleader = keymap_config.leader_key
vim.g.maplocalleader = keymap_config.leader_key

vim.iter(keymap_config.mappings):each(
    function(mapping)
        vim.keymap.set(mapping.mode, mapping[1], mapping[2], {
            desc = mapping.desc,
            expr = mapping.expr,
        })
    end
)

require("config.pack"):setup("custom.plugins")
