return {
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")
            vim.notify.setup({
                max_width = 80,
                on_open = function(win)
                    if win and vim.api.nvim_win_is_valid(win) then
                        local buf = vim.api.nvim_win_get_buf(win)
                        vim.api.nvim_win_set_option(win, 'wrap', true)
                        -- local chars = 0
                        -- for i = 4, vim.fn.line("$") do
                        --     chars = chars + vim.fn.strchars(vim.fn.getline(i))
                        -- end
                        -- height = math.ceil(chars / 80)
                        vim.api.nvim_win_set_height(win, 5)
                    end
                end
            })
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
                    vim.notify(res, vim.log.levels.INFO, {
                        title = "W TIPPPPPPP",
                        timeout = 10000,
                    })
                end,
            }):start()
        end
    }
}
