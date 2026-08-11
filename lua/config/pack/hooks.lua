local loader = require("config.pack.loader")
local specs = require("config.pack.specs")

local M = {}

M.build = function(ev)
    local kind, spec = ev.data.kind, ev.data.spec
    if not (kind ~= "delete" and spec.data and spec.data.build) then return end

    if type(spec.data.build) == "function" then
        if not ev.data.active then vim.cmd.packadd(spec.name) end

        spec.data.build()
    else
        local out = vim.system(
            vim.iter(spec.data.build:gmatch("%a+")):totable(),
            { cwd = ev.data.path }
        ):wait()

        if out.code == 0 then return end

        local stderr, stdout = (out.stderr or ""), (out.stdout or "")
        local err_msg = stderr ~= "" and stderr
            or stdout ~= "" and stdout
            or "No output from build command"

        vim.notify(
            ("Error building %s:\n%s."):format(spec.name, err_msg),
            vim.log.levels.ERROR
        )
    end
end

M.load = function(data)
    local spec = data.spec

    if spec.data.dependencies then
        vim.pack.add(
            vim.iter(spec.data.dependencies):map(specs.resolve_spec):totable(),
            {
                confirm = false,
                load = false,
            }
        )
    end

    if spec.data.event then
        loader.lazy_load(spec, spec.data.event)
    elseif spec.data.ft then
        loader.lazy_load(spec, "FileType", spec.data.ft)
    else
        loader.load(spec)
    end
end

return M
