local formatters_by_ft = {
    lua = { "stylua" },
}

return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim", opts = {} },
    init = function()
        local registry = require("mason-registry")

        registry.update(function()
            vim.iter(vim.tbl_values(formatters_by_ft))
                :flatten()
                :each(function(x)
                    if registry.has_package(x) then
                        registry.get_package(x):install()
                    end
                end)
        end)
    end,
    opts = {
        formatters_by_ft = formatters_by_ft,
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
