--local api = vim.api

local M = {}

-- Buffer for received messages
M.recv_buffer = {}

local create_server = function(host, port, func)
  local server = vim.loop.new_tcp()
  server:bind(host, port)
  server:listen(128, function(err)
    assert(not err, err)
    local sock = vim.loop.new_tcp()
    server:accept(sock)

    func(M.recv_buffer, sock)
  end)

  return server
end

local connection_callback = function(buf, sock)
  sock:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      table.insert(buf, chunk)
    else
      sock:close()
    end
  end)
end

-- Work the view
--echo_server.view = {}
--local view = echo_server.view
--
--view.open_window = function()
--  view.buf = api.nvim_create_buf(false, true)
--  api.nvim_buf_set_options(buf, 'bufhidden', 'wipe')
--
--  -- do i need this window obj?
--  api.nvim_open_win(buf, true)
--end


-- Start Server
M.server = create_server('0.0.0.0', 0, connection_callback)

print('TCP echo-server listening on port: '..M.server:getsockname().port)

Server = M.server

return M
