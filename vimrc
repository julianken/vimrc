
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax highlighting and indenting for JSX.
" JSX is a JavaScript syntax transformer which
" translates inline XML document fragments into JavaScript objects.
" It was developed by Facebook alongside React.
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" A command-line fuzzy finder written in Go
" http://vimawesome.com/plugin/fzf
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plugin 'junegunn/fzf'

" Super simple vim plugin to show the list of buffers in the command bar.
" http://vimawesome.com/plugin/vim-bufferline
Plugin 'bling/vim-bufferline'

" Buffergator is a plugin for listing, navigating between, and selecting
" buffers to edit
" https://github.com/jeetsukumaran/vim-buffergator
Plugin 'jeetsukumaran/vim-buffergator'

" The NERD tree allows you to explore your filesystem and to open files and directories.
" https://github.com/scrooloose/nerdtree
" http://vimawesome.com/plugin/nerdtree-red
Plugin 'scrooloose/nerdtree'

" Syntax file and other settings for TypeScript.
" https://github.com/leafgarland/typescript-vim
Plugin 'leafgarland/typescript-vim'

Plugin 'wincent/ferret'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'dracula/vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" FILE EXPLORE SETTINGS
" setting netrw like NERDTree
" absolute width of netrw window
let g:netrw_winsize = -28
" enable/suppress the banner
"    =0: suppress the banner
"    =1: banner is enabled (default)
let g:netrw_banner = 0 " do not display info on the top of window
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" use the previous window to open file
" when browsing, <ENTER> will open the file by:
"    =0: re-using the same window  (default)
"    =1: horizontally splitting the window first
"    =2: vertically   splitting the window first
"    =3: open file in new tab
"    =4: open previous window
let g:netrw_browse_split = 4   " use the previous window to open file
"  to display line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" END FILE EXPLORE SETTINGS

set nocompatible
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" It requires the plugin bufferline
" STATUSLINE INTEGRATION *bufferline-statusline
" let g:bufferline_echo = 0
" autocmd VimEnter *
"       \ let &statusline='%{bufferline#refresh_status()}'
"       \ .bufferline#get_status_string()

" Display line numbers on the left
set number
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" https://www.cs.oberlin.edu/~kuperman/help/vim/indenting.html
set shiftwidth=2
set softtabstop=2
set expandtab
" You can replace all the tabs with spaces in the entire file with
" :%retab
" :retab
" allow toggling between local and default mode
" :call TabToggle()
function TabToggle()
  if &expandtab
    " use tab
    " set shiftwidth=8
    set tabstop=2
    set shiftwidth=2
    set softtabstop=0
    set noexpandtab
  else
    " use space
    set tabstop=8
    set shiftwidth=2
    set softtabstop=2
    set expandtab
  endif
endfunction

" Always display the status line, even if only one window is displayed
"  'laststatus' = 0    never a status line
"  'laststatus' = 1    status line if there is more than one window
"  'laststatus' = 2    always a status line
set laststatus=2

" to turn on the cursorline
" and `set cursorcolumn` (to highlight the current column):
set cursorline

" Turn on color syntax highlighting
syntax on

" wrap tells Vim to word wrap visually (as opposed to changing the text in the buffer)
set nowrap
""
" to highlight all search matches
set hlsearch
" Vim incremental search
set incsearch
"
" Showing NERDTree bookmark relative to project/directory
" https://blog.htbaa.com/news/vim-essentials-nerd-tree
let bookmarkpath=getcwd()."/.NERDTreeBookmarks"
if filereadable(bookmarkpath)
  let g:NERDTreeBookmarksFile=bookmarkpath
endif
" Settings for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,reports,build

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|reports|build)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" To get new colorschemes
" Molokai colorscheme
" wget -N https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -P ~/.vim/colors/
let g:dracula_italic = 0
colorscheme dracula
" -------------------
" colorscheme default
" colorscheme delek
" colorscheme elflord
" colorscheme koehler
" colorscheme pablo
" colorscheme peachpuff
" colorscheme ron
" colorscheme slate
" colorscheme torte
" colorscheme zellner
" colorscheme darkblue
" GOOD ONE colorscheme just for presentation/talk/speach
" colorscheme shine
" GOOD ONE colorscheme to use with mvim
" colorscheme macvim
" colorscheme koehler
" colorscheme murphy
" colorscheme pablo
" colorscheme torte
" GOOD ONE colorscheme to use with mvim durering presentation/talk/speach
" colorscheme delek
" colorscheme morning
" colorscheme shine
" colorscheme zellner

" Customize Vim to change border on horizontal split
" highlight VertSplit cterm=none gui=none
highlight VertSplit guifg=#3a3a3a ctermfg=237 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

" change ESC to JK - avoid the escape key
" http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>
" map “save” to ctrl-j
nnoremap <c-j> :w<CR>
inoremap <c-j> <c-o>:w<CR>
vnoremap <c-j> <c-o>:w<CR>
" close buffer to ctrl-k
" https://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
nnoremap <c-k>h :bp\|bd #<CR>
inoremap <c-k>h <esc>:bp\|bd #<CR>
vnoremap <c-k>h <esc>:bp\|bd #<CR>
" nnoremap <c-k>h :bd<CR>
" inoremap <c-k>h <esc>:bd<CR>
" vnoremap <c-k>h <esc>:bd<CR>
nnoremap <c-k>l :q<CR>
inoremap <c-k>l <esc>:q<CR>
vnoremap <c-k>l <esc>:q<CR>
nnoremap <c-k>k :noh<CR>
inoremap <c-k>k <esc>:noh<CR>
vnoremap <c-k>k <esc>:noh<CR>
nnoremap <c-k><c-k> :e<CR>
inoremap <c-k><c-k> <esc>:e<CR>
vnoremap <c-k><c-k> <esc>:e<CR>
" open NerdTree
nnoremap <c-k><c-j> :NERDTreeFind<CR>
inoremap <c-k><c-j> <esc>:NERDTreeFind<CR>
vnoremap <c-k><c-j> <esc>:NERDTreeFind<CR>

nnoremap <c-k>j :NERDTree %<CR>
inoremap <c-k>j <esc>:NERDTree %<CR>
vnoremap <c-k>j <esc>:NERDTree %<CR>
nnoremap <c-k>u :NERDTree<CR>
inoremap <c-k>u <esc>:NERDTree<CR>
vnoremap <c-k>u <esc>:NERDTree<CR>
" move on tabs ctrl-h ctrl-l
nnoremap <c-l> gt
inoremap <c-l> <esc>gt
vnoremap <c-l> <esc>gt
nnoremap <c-h> gT
inoremap <c-h> <esc>gT
vnoremap <c-h> <esc>gT
" move through buffers ctrl-n trl-m
nnoremap <c-n> :bprev<CR>
nnoremap <c-m> :bnext<CR>

set clipboard=unnamedplus
"if has('syntax')
"    syntax enable             " Turn on syntax highlighting
"    silent! colorscheme eldar " Custom color scheme
"endif
set mouse=a
" To stop indenting when pasting with the mouse
set pastetoggle=<f5>
