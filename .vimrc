"basic
syntax enable
set nobackup
set nocompatible
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set cindent
set number
set showmatch
set mouse=a
set ruler
set showcmd
set incsearch
set sidescroll=1
set whichwrap=b,s,<,>,[,]
set foldmethod=marker
set textwidth=80
set encoding=utf-8

filetype off

" vundle
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

Plugin 'fugitive.vim'
Plugin 'L9'
Plugin 'jiangmiao/auto-pairs'
Plugin 'http://github.com/sirver/ultisnips.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-flake8'
Plugin 'Syntastic'
Plugin 'pydoc.vim'
Plugin 'taglist.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplcache-clang'
Plugin 'pyflakes.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/emmet-vim'
Plugin 'Solarized'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

filetype plugin indent on

"solarized
set t_Co=16
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

"powerline
set laststatus=2
" let g:Powerline_symbols = 'fancy'

"taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <leader>t :TlistToggle<CR>

"markdown-mode
let g:vim_markdown_folding_disabled=1

"keymap
let mapleader = ','
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :TlistToggle<CR>
let g:libclang_library_path='/usr/lib/'
let g:pep8_map = '<leader>8'
let NERDTreeQuitOnOpen = 1

" Y yanks to the end of the line 
nnoremap Y y$

" File Browser
nnoremap <leader>d :NERDTreeToggle<CR>

" pyflake
let g:pyflakes_use_quickfix = 0

" Ctral + a
nnoremap <C-a> ggvG$
" copy to system buffer
nnoremap <C-c> "+y
" tip: copy system buffer into vim
" Shift + Insert

" Auto Close Nerdtree window when only it exits
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Auto Close Taglist window when only it exits
autocmd bufenter * if (winnr("$") == 1 && exists("b:Taglist") && b:Taglist == "primary") | q | endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" insert no recursive map
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()

" move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Don't use Ex mode, use Q for formatting
nnoremap Q gq
inoremap jj <ESC>
nnoremap gf gf:sbn<CR><C-j>

" quickly open my vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>b :tabnew 

" add pairs of bracket in normal mode
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel

" delete pairs of bracket in normal mode
nnoremap d' ExBxE
nnoremap di' elxbhx

" add pairs in visual mode
vnoremap <leader>" <esc>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>a'<esc>`<i'<esc>
vnoremap <leader>[ <esc>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>a}<esc>`<i{<esc>
vnoremap <leader>< <esc>a><esc>`<i<<esc>
vnoremap <leader>( <esc>a)<esc>`<i)<esc>

" delete pairs in visual mode.
vnoremap -' <esc>x`<x

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Going to the next element in a search will center on the line it's found in.
nnoremap n nzz
nnoremap N Nzz

" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e
