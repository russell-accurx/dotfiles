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

vim.keymap.set('n', '<space><space>', require("nvim-tree").toggle, { noremap=true, silent=true })

local augroup = vim.api.nvim_create_augroup("TreeCollapsing", {})
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  command = "NvimTreeClose"
})
