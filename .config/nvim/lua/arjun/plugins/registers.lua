return {
  {
    dir = "/home/arjun/work/programming/github/global-registers.nvim/",
    config = function()
      require("global_registers").setup({
        on_load = true,
      })
    end,
    enabled = false,
  },
}
