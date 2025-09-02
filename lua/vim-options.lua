vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- ============================================================================
-- CENTRALIZED KEYMAPPINGS
-- ============================================================================

-- LSP Keymappings (available after LSP setup)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Neo-tree Keymappings
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

-- Gitsigns Keymappings
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Vim-test Keymappings
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})

-- Plugin-dependent keymappings (set after plugins are loaded)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Telescope keymappings (requires telescope.builtin)
    local telescope_ok, builtin = pcall(require, "telescope.builtin")
    if telescope_ok then
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
    end

    -- Oil keymappings (requires oil plugin)
    local oil_ok, oil = pcall(require, "oil")
    if oil_ok then
      vim.keymap.set("n", "-", oil.toggle_float, {})
    end
  end,
})