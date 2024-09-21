return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = false,
    },
    document_highlight = {
      enabled = true,
    },
    servers = {
      lua_ls = {},
      rust_analyzer = {},
    },
  },
  config = function(_, opts)
    for server, o in pairs(opts.servers) do
      require('lspconfig')[server].setup(o)
    end
  end
}
