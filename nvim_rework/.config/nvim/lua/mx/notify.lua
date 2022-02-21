local async  = require("plenary.async")
local notify = require("notify").async

local M = {}

M.info = function(message, title)
  async.run(function()
    notify(message, 'info', {
      title = title or "notify",
    })
  end)
end

return M
