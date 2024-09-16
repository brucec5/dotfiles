return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
  },
}
