" Plugin installer
call plug#begin('~/.vim/plugged')
	
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'
Plug 'aroCODE99/desert256Ext'

call plug#end()

" Leader key
let mapleader = " "

" Some Vim options
set sc
set termguicolors
set nocompatible 
set clipboard=unnamedplus
set ff=unix
set hidden
set nowrap
set number
set relativenumber
set tabstop=4       " Width of a tab is 4 spaces
set shiftwidth=4    " Indentation level is 4 spaces
set wildmenu
set hlsearch
set incsearch
set ignorecase 
set smartcase
set undofile
set undodir=~/.vim/undo
set t_Co=256
"if undodir is not present we create it
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif

set belloff=all
set scrolloff=9
set mouse=a
set noswapfile
set laststatus=2
set noshowmode
set sc
set noshowmatch
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" adding theme
let g:desert_variant="dark"
colors desert256Ext
" highlight HighlightedyankRegion cterm=reverse gui=reverse

" hi Normal guibg=NONE ctermbg=NONE 

" Hide class files in netrw
let g:netrw_list_hide = '\v(\.class$)'

" mappings
nnoremap <tab> :Ex<CR>
nnoremap <leader>fs :FZF<CR>
nnoremap <leader>fg :RG<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Colors<CR>
nnoremap <leader>u <Cmd>UndotreeToggle<CR>
nnoremap <C-l> zz
nnoremap <leader>gs <Cmd>G<CR>

" Configuration for the FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-y': 'split', 
			\ 'ctrl-v': 'vsplit' }

let g:highlightedyank_highlight_duration = 50

" setting up the lsp
packadd lsp

" " Clangd Lsp
" call LspAddServer([#{
" 	\    name: 'clangd',
" 	\    filetype: ['c', 'cpp'],
" 	\    path: '/usr/bin/clangd',
" 	\    args: ['--background-index']
" 	\  }])

" Javascript/Typescript language server
call LspAddServer([#{
			\    name: 'typescript-language-server',
			\    filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
			\    path: '/usr/bin/typescript-language-server',
			\    args: ['--stdio'],
			\  }])

nnoremap [q :LspDiagNextWrap<CR>
nnoremap ]q :LspDiagPrevWrap<CR>
nnoremap <leader>ac :LspCodeAction<CR>
nnoremap gd :LspGotoDefinition<CR>
nnoremap K :LspHover<CR>
nnoremap gr :LspPeekReferences<CR>
nnoremap <leader>rn :LspRename<CR>

