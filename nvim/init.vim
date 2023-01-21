lua << EOF
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "options"
require "plugins"
require "mappings"
EOF

"" Clear search highlight
nmap <leader><CR> :nohl<CR>

"" Movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Handle common tpyos
command! W   :w
command! Wa  :wa
command! Wq  :wq
command! Wqa :wqa
command! E   :e

"" add %% expansion for current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" "" Remove temptation of arrow keys
" noremap <Up>      <nop>
" noremap <Down>    <nop>
" noremap <Left>    <nop>
" noremap <Right>   <nop>

" inoremap <Up>     <nop>
" inoremap <Down>   <nop>
" inoremap <Left>   <nop>
" inoremap <Right>  <nop>

"" Emacs movement in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>

lua require("./init_completion")
lua require("./init_lsp")
lua require("./init_telescope")
lua require("./init_prettierd")
lua require("./init_treesitter")
lua require("./init_neotree")
nnoremap <silent> <leader><space> :Telescope find_files<cr>
nnoremap <silent> <leader>b :Telescope buffers<cr>
nnoremap <silent> <leader>f :Telescope live_grep<cr>
nnoremap <silent> <leader>F :Telescope grep_string<cr>

autocmd! FileType TelescopePrompt inoremap <buffer><C-a> <Home>
autocmd! FileType TelescopePrompt inoremap <buffer><C-e> <End>
