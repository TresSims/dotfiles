-- Conform settings

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        python = { "black" },
      },
    },
  },
}
