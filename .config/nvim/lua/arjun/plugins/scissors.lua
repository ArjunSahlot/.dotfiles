return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      telescope = {
        alsoSearchSnippetBody = true,
      },
    },
    config = function()
      local scissors = require("scissors")
      vim.keymap.set("n", "<leader>se", scissors.editSnippet)
      vim.keymap.set({ "n", "x" }, "<leader>sa", scissors.addNewSnippet)
    end,
  },
}
