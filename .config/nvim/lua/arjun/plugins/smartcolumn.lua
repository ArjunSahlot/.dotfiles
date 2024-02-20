return {
    {
        "m4xshen/smartcolumn.nvim",
        config = function()
            require("smartcolumn").setup({
            colorcolumn = "80",
            disabled_filetypes = { "help", "text", "markdown" },
            scope = "file",
            })
        end
    },
}
