local utils = require "mx.scratch.utils"

-- A global test function
F = function()

  -- sleep
  local timer = vim.loop.new_timer()
  timer:start(1000, 0, function()
    print("test")
  end)


end
