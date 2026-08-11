return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",
            styles = {
                comments = { italic = true },
                keywords = { italic = false },
                functions = {},
                variables = {},
            },
        })

        vim.cmd.colorscheme("tokyonight")
    end,
}
