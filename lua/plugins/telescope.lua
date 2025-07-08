print("Hello from telescope")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },  -- Required by telescope
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup()

    -- Keymaps
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  end,
}
