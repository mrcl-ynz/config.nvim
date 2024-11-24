return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
    },
    init = function()
        require("plugins.lsp.start")
    end,
    config = function()
        require("plugins.lsp.config")
    end,
}
