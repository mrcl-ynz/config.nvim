local keymaps = {
    { "<Leader>q", "setqflist", desc = "Show diagnostics in quick fix list" },
    { "<Leader>d", "open_float", desc = "Open diagnostic in floating window" },
    { "]d", "goto_next", desc = "Go to next diagnostic" },
    { "[d", "goto_prev", desc = "Go to previous diagnostic" },
}

vim.diagnostic.config({
    float = { source = true },
    severity_sort = true,
})

vim.iter(keymaps):each(function(x)
    vim.keymap.set("n", x[1], vim.diagnostic[x[2]], { desc = x.desc })
end)

vim.lsp.inlay_hint.enable()

vim.keymap.set("n", "<Leader>tt", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
