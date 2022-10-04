require("treesitter-context").setup({
    enable = true,
    throttle = true,
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = true,
    patterns = {
        default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
        },

        rust = {
            "loop_expression",
            "impl_item",
        },

        typescript = {
            "class_declaration",
            "abstract_class_declaration",
            "else_clause",
        },
    },
})
