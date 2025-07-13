print("Hello from mason")


return {
  -- Core Mason plugin
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- Automatically install these LSPs
        ensure_installed = {
          "lua_ls",       -- Lua
        },
      })
    end,
  },
}
