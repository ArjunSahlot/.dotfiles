return {
  {
    "andymass/vim-matchup",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
        },
      })

      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
      }
    end,
  },
}
