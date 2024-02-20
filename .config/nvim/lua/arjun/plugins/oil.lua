return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                columns = {
                    "icon",
                    {"size", highlight="Number"},
                    {"permissions", highlight="Special"},
                    {"mtime", highlight="Comment"},
                },
                delete_to_trash = true;
            })
            vim.keymap.set("n", "<C-p>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    }
}
