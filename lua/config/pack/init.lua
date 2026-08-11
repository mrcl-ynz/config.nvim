local specs = require("config.pack.specs")
local loader = require("config.pack.loader")
local hooks = require("config.pack.hooks")

local M = {}

M.setup = function(self, specs_arg)
    self.specs = specs.load_specs(specs_arg)

    vim.api.nvim_create_autocmd({ "PackChanged" }, { callback = hooks.build })

    vim.pack.add(self.specs, { confirm = false, load = hooks.load })

    loader.cleanup_inactive()
end

return M
