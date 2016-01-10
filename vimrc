" Indenting and tabs
set shiftwidth=4
set tabstop=4
set expandtab

" do not keep a backup files 
set nobackup
set nowritebackup

" set the commandheight
set cmdheight=2

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Always display a status line at the bottom of the window
set laststatus=2

" Always set auto indenting on
set autoindent

" 'set nocompatible' is done in the Vundle section
" 'filetype plugin indent on' is done in the Vundle section

set nostartofline	" keep cursor in the same column if possible
set whichwrap=b,s,[,],<,>,h,l " allow cursor to wrap between lines
set virtualedit=block	" allow virtual editing in Visual block mode
set lazyredraw		" don't redraw screen while executing macros/mappings
set scrolloff=1		" minimal number of screen lines to keep above and below the cursor
set incsearch		" enable incremental search
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
syntax on		" enable syntax highlighting (set by solarized)

" other optional settings
set hlsearch		" highlight search patterns
" set ignorecase		" ignore case
set smartcase		" ignore case when the pattern contains lowercase letters only

"set showtabline=2	" always show tab page labels
set number		" display line numbers

" Initially, enable use of mouse
set mouse=a

" Run file shortcut command (:R)
command R !./%

" Toggle insert paste mode
nnoremap jp :set invpaste paste?<CR>

" Toggle line numbers
nnoremap jn :set invnumber<CR>

" turn off highlight search
nnoremap jh :noh<CR>|xnoremap <C-h> :noh<CR>|

" Toggle mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
nnoremap jm :call ToggleMouse()<CR>


" Redesigned mapping for the Colemak layout for Vim 7.0
" 2008-04-21 Shai Coleman, http://colemak.com/ . Public domain. 
"
" recommended commands for running under Linux console
" $ export TERM=xterm    # make Backspace and Ctrl-H work correctly
" $ stty -ixon -ixoff    # make Ctrl+S and Ctrl+Q work correctly

"
" Colemak layout:                  |                 QWERTY layout:
" `12345 67890-=     Move Around:  |  (instead of)   `12345 67890-=
"  qwfpg jlUy;[]\         u        |       k          qwert yuiop[]\
"  arstd hNEIo'         n   i      |     h   l        asdfg HJKL;'
"  zxcvb km,./            e        |       j          zxcvb nm,./
" 
" (nv  )    n =Left        ,     i =Right    ,    u =Up        ,     e =Down
" (nv  )    N =Left*5      ,     I =Right*5  ,    U =Up*5      ,     E =Down*5
" (nv  ) <C-n>=tabprev     ,  <C-i>=tabnext  , <C-u>=ScrollUp  ,  <C-e>=ScrollDown
" (nv  )    l =Left 1 word ,     y =Right 1 word
" (nv  ) <C-l>=Left 1 WORD ,  <C-y>=Right 1 WORD
" (nv  )    L =Home        ,     Y =End
" (nvic) <Space>=Space
" (nvic)  <CR>=Enter
" Legend:
" S - Shift, C - Ctrl
" (c - command line, i - insert mode, n - normal mode, v - visual+select mode)
"
if v:version < 700 | echohl WarningMsg | echo ".vimrc: You need Vim version 7.0 or later" | echohl None | finish | endif

" Up/down/left/right
nnoremap n h|xnoremap n h|onoremap n h|
nnoremap u k|xnoremap u k|onoremap u k|
nnoremap e j|xnoremap e j|onoremap e j|
nnoremap i l|xnoremap i l|onoremap i l|

" Turbo navigation mode
" Modified to work with counts, see :help complex-repeat
nnoremap <silent> N @='5h'<CR>|xnoremap <silent> N @='5h'<CR>|onoremap N 5h|
nnoremap <silent> U @='5k'<CR>|xnoremap <silent> U @='5k'<CR>|onoremap U 5k|
nnoremap <silent> E @='5j'<CR>|xnoremap <silent> E @='5j'<CR>|onoremap E 5j|
nnoremap <silent> I @='5l'<CR>|xnoremap <silent> I @='5l'<CR>|onoremap I 5l|

" Scroll in-place
" <C-y>:Up  <C-e>:Down
nnoremap <silent> <C-u> <C-y>|xnoremap <silent> <C-u> <C-y>
" <C-e> unchanged
map <C-i> <Nop>

" Home/end of line
" 0 unchanged
nnoremap L ^|xnoremap L ^|onoremap L ^|
nnoremap Y $|xnoremap Y $|onoremap Y $|

" Words forwards/backwards
nnoremap l b|xnoremap l b|onoremap l b|
nnoremap y w|xnoremap y w|onoremap y w|

" WORD left/right
nnoremap <C-l> B|vnoremap <C-l> B|onoremap <C-l> B|
nnoremap <C-y> W|vnoremap <C-y> W|onoremap <C-y> W|

" inneR text objects
" e.g. dip (delete inner paragraph) is now drp
onoremap r i

" Map ; to :
nnoremap ; :|xnoremap ; :|

" Cut/copy/paste
nnoremap x x|xnoremap x d|
nnoremap c y|xnoremap c y|
nnoremap v gP|xnoremap v gP|
nnoremap X dd|xnoremap X d|
nnoremap C yy|xnoremap C y|
nnoremap V p|xnoremap V p|
nnoremap <C-c> "+Y| " <C-c> with no selection copies current line to clipboard
nnoremap <C-x> "+dd| " <C-x> with no selection cuts current line to clipboard

" Undo/redo
nnoremap z u|xnoremap z :<C-u>undo<CR>|
"nnoremap gz U|xnoremap gz U<C-u>undo<CR>|
nnoremap Z <C-r>|xnoremap Z :<C-u>redo<CR>|
inoremap <CR> <C-g>u<CR>| " Break undo chain (Tip #1054)

" inSert/Replace/append (T)
nnoremap s i|xnoremap s i|
nnoremap S I|xnoremap S I|
nnoremap t a|xnoremap t a|
nnoremap T A|xnoremap T A|

" Visual mode
nnoremap a v|xnoremap a v|
nnoremap A V|xnoremap A V|

" Make insert/add work also in visual line mode like in visual block mode
xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")
xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")

" Change
nnoremap w c|xnoremap w c|
nnoremap W C|xnoremap W C|
nnoremap ww cc|

" Space, insert space
nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
 
" Enter, open line
nnoremap <CR> i<CR><Esc>|

" Insert literal
"inoremap <C-b> <C-v>|cnoremap <C-b> <C-v>|

" Tabs
noremap <silent> <C-t> :<C-u>tabnew<CR>|
noremap <silent> <C-p> :tabprev<CR>|
noremap <silent> <C-n> :tabnext<CR>|

" Viewport 
" creating an empty viewport (<C-w>n) is not available
nnoremap <C-w>n <C-w>h|xnoremap <C-w>n <C-w>h| 
nnoremap <C-w>u <C-w>k|xnoremap <C-w>u <C-w>k| 
nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j| 
nnoremap <C-w>i <C-w>l|xnoremap <C-w>i <C-w>l| 

" Macros (replay the macro recorded by qq)
"nnoremap Q @q|

" Delete/Backspace
nnoremap <C-d> "_x|vnoremap <Delete> "_d|
nnoremap <Delete> "_x|vnoremap <Delete> "_d|
nnoremap <C-h> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|
nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|

"Tip #1386, Make Vim completion popup menu work just like in an IDE
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"

" Restore mappings
" Free mappings: ,/+/H/~

" Misc overridden keys must be prefixed with g
"nnoremap gs s|xnoremap gs s|
"nnoremap gX X|xnoremap gX X|
"nnoremap gU U|xnoremap gU U|
"nnoremap gQ Q|xnoremap gQ Q|
"nnoremap gK K|xnoremap gK K|

" Navigate help file
" Use < and > to navigate in the help file instead
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|
au FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
au FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|
" opens commands in a new tab
cnoreabbr <expr> h    (getcmdtype() . getcmdline() != ':h'    ? 'h'    : 'tab help')
cnoreabbr <expr> he   (getcmdtype() . getcmdline() != ':he'   ? 'he'   : 'tab help')
cnoreabbr <expr> hel  (getcmdtype() . getcmdline() != ':hel'  ? 'hel'  : 'tab help')
cnoreabbr <expr> help (getcmdtype() . getcmdline() != ':help' ? 'help' : 'tab help')
cnoreabbr <expr> e    (getcmdtype() . getcmdline() != ':e'    ? 'e'    : 'tabedit' )
cnoreabbr <expr> ed   (getcmdtype() . getcmdline() != ':ed'   ? 'ed'   : 'tabedit' )
cnoreabbr <expr> edi  (getcmdtype() . getcmdline() != ':edi'  ? 'edi'  : 'tabedit' )
cnoreabbr <expr> edit (getcmdtype() . getcmdline() != ':edit' ? 'edit' : 'tabedit' )


"
" EasyMotion (replaces search)
"
let g:EasyMotion_do_mapping = 0

" Change the default keys to Colemak weighting
let g:EasyMotion_keys = 'seriaoplfuwyq;tn'

" Search (=easymotion-bd-fn)
map  / <Plug>(easymotion-sn)

" Remap the old search to '?'
noremap ? /

" Jump to next and previous search result
nnoremap k n|xnoremap k n|onoremap k n|
nnoremap K N|xnoremap K N|onoremap K N|

" Use space or enter to get to the first search result
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Bi-directional word and character jumping
map h <Plug>(easymotion-bd-f)
map H <Plug>(easymotion-bd-w)

" Previous search and jumping is replaced by easymotion
" t,T,w,W are already remapped to other actions
map f <Nop>
map F <Nop>
map p <Nop>
map P <Nop>
map b <Nop>
map B <Nop>
"noremap p t|xnoremap p t|onoremap p t|
"nnoremap P T|xnoremap P T|onoremap P T|
"nnoremap b ;|xnoremap b ;|onoremap b ;|
"nnoremap B ,|xnoremap B ,|onoremap B ,|



"
" vim-multiple-cursors
"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='m'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='M'
let g:multi_cursor_quit_key=','
map M <Nop>



"
" Vundle configuration
" 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" EasyMotion
Plugin 'easymotion/vim-easymotion'

" vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Solarized Colorscheme
"Bundle 'altercation/vim-colors-solarized'
"colorscheme solarized
"syntax enable
"set background=light

" Powerline
"Bundle '/powerline', {'rtp': 'powerline/bindings/vim/'}

" YouCompleteMe
" On OS X, first install the MacVim application by putting it into the Applications folder.
" Then install 'mvim' to run MacVim from the command line.
" Download the source and locate the executable 'src/MacVim/mvim'.
" Install the 'mvim' executable by copying it to '/usr/local/bin/mvim'.
" Create an alias to use mvim instead of the regular vim. Place this alias in the '.bash_profile':
" alias vim='mvim -v'
"Plugin 'Valloric/YouCompleteMe'

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

