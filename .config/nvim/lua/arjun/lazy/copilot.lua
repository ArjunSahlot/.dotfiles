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
                },
                filetypes = {
                    ["*"] = true
                }
            })
        end,
    }
}
