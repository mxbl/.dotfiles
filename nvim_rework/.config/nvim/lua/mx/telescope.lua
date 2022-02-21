local action_layout = require "telescope.actions.layout"

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
      prompt  = {"─", "│", " ", "│", "┌", "┐", "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    },
  })
end

require("telescope").setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 0,

    file_sorter = require("telescope.sorters").get_fzy_sorter,
    layout_strategy  = "horizontal",
    scroll_strategy  = "cycle",
    sorting_strategy = "ascending",

    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-h>"] = "which_key",
      }
    },

    file_previewer   = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer   = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },

  pickers = {
    find_files = no_preview(false),
    git_files  = no_preview('Git Files'),
  },

  extensions = {
    file_browser = no_preview('File Browser'),
  },

  ["ui-select"] = {
    require("telescope.themes").get_dropdown {
    }
  },
})

_ = require("telescope").load_extension "file_browser"
_ = require("telescope").load_extension "ui-select"
_ = require("telescope").load_extension "notify"

-- Mappings

vim.api.nvim_set_keymap(
  "n", "<space>fe", ":Telescope file_browser<cr>", { noremap = true })

-- TODO: figure that out!
--function find_in_packer()
--  require("telescope.builtin").find_files {
--    cwd = "~/.local/share/nvim/site/pack/packer/start/",
--  }
--end
--
--vim.api.nvim_set_keymap(
--  "n", "<space>pp", ":Telescope file_browser<cr>", { noremap = true })

-- works but is in plugin/telescope.vim for now
--vim.api.nvim_set_keymap(
--"n", "<space>pg", ":lua require('telescope.builtin').git_files()<cr>", { noremap = true })
