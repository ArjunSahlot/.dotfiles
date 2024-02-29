return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local function is_whitespace(line)
        return vim.fn.match(line, [[^\s*$]]) ~= -1
      end

      local function all(tbl, check)
        for _, entry in ipairs(tbl) do
          if not check(entry) then
            return false
          end
        end
        return true
      end

      require("neoclip").setup({
        filter = function(data)
          return not all(data.event.regcontents, is_whitespace)
        end,
      })

      vim.keymap.set("n", "<leader>cb", "<cmd>Telescope neoclip<cr>", { desc = "Open clipboard history" })
      vim.keymap.set("n", "<leader>cm", "<cmd>Telescope macroscope<cr>", { desc = "Open macro history" })
    end,
  },
}
