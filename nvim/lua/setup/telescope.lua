local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.load_extension('smart_history')

telescope.setup({
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<esc>"] = actions.close,
        ["<C-a>"] = { "<home>", type = "command" },
        ["<C-e>"] = { "<end>", type = "command" },
        ["<C-b>"] = { "<left>", type = "command" },
        ["<C-f>"] = { "<right>", type = "command" },
      },
    },
    history = {
      path = '~/.config/telescope.sqlite3',
      limit = 100,
    }
  },
})

vim.keymap.set('n', '<leader><space>', ':Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>', { noremap = true })
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<leader>F', ':Telescope grep_string<cr>', { noremap = true })
