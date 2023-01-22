require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "typescript" },
  sync_install = false,
  auto_install = true,

  autotag = {
    enable = true 
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
