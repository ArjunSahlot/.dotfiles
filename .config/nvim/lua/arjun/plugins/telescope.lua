return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>sg", builtin.git_files, {})
      vim.keymap.set("n", "<leader>ss", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>st", builtin.treesitter, {})
      vim.keymap.set("n", "<leader>sc", builtin.commands, {})
      vim.keymap.set("n", "<leader>sb", builtin.builtin, {})
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
