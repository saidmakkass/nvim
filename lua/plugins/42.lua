return {
  { "42paris/42header" },
  { "cacharle/c_formatter_42.vim" },
  {
    "hardyrafael17/norminette42.nvim",
    config = function()
      require("norminette").setup({
        runOnSave = true,
        maxErrorsToShow = 5,
        active = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        c = { "CFormatter42" },
        python = { "autopep8" },
        makefile = { "mbake" },
      }

      opts.formatters = opts.formatters or {}
      opts.formatters.CFormatter42 = {
        format = function(self, bufnr, callback)
          -- Use the global command directly on the current buffer
          vim.cmd("CFormatter42")
          callback()
        end,
      }
    end,
  },
}
