local config = {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "gitcommit",
        "diff",
    },

    auto_install = true,
}

config.highlight = {
    enable = true,

    disable = function(_, buf)
        local max_filesize = 100 * 1024
        local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
        if stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
}

config.refactor = {
    highlight_definitions = {
        enable = true,
        clear_on_cursor_move = false,
    }
}

config.textobjects = {
    select = {
        enable = true,

        lookahead = true,

        keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["if"] = { query = "@function.inner", desc = "Select inside function" },
            ["ac"] = { query = "@class.outer", desc = "Select around class" },
            ["ic"] = { query = "@class.inner", desc = "Select inside class" },
        },
        include_surrounding_whitespace = true,
    },

    move = {
        enable = true,
        set_jumps = true,
        goto_next= {
            ["]m"] = { query = "@function.outer", desc = "Go to next function" },
            ["]]"] = { query = "@class.outer", desc = "Go to next class" },
        },
        goto_previous = {
            ["[m"] = { query = "@function.outer", desc = "Go to previous function" },
            ["[["] = { query = "@class.outer", desc = "Go to previous class" },
        },
    }
}

require("nvim-treesitter.configs").setup(config)
