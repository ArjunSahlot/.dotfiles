return {
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")
            local job = require("plenary.job")
            job:new({
                command = "curl",
                args = { "-L", "https://vimiscool.tech/neotip" },
                on_exit = function(j, exit_code)
                    local res = table.concat(j:result(), "\n")
                    if exit_code ~= 0 then
                        local err = table.concat(j:stderr_result(), "\n")
                        res = "Error fetching tip: " .. (err ~= "" and err or "Unknown error")
                    end
                    vim.notify(res, vim.log.levels.INFO)
                end,
            }):start()
        end
    }
}

