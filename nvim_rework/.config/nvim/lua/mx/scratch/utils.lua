local M = {}

M.cwd = function()
  return vim.loop.cwd()
end

return M
