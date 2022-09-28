local lspconfig = require("lspconfig")
local inlay = require("mx.lsp.rust.inlay_hints")
local capabilities = require("mx.lsp.capabilities")

local config = require("mx.lsp.config").config

require "mx.lsp.rust.formating"

local M = {}

local server_options = {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}

local hints = inlay.new()
M.inlay_hints = {
    enable = function()
        inlay.enable(hints)
    end,
    disable = function()
        inlay.disable(hints)
    end,
    cache = function()
        inlay.cache_render(hints)
    end,
}

local function setup_capabilities(opts, capabilities)
    local capabilities = capabilities or vim.lsp.protocol.make_client_capabilities()

    -- snippets
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- send actions with hover request
    capabilities.experimental = {
        hoverActions = true,
        hoverRange = true,
        serverStatusNotification = true,
        snippetTextEdit = true,
        codeActionGroup = true,
        ssr = true,
    }

    -- enable auto import
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
    }

    -- rust analyzer goodies
    capabilities.experimental.commands = {
        commands = {
            "rust-analyzer.runSingle",
            "rust-analyzer.debugSingle",
            "rust-analyzer.showReferences",
            "rust-analyzer.gotoLocation",
            "rust-analyzer.rustfmt.rangeFormatting",
            "editor.action.triggerParameterHints",
        },
    }

    opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts or {})
end

local function setup_lsp(opts)
    lspconfig.rust_analyzer.setup(config(opts))
end

function M.setup()
    setup_capabilities(server_options, capabilities)
    setup_lsp(server_options)
end

return M
