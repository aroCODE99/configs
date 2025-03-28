" Plugin installer
call plug#begin('~/.vim/plugged')
	
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Leader key
let mapleader = " "

" Highlighted Yank configuration
let g:highlightedyank_highlight_duration = 100

" Some Vim options
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
set undodir=~/.vim/undo
set undofile
set belloff=all
set scrolloff=9
set mouse=a
set noswapfile
set laststatus=2
set noshowmode
set noshowmatch
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Colorscheme
let g:zenburn_high_Contrast=2
colors twilight

" this just makes the background transparent
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

" Configuration for the FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-y': 'split', 
			\ 'ctrl-v': 'vsplit' }

" setting up the lsp
packadd lsp

" Clangd Lsp
call LspAddServer([#{
	\    name: 'clangd',
	\    filetype: ['c', 'cpp'],
	\    path: '/usr/bin/clangd',
	\    args: ['--background-index']
	\  }])

call LspAddServer([#{
	\    name: 'typescriptlang',
	\    filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
	\    path: '/usr/bin/typescript-language-server',
	\    args: ['--stdio']
	\  }])

call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: '/home/prathamesh/myenv/bin/pylsp',
                 \   args: []
                 \ }])

nnoremap [q :LspDiagNextWrap<CR>
nnoremap ]q :LspDiagPrevWrap<CR>
nnoremap <leader>ac :LspCodeAction<CR>
nnoremap gd :LspGotoDefinition<CR>
nnoremap K :LspHover<CR>
nnoremap gr :LspPeekReferences<CR>
nnoremap <leader>rn :LspRename<CR>

