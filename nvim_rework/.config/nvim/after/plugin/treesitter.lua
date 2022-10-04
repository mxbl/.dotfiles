require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
            },
        },
    },

    playground = {
        enable = true,
    },

    query_linter = {
        enable = true,
    },
}

local read_query = function(filename)
    return table.concat(vim.fn.readfile(vim.fn.expand(filename)), "\n")
end

-- vim.treesitter.set_query("rust", "highlight", read_query "~/.config/nvim/queries/rust/highlights.scm")

vim.cmd [[highlight IncludeC guibg=#373b41]]
vim.cmd [[nnoremap <space>tp :TSPlaygroundToggle<CR>]]
vim.cmd [[nnoremap <space>th :TSHighlightCapturesUnderCursor<CR>]]
