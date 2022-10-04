
local snippet_collection = require("luasnip.session.snippet_collection")
snippet_collection.clear_snippets "go"
snippet_collection.clear_snippets "rust"

local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local snip = ls.snippet
--local snippet_from_nodes = ls.sn
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node

--local nnoremap = require("mx.keymap").nnoremap
--local inoremap = require("mx.keymap").inoremap

--local d = ls.dynamic_node
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

ls.add_snippets("rust", {
    s("tmain", fmt(
        [[
#[tokio::main]
async fn main() -> anyhow::Result<()> {{
    Ok(())
}}]], {})
    ),

    s("struct", {
        t { "#[derive(Debug, PartialEq)]", "struct " },
        i(1, "Name"),
        t { " {", "    " },
        i(0),
        t { "", "}" },
    }),

    s(
        { trig = "test" },
        fmt(
        [[
        #[test]
        fn {}(){}{{
            {}
        }}
        ]], {
                i(1, "testname"),
                c(2, { t "", t " -> Result<()> ", }),
                i(0),
            })
    ),

    s("modtest",
      fmt(
      [[
      #[cfg(test)]
      mod test {{
          use super::*;

          {}
      }}
      ]], i(0)
      )
    ),
})
