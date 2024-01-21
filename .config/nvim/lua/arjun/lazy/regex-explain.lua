return {
    {
        'bennypowers/nvim-regexplainer',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            local regexp = require('regexplainer')
            regexp.setup({
                auto = true,
                filetypes = {
                    'html',
                    'js',
                    'ts',
                    'jsx',
                    'tsx',
                    'lua',
                    'py'
                }
            })

            vim.keymap.set("n", "gR", regexp.toggle)
        end,
    }
}
