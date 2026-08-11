local M = {}

M.resolve_spec = function(original_spec)
    local gh = function(repo) return ("https://github.com/%s.git"):format(repo) end

    if type(original_spec) == "table" then
        return {
            src = gh(original_spec[1]),
            version = original_spec.branch
                or (
                    original_spec.version
                    and vim.version.range(original_spec.version)
                ),
            data = vim.iter({
                "dependencies",
                "build",
                "config",
                "event",
                "ft",
            }):fold({}, function(acc, field)
                acc[field] = original_spec[field]

                return acc
            end),
        }
    elseif type(original_spec) == "string" then
        return { src = gh(original_spec) }
    else
        error("Expected table or string, got ", type(original_spec))
    end
end

M.load_from_table = function(specs_table)
    return vim.iter(specs_table):fold({}, function(acc, spec)
        local insert = function(x) table.insert(acc, M.resolve_spec(x)) end

        if vim.islist(spec) then
            vim.iter(spec):each(insert)
        else
            insert(spec)
        end

        return acc
    end)
end

M.load_from_mod = function(plugin_mod)
    local plugin_dir = ("%s/lua/%s"):format(
        vim.fn.stdpath("config"),
        plugin_mod:gsub("%.", "/")
    )

    if not vim.uv.fs_stat(plugin_dir) then
        error(("Module %s not found"):format(plugin_mod))
    end

    local specs_table = vim.iter(vim.fs.dir(plugin_dir))
        :filter(function(_, type) return type == "file" end)
        :map(
            function(name)
                return require(
                    ("%s.%s"):format(plugin_mod, name:match("(.*)%.lua"))
                )
            end
        )
        :totable()

    return M.load_from_table(specs_table)
end

M.load_specs = function(specs_arg)
    local specs = nil
    if type(specs_arg) == "string" then
        specs = M.load_from_mod(specs_arg)
    elseif type(specs_arg) == "table" then
        specs = M.load_from_table(specs_arg)
    else
        error("Invalid argument: expected string or table, got " .. type(arg))
    end

    if #specs == 0 then error("No plugin specs found!") end

    return specs
end

return M
