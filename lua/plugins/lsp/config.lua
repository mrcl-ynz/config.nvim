local servers = {
    lua_ls = {},
}

local keymaps = {
    { "<Leader>ca", "code_action", desc = "Code actions", mode = { "n", "v" } },
    { "<Leader>rn", "rename", desc = "Rename symbol" },
    { "K", "hover", desc = "Show hover documentation" },
    { "gd", "definition", desc = "Go to definition" },
    { "gI", "implementation", desc = "Go to implementation" },
    { "gR", "references", desc = "Show references" },
}

local on_attach = function(_, bufnr)
    vim.iter(keymaps):each(function(x)
        vim.keymap.set(x.mode or "n", x[1], vim.lsp.buf[x[2]], {
            desc = "LSP: " .. x.desc,
            buffer = bufnr,
        })
    end)
end

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok and cmp_lsp.default_capabilities() or {}

require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({
                settings = servers[server_name],
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    }
})
