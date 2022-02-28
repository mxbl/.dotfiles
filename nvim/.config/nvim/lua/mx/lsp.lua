local imap = require("mx.keymap").imap
local nmap = require("mx.keymap").nmap

local sumneko_root_path = "/home/mx/git/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local has_lsp, lspconfig = pcall(require, 'lspconfig')
if not has_lsp then
  return
end

local nvim_status = require 'lsp-status'

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0
  nmap(opts)
end

local buf_inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0
  imap(opts)
end

local custom_attach = function(client)
  --local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  nvim_status.on_attach(client)

  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "<leader>rr", "LspRestart" } -- what?

  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help } -- is it working?
end

-- Load lua configuration from nlua
_ = require('nlua.lsp.nvim').setup(lspconfig, {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = custom_attach,

  globals = {
    -- Colorbuddy
    "Color",
    "colors",
    "Group",
    "groups",
    "styles",

    -- Custom
    "RELOAD",
    "P",
    "R",
  },
})

--local sumneko_root_path = "home/mx/git/lua-language-server"
--local sumneko_binary = sumneko_root_path .. "bin/lua-language-server"

--require'lspconfig'.sumneko_lua.setup {
--  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using
--        version = 'LuaJIT',
--        -- Setup your lua path
--        path = vim.split(package.path, ';'),
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = { 'vim' },
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = {
--          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--        },
--      },
--    },
--  },
--}
