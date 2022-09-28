require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"
local snip = ls.snippet
--local snippet_from_nodes = ls.sn
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
--local d = ls.dynamic_node
--local c = ls.choice_node
--local fmta = require("luasnip.extras.fmt").fmta
--local fmt = require("luasnip.extras.fmt").fmt
--local rep = require("luasnip.extras").rep
--
--ts_locals = require "nvim-treesitter.locals"
--ts_utils = require "nvim-treesitter.ts_utils"
--
--local get_node_text = vim.treesitter.get_node_text
--
--local function_node_types = {
--  function_declaration = true,
--  method_declaration = true,
--  func_literal = true,
--}

ls.add_snippets("go", {
    s("efi", {
        t({"if err != nil {", "   "}),
        i(0, ""),
        t({"", "}"}),
    })
})
