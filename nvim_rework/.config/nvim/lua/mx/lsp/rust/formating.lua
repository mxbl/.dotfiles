
-- request: "textDocument/rangeFormatting"

vim.cmd([[
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
]])

local M = {}

-- FIXME:
function M.range_formatting()
    local st = vim.api.nvim_buf_get_mark(0, '[')
    local fi = vim.api.nvim_buf_get_mark(0, ']')
    vim.lsp.buf.range_formatting({}, st, fi)
end

return M
