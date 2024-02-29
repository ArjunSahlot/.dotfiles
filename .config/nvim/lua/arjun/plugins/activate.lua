return {
  "roobert/activate.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>P", function()
      require("activate").list_plugins()
    end)
  end,
}
