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
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"},
            },
          },
        },
      },
      rust_analyzer = {},
      gopls = {},
    },
  },
  config = function(_, opts)
    for server, o in pairs(opts.servers) do
      require('lspconfig')[server].setup(o)
    end
  end
}
