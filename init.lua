local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.api.nvim_create_user_command("LoveRun1", function()
  vim.notify("Running LOVE2D game...", vim.log.levels.INFO)

  vim.fn.jobstart({
    "C:\\Program Files\\LOVE\\love.exe",
    "--console",
    "C:\\Programming\\neovim\\luaGame"
  }, {
    detach = true,
  })
end, {})
