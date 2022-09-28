local previewers = require("telescope.previewers")

local no_preview = function(title)
  return require('telescope.themes').get_dropdown({
    results_title = false,
    prompt_title  = title,
    preview_title = false,
    layout_config = {
      width  = 0.8,
      height = 0.8,
      prompt_position = "top",
    },

    previewer = false,

    borderchars = {
      prompt  = {"─", "│", " ", "│", "╭", "╮", "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
      preview = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    },
  })
end

require("telescope").setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    file_sorter = require("telescope.sorters").get_fzy_sorter,
    layout_strategy  = "horizontal",
    scroll_strategy  = "cycle",
    sorting_strategy = "ascending",

    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-h>"] = "which_key",
      }
    },

    file_previewer   = previewers.vim_buffer_cat.new,
    grep_previewer   = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },

  pickers = {
    find_files = no_preview(false),
    git_files  = no_preview('Git Files'),
  },
})

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Dots >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

return M
