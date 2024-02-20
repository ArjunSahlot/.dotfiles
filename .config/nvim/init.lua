require("arjun")

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload(...)
end

R = function(module)
    RELOAD(module)
    return require(module)
end
