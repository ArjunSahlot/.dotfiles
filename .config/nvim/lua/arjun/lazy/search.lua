return {
    {
        'kevinhwang91/nvim-hlslens',
        opts = {
            auto_enable        = {
                description = [[Enable nvim-hlslens automatically]],
                default = true
            },
            enable_incsearch   = {
                description = [[When `incsearch` option is on and enable_incsearch is true, add lens
            for the current matched instance]],
                default = true
            },
            calm_down          = {
                description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
                default = false,
            },
            nearest_only       = {
                description = [[Only add lens for the nearest matched instance and ignore others]],
                default = false
            },
            nearest_float_when = {
                description = [[When to open the floating window for the nearest lens.
            'auto': floating window will be opened if room isn't enough for virtual text;
            'always': always use floating window instead of virtual text;
            'never': never use floating window for the nearest lens]],
                default = 'auto',
            },
            float_shadow_blend = {
                description = [[Winblend of the nearest floating window. `:h winbl` for more details]],
                default = 50,
            },
            virt_priority      = {
                description = [[Priority of virtual text, set it lower to overlay others.
        `:h nvim_buf_set_extmark` for more details]],
                default = 100,
            },
            override_lens      = {
                description = [[Hackable function for customizing the lens. If you like hacking, you
            should search `override_lens` and inspect the corresponding source code.
            There's no guarantee that this function will not be changed in the future. If it is
            changed, it will be listed in the CHANGES file.
            @param render table an inner module for hlslens, use `setVirt` to set virtual text
            @param splist table (1,1)-indexed position
            @param nearest boolean whether nearest lens
            @param idx number nearest index in the plist
            @param relIdx number relative index, negative means before current position,
                                  positive means after
        ]],
                default = nil
            },
        },
        config = function()
            require('hlslens').setup()

            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap('n', 'n',
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts)
            vim.api.nvim_set_keymap('n', 'N',
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts)
            vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

            vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
        end
    }
}
