local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
    nvim_status = nil
end

local status = require "mx.lsp.status"
if status then
    status.activate()
end

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
if nvim_status then
    client_capabilities = vim.tbl_deep_extend("keep", client_capabilities, nvim_status.capabilities)
end

client_capabilities.textDocument.completion.completionItem.snippetSupport = true

return client_capabilities
