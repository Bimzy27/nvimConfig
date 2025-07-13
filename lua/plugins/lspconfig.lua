print("Hello from LSP config")


return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",       -- Optional: For autocompletion
    "hrsh7th/cmp-nvim-lsp",   -- Optional: For LSP capabilities
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Optional: enhance LSP capabilities for nvim-cmp
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities() or {}
    )

    -- Attach formatting on save
    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end
    
    -- Setup for Lua LSP
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            cacheDirectory = vim.fn.stdpath("cache") .. "/lua-language-server",
          },
          telemetry = { enable = false },
        },
      },
    })

    -- 👇 Add more LSP servers here as needed
    -- Example: TypeScript
    -- lspconfig.tsserver.setup({
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- })

    -- Example: Python
    -- lspconfig.pyright.setup({
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- })
  end,
}
