return {
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      vim.cmd("colorscheme onedark_vivid")
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#7788AA", bold = true })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#7788AA", bold = true })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFFFFF", bold = true })
    end,
  },
}
