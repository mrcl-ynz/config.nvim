local linters_by_ft = {
    lua = { "luacheck" },
}

return {
    "mfussenegger/nvim-lint",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        {"rshkarin/mason-nvim-lint", opts = {} },
    },
    config = function ()
        local lint = require("lint")

        lint.linters_by_ft = linters_by_ft

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function () require("lint").try_lint() end,
        })
    end
}
