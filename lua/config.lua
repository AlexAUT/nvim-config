-- Set highlight on search
vim.o.hlsearch = true
vim.keymap.set('n', '<space><space>', '<CMD>:noh<CR>', { desc = 'Reset search highlights' })
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Indent
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', '<C-Right>', [[<cmd>vertical resize +5<cr>]])  -- make the window biger vertically
vim.keymap.set('n', '<C-Left>', [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set('n', '<C-Up>', [[<cmd>horizontal resize +2<cr>]])   -- make the window bigger horizontally by pressing shift and =
vim.keymap.set('n', '<C-Down>', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.keymap.set('n', '<leader>E', [[<cmd>Ex<cr>]], { desc = '[E]xplore' })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.o.scrolloff = 4

-- File extensions
vim.filetype.add({
  extension = {
    frag = 'glsl',
    vert = 'glsl',
    geom = 'glsl',
    glsl = 'glsl',
    comp = 'glsl',
  }
})
