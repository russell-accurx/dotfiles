-- Projectionist.vim
vim.keymap.set('n','<leader><leader>', ':A<CR>')
vim.keymap.set('n','<leader>ca', ':Eactions<CR>')
vim.keymap.set('n','<leader>cc', ':Ecomponent<CR>')
vim.keymap.set('n','<leader>cC', ':Econstants<CR>')
vim.keymap.set('n','<leader>ch', ':Ehooks<CR>')
vim.keymap.set('n','<leader>ci', ':Eindex<CR>')
vim.keymap.set('n','<leader>cr', ':Ereducer<CR>')
vim.keymap.set('n','<leader>cs', ':Estyles<CR>')
vim.keymap.set('n','<leader>ct', ':Etest<CR>')
vim.keymap.set('n','<leader>cT', ':Etypes<CR>')

-- Disable ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- Splits
vim.keymap.set('n', '<leader>v', ':vs<CR>')
vim.keymap.set('n', '<leader>h', ':sp<CR>')
