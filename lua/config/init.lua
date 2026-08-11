local options = require("config.options")

vim.iter(options):each(function(name, value) vim.opt[name] = value end)
