return {
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local trouble = require('trouble.providers.telescope')

            -- When you press <C-t> in telescope, it will open trouble
            telescope.setup {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                },
            }

            vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
            vim.keymap.set("n", "<leader>tr", function() require("trouble").toggle("lsp_references") end)
        end
    }
}
