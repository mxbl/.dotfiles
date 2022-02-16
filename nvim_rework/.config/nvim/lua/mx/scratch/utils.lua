local M = {}

M.cwd = function()
  return vim.loop.cwd()
end

M.if_nil = function(x, was_nil, was_not_nil)
  if x == nil then
    return was_nil
  else
    return was_not_nil
  end
end

M.cycle = function(i, n)
  return i % n == 0 and n or i % n
end

M.get_default = function(x, default)
  return M.if_nil(x, default, x)
end

M.repeated_table = function(n, val)
  local empty_lines = {}
  for _ = 1, n do
    table.insert(empty_lines, val)
  end
  return empty_lines
end

M.buf_delete = function(bufnr)
  if bufnr == nil then
    return
  end

  local start_report = vim.o.report
  if start_report < 2 then
    vim.o.report = 2
  end

  if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end

  if start_report < 2 then
    vim.o.report = start_report
  end
end

-- Some algorithms {{{
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
-- }}}

return M
