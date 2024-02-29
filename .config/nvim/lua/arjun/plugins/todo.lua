return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        FIX = {
          alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE", "PROBLEM", "ERROR", "ERR" },
        },
        TODO = {
          alt = { "TODO", "TASK", "NEXT" },
        },
        WARN = {
          alt = { "WARN", "WARNING", "XXX" },
        },
        PERF = {
          alt = { "PERF", "OPTIM", "OPTIMIZE", "PERFORMANCE", "OPTIMISE" },
        },
        NOTE = {
          alt = { "NOTE", "INFO" },
        },
        TEST = {
          alt = { "TEST", "UNITTEST", "TESTING", "PASSED", "FAILED", "FAILURE" },
        },
      },
    },
  },
}
