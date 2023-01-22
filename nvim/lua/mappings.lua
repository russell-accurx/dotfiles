-- Projectionist.vim
vim.keymap.set('n', '<leader><leader>', ':A<CR>')
vim.keymap.set('n', '<leader>ca', ':Eactions<CR>')
vim.keymap.set('n', '<leader>cc', ':Ecomponent<CR>')
vim.keymap.set('n', '<leader>cC', ':Econstants<CR>')
vim.keymap.set('n', '<leader>ch', ':Ehooks<CR>')
vim.keymap.set('n', '<leader>ci', ':Eindex<CR>')
vim.keymap.set('n', '<leader>cr', ':Ereducer<CR>')
vim.keymap.set('n', '<leader>cs', ':Estyles<CR>')
vim.keymap.set('n', '<leader>ct', ':Etest<CR>')
vim.keymap.set('n', '<leader>cT', ':Etypes<CR>')

-- Disable ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- Splits
vim.keymap.set('n', '<leader>v', ':vs<CR>')
vim.keymap.set('n', '<leader>h', ':sp<CR>')

-- Clear search highlight
vim.keymap.set('n', '<leader><CR>', ':nohl<CR>')

-- Movement between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Handle common tpyos
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})
vim.api.nvim_create_user_command('E', 'e', {})


-- add %% expansion for current directory
vim.cmd [[
  cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
]]

-- Emacs movement in command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<M-f>', '<S-Right>')
vim.keymap.set('c', '<M-b>', '<S-Left>')
