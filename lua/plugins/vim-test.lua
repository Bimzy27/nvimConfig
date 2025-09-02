return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    -- Keymappings moved to vim-options.lua
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
