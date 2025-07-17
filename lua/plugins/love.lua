--print(vim.fn.globpath(vim.o.runtimepath, "love2d/library"))

return {
{
  "S1M0N38/love2d.nvim",
  event = "VeryLazy",
  opts = { 
--        path_to_love_bin = "C:/Program Files/LOVE/love.exe",
        debug_window_opts = { split = "below" },
        },
  keys = {
    { "<leader>v", ft = "lua", desc = "LÖVE" },
    { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
    { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  },
}
}
