local action_layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    previewer = false,
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      prompt_position = "bottom",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-h>"] = "which_key",
      }
    },

    --file_previewer   = require("telescope.previewers").vim_buffer_cat.new,
    --grep_previewer   = require("telescope.previewers").vim_buffer_vimgrep.new,
    --qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },
})

--vim.api.nvim_set_keymap("n", "<space>vb", ":Telescope file_browser<cr>", { noremap = true })
