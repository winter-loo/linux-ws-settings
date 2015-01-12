filetype off

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" vundle
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
let path='$vim/vimfiles/bundle/'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

Plugin 'fugitive.vim'
Plugin 'L9'
" Plugin 'clang-complete'
Plugin 'jiangmiao/auto-pairs'
Plugin 'http://github.com/sirver/ultisnips.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-flake8'
Plugin 'Syntastic'
" Plugin 'pydoc.vim'
Plugin 'taglist.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplcache-clang'
Plugin 'pyflakes.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/emmet-vim'
Plugin 'Solarized'
Plugin 'honza/vim-snippets'


call vundle#end()


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set guifont=Consolas:h12

let mapleader = ","
let g:libclang_library_path='/usr/lib/'
let g:pep8_map = '<leader>8'
let NERDTreeQuitOnOpen = 1
" auto close nerdtree window when only it exits
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()

" Exit vim when only taglist window exists
Tlist_Exit_OnlyWindow = 1

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
" set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
" no gui options
set go="
set nu
syntax on

" size of a hard tabstop
set tabstop=4

" size of an indent
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make 'tab' insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" turn on omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
imap jj <ESC>
map gf gf:sbn<CR><C-j>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" personal configuration
" code folding
" inside a method, and type 'za' to open and close a fold
set foldmethod=indent
set foldlevel=99

" pyflake
let g:pyflakes_use_quickfix = 0


" Tab completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" File Browser
map <leader>n :NERDTreeToggle<CR>

" Taglist
map <leader>t :TlistToggle<CR>

" Enable the mouse in the console
set mouse=a
" 80 characters limit
set textwidth=80
" necessary to allow arrows
set encoding=utf-8
" Y yanks to the end of the line 
map Y y$
" auto fold code
set nofoldenable
" no wrap automatically
" set nowrap

" Going to the next element in a search will center on the line it's found in.
map n nzz
map N Nzz

" Ctral + a
map <C-a> ggvG$
" copy to system buffer
map <C-c> "+y

colorscheme ron

" set statusline
set nocompatible
set encoding=utf-8
set noruler
set laststatus=2
set t_Co=256

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%f%m%r%w\                          "File+path Modified? Readonly?
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%8*\ %=\ %l,%v(%p%%)\                     "row,col(%)
set statusline+=%0*\ %L\                                  "total line

" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

