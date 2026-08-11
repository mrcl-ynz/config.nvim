local M = {}

M.load = function(spec)
    if spec.data.dependencies then
        vim.iter(spec.data.dependencies)
            :map(function(dep) return (dep:match(".*/(.*)(.git)*")) end)
            :each(vim.cmd.packadd)
    end

    vim.cmd.packadd(spec.name)

    if spec.data.config then spec.data.config() end
end

M.lazy_load = function(spec, event, pattern)
    vim.api.nvim_create_autocmd(event, {
        pattern = pattern,
        callback = function() M.load(spec) end,
    })
end

M.cleanup_inactive = function()
    local inactive_plugins = vim.iter(vim.pack.get())
        :filter(function(plugin) return not plugin.active end)
        :map(function(plugin) return plugin.spec.name end)
        :totable()

    if #inactive_plugins > 0 then vim.pack.del(inactive_plugins) end
end

return M
