local utils = require "mx.scratch.utils"

local popup = require "plenary.popup"

local a = vim.api

local M = {}

M.which_key_like_func = function(opts)
  opts = opts or {}
  opts.max_height     = utils.get_default(opts.max_height, 0.4)
  opts.separator      = utils.get_default(opts.separator, " -> ")
  opts.column_padding = utils.get_default(opts.column_padding, "  ")
  opts.line_padding   = utils.get_default(opts.line_padding, 1)

  -- necessary ?
  opts.mode_width     = utils.get_default(opts.mode_width, 1)
  opts.name_width     = utils.get_default(opts.name_width, 30)
  opts.keybind_width  = utils.get_default(opts.keybind_width, 7)

  -- Assigning into 'opts.column_indent' would override a number with a string and
  -- cause issues with subsequent calls, keep a local copy of the string instead
  --local column_indent =
  --  table.concat(utils.repeated_table(utils.get_default(opts.column_indent, 4), " "))

  -- Close on repeated keypress
  local km_bufs = (function()
    local ret = {}
    local bufs = a.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
      if string.find(a.nvim_buf_get_name(buf), "_MxPopup") then
        table.insert(ret, buf)
      end
    end
    return ret
  end)()
  if not vim.tbl_isempty(km_bufs) then
    for _, buf in ipairs(km_bufs) do
      utils.buf_delete(buf)
      local win_ids = vim.fn.win_findbuf(buf)
      for _, win_id in ipairs(win_ids) do
        pcall(vim.api.nvim_win_close, win_id, true)
      end
    end
    return
  end


  local mappings = {}
  local mode     = a.nvim_get_mode().mode

  opts.num_rows = math.floor(vim.o.lines * opts.max_height + 1)

  local popup_opts = {
    relative    = "editor",
    enter       = true,
    minwidth    = vim.o.columns,
    maxwidth    = vim.o.columns,
    minheight   = opts.num_rows,
    maxheight   = opts.num_rows,
    line        = vim.o.lines - opts.num_rows + 1,
    col         = 0,
    border      = { 1, 0, 0, 0},
    borderchars = { "─", "", " ", "", "", "", "", "" },
    noautocmd   = true,
    title       = { { text = "My Popup Test", pos = "N" } },
  }
  local km_win_id, km_opts = popup.create("", popup_opts)
  local km_buf = a.nvim_win_get_buf(km_win_id)

  a.nvim_buf_set_name(km_buf, "_MxPopup")
  a.nvim_win_set_option(km_win_id, "foldenable", false)

  vim.cmd(string.format(
    "autocmd BufLeave <buffer> ++once lua %s",
    table.concat({
      string.format("pcall(vim.api.nvim_win_close, %s, true)", km_win_id),
      string.format("pcall(vim.api.nvim_win_close, %s, true)", km_opts.border.win_id),
      string.format("require 'telescope.utils'.buf_delete(%s)", km_buf),
    }, ";")
  ))


  -- Set buffer content
  a.nvim_buf_set_lines(km_buf, 0, -1, false, utils.repeated_table(opts.num_rows + 2 * opts.line_padding, " "))
  -- TODO: for loop over lines of content and call buf set lines
  --       local row = utils.cycle(index, opts.num_rows) - 1 + opts.line_padding
  --       a.nvim_buf_set_lines(km_buf, row, row+1, false, { new_line })
end

return M
