local nnoremap = require("mx.keymap").nnoremap
local inoremap = require("mx.keymap").inoremap

local capabilities = require("mx.lsp.capabilities")

local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
    nvim_status = nil
end

local status = require "mx.lsp.status"
if status then
    status.activate()
end

local M = {}

function M.config(_config)
    return vim.tbl_deep_extend("force", {
        --capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        --capabilities = vim.lsp.protocol.make_client_capabilities(),
        capabilities = capabilities,
        on_attach = function(client)
            if nvim_status then
                nvim_status.on_attach(client)
            end

            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
        end,
    }, _config or {})
end

return M
