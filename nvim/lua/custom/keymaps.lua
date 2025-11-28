-- lua/custom/keymaps.lua
-- File containing custom keymaps

local M = {}

-- Function to set up all keymaps
function M.setup()
  -- Clear search highlighting with Escape
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- Exit terminal mode with a more discoverable shortcut
  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

  -- Window navigation with CTRL+hjkl
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  vim.keymap.set('n', '<leader>x', function()
    print 'Hello this is Sijan'
  end, { desc = 'Custom function' })

  local keymap = vim.keymap

  keymap.set('n', '<leader>dv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
  keymap.set('n', '<leader>dh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
  keymap.set('n', '<leader>de', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
  keymap.set('n', '<leader>dx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

  keymap.set('n', '<leader>ll', function()
    require('lint').try_lint()
  end, { desc = 'Trigger linting for current file' })

  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format { async = true }
  end, { desc = 'Fix with ESLint (LSP format)' })

  keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
  keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
  keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
  keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
  keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab
  -- Uncomment to disable arrow keys in normal mode
  -- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  -- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  -- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  -- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
  keymap.set('n', '<leader>vt', [[<cmd>vsplit | term<cr>A]], { desc = 'Open terminal in vertical split' })
  keymap.set('n', '<leader>ht', [[<cmd>split | term<cr>A]], { desc = 'Open terminal in horizontal split' })
  keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Use jk to enter in terminal normal mode' })
  keymap.set('t', '<Esc>', '<C-\\><C-n>')
end

return M
