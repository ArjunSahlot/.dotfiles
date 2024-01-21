return {
    {
        'numToStr/Comment.nvim',
        opts = {
            toggler={
                block='gcb',
            }
        },
        lazy = false,
        config = function()
            require("Comment").setup()
        end
    }
}
