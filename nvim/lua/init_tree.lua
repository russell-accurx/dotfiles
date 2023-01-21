vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<CR>", action = "edit" },
      }
    }
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

function toggle_replace()
  local view = require 'nvim-tree.view'
  if view.is_visible() then
    view.close()
  else
    require('nvim-tree').open_replacing_current_buffer()
  end
end

vim.keymap.set('n', '-', toggle_replace)

vim.keymap.set('n', '<space><space>', require("nvim-tree").open_replacing_current_buffer, { noremap=true, silent=true })

local augroup = vim.api.nvim_create_augroup("TreeCollapsing", {})
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  command = "NvimTreeClose"
})
