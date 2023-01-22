vim.cmd([[
  let g:neo_tree_remove_legacy_commands = 1
]])

require("neo-tree").setup({
  enable_git_status = false,
  sort_case_insensitive = false,
  window = { position = "current" },
  filesystem = {
    window = {
      position = "current",
    },
    hijack_netrw_behavior = "open_current",
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = { ".DS_Store", ".vscode", "node_modules" },
    },
  },
})
