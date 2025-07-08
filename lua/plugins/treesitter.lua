print("Hello from Treesitter")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Set install options inside the config block
    require("nvim-treesitter.install").prefer_git = false
    require("nvim-treesitter.install").compilers = { "clang", "gcc" }

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "lua" },
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },
    })
  end,
}
