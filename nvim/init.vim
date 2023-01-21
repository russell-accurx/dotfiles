set nocompatible
filetype plugin indent on
syntax on

if &shell =~# 'fish$'
  set shell=bash
endif

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

call plug#begin('~/.config/nvim/plugged')

Plug 'dag/vim-fish'
Plug 'mhartington/oceanic-next'
Plug 'qpkorr/vim-renamer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

" neovim / lua plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-smart-history.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-git'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'kkharji/sqlite.lua'
call plug#end()

set termguicolors

set encoding=utf-8
set number
set clipboard=unnamed
set colorcolumn=80

" indent by 2 spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set autoindent
set autoread
set hlsearch
set ignorecase
set incsearch

set mouse=a
set mousemodel=popup
set noswapfile
set nowrap
set nobackup
set nowritebackup
set smartcase
set splitbelow
set splitright
set visualbell
set signcolumn=yes

colorscheme OceanicNext

let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","
nnoremap \ ,

"" Projectionist.vim
nmap <leader><leader> :A<CR>
nmap <leader>ca :Eactions<CR>
nmap <leader>cc :Ecomponent<CR>
nmap <leader>cC :Econstants<CR>
nmap <leader>ch :Ehooks<CR>
nmap <leader>ci :Eindex<CR>
nmap <leader>cr :Ereducer<CR>
nmap <leader>cs :Estyles<CR>
nmap <leader>ct :Etest<CR>
nmap <leader>cT :Etypes<CR>
nmap <leader>cd :e <C-R>=expand('%:h') . "/"<esc> <CR>

"" disable ex mode
nnoremap Q <nop>

"" Splits
nmap <leader>v :vs<CR>
nmap <leader>h :sp<CR>

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
