local M = {}

M.cwd = function()
  return vim.loop.cwd()
end

-- Fibonacci with tables
M.fib_t = function(n)

  local T = {}
  T[1], T[2] = 0, 1
  for i=1,n-1 do
    T[i+1] = T[i+1] + T[i]
    T[i+2] = T[i]
  end

  T[#T] = T[#T] + T[#T-1]
  return T[#T]
end

return M
