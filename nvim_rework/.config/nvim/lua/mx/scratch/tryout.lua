local log = require("plenary.log")
local job = require("plenary.job")

local lsp_base = require("nlua.lsp.nvim").base_directory

local info = require("mx.notify").info

--local async = require("plenary.async")
--local notify = require("notify").async

local function run_cmd(input)
  local args = {}
  for _, v in ipairs(input) do
    table.insert(args, v)
  end

  local command = table.remove(args, 1)

  job:new {
    command   = command,
    args      = args,
    cwd       = input.cwd,
    on_stdout = vim.schedule_wrap(function(_, data)
      print(command, ":", data)
    end),

    skip_validation = true,
  }:sync(50000, nil, true)
end

local function local_main()
  P(_G)
  --info('This is my\nSuper important message now', 'test')
  --P(run_cmd {
  --  "test",
  --  "arg2",
  --  "arg3",
  --  cwd = "/tmp",
  --})
end

local_main()
