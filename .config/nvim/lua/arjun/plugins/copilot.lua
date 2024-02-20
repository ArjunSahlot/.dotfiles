return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                panel = {
                    auto_refresh = true,
                    layout = {
                        position = "top"
                    }
                },
                suggestion = {
                    auto_trigger = true,
                    accept = false
                },
                filetypes = {
                    ["*"] = true
                }
            })

            vim.keymap.set("i", "<Tab>", function()
                if require("copilot.suggestion").is_visible() then
                    require("copilot.suggestion").accept()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
                end
            end, {
                silent = true,
            })
        end,
    }
}
