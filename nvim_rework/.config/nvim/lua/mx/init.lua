require("mx.set")
require("mx.packer")
require("mx.telescope")
require("mx.neogit")

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end
