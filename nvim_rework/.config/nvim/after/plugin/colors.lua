function colors()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true

    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true

    vim.cmd("colorscheme tokyonight")

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", { bg = "none", })
    hl("LineNr", { fg = "#5eacd3", })
    hl("Comment", { fg = "#5eacd3", })
    hl("NonText", { fg = "#3a3a3a", })
    hl("Whitespace", { fg = "#3a3a3a", })
    hl("Vertsplit", { fg = "#3a3a3a", })
    hl("Normal", { bg = "None", })
    hl("NormalNC", { bg = "None", })

    -- Telescope
    hl("TelescopeNormal", { bg = "None", })
    hl("TelescopeBorder", { fg = "#5eacd3", bg = "None", })
    hl("TelescopeTitle", { fg = "#5eacd3", })
end

colors()
