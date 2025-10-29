return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "rust",
      "bash",
      "toml",
      "json",
      "jsonc",
      "go",
      "kdl",
      "gomod",
      "gosum",
      "gotmpl",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  }
}
