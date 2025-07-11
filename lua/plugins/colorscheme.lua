print("Hello from catpuccino")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        telescope = true,
        treesitter = true,
      },
    })

    -- Set the colorscheme
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
