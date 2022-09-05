--local utils = require "mx.scratch.utils"

-- A global test function
F_TIMER = function()

  -- sleep
  local timer = vim.loop.new_timer()
  timer:start(1000, 0, function()
    print("test")
  end)
end

F_TEST = function()
  local a = vim.api
  local km_bufs = (function()
    local ret = {}
    local bufs = a.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
      local bufname = a.nvim_buf_get_name(buf)
      table.insert(ret, bufname)
    end
    return ret
  end)()
  return km_bufs
end
