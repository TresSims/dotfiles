-- add window picker

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
  },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      event = "VeryLazy",
      config = function()
        require("window-picker").setup()
      end,
      opts = {
        selection_chars = "FJDKSLA;",
      },
    },
  },
}
