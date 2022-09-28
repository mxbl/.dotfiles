P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

--LOG = {
--    warn = function(msg)
--        require("vim.lsp.log").warn(msg)
--    end,
--    error = function(msg)
--        require("vim.lsp.log").error(msg)
--    end,
--}

R = function(name)
    RELOAD(name)
    return require(name)
end

require("mx.set")
require("mx.packer")
require("mx.telescope")
require("mx.neogit")
require("mx.snip")
require("mx.lsp")
