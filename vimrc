" Indenting and tabs
set shiftwidth=4
set tabstop=4
set expandtab

" Do not keep a backup or swap files
set nobackup
set nowritebackup
set noswapfile

" Set status line (deprecated in favor of vim airline)"
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Always display a status line at the bottom of the window
set laststatus=2

" Always set auto indenting on
set autoindent

" Set terminal color detection to 256 always
set t_Co=256

" 'set nocompatible' is done in the Vundle section
" 'filetype plugin indent on' is done in the Vundle section

" keep cursor in the same column if possible
set nostartofline

" Show column guide
set colorcolumn=121
highlight ColorColumn ctermbg=255

" Autowrapping
set textwidth=120

" Autowrapping of git editing
au FileType gitcommit setlocal tw=120

set whichwrap=b,s,[,],<,>,h,l " allow cursor to wrap between lines
set virtualedit=block	" allow virtual editing in Visual block mode
"set lazyredraw		" don't redraw screen while executing macros/mappings (deprecated: cursor bottom of screen glitch)
set scrolloff=1		" minimal number of screen lines to keep above and below the cursor
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
syntax on		" enable syntax highlighting (needed for solarized)

" Search
set incsearch		" enable incremental search
set hlsearch		" highlight search patterns
set ignorecase		" ignore case (needed for EasyMotion search)
set smartcase		" ignore case when the pattern contains lowercase letters only

" Display line numbers
set number
highlight LineNr ctermfg=172 ctermbg=255

" Enable use of mouse
if has('mouse')
    set mouse=a
endif

" Run file shortcut command (:R)
command R !./%

" Disable function keys
map <F1> <Nop>
map <F2> <Nop>
map <F3> <Nop>
map <F4> <Nop>
map <F5> <Nop>
map <F6> <Nop>
map <F7> <Nop>
map <F8> <Nop>
map <F9> <Nop>
map <F10> <Nop>
map <F11> <Nop>
map <F12> <Nop>

"
" 'j' shortcut keys
"

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

" Toggle NERDTree
map jt :NERDTreeToggle<CR>

" Strip trailing whitespace
function! StripTrailingWhitespaces()
    %s/\s\+$//e
endfunc
nnoremap jw :call StripTrailingWhitespaces()<CR>



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
noremap <C-i> <Nop>

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

" Cut/copy/paste (with system clipboard)
nnoremap x x|xnoremap x d|
nnoremap c y|xnoremap c y|
nnoremap v gP|xnoremap v gP|
nnoremap X "+x|xnoremap X "+d| " cut to clipboard
nnoremap C "+y|xnoremap C "+y| " copy to clipboard
nnoremap V "+gP|xnoremap V "+gP| " paste from clipboard

" Undo/redo
nnoremap z u|xnoremap z :<C-u>undo<CR>|
"nnoremap gz U|xnoremap gz U<C-u>undo<CR>| " not as useful
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

" Jump to next and previous search result
nnoremap k n|xnoremap k n|onoremap k n|
nnoremap K N|xnoremap K N|onoremap K N|

" Make insert/add work also in visual line mode like in visual block mode
xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")
xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-v>0o$A" : "A")

" Space, insert space
nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>

" Enter, open line
nnoremap <CR> i<CR><Esc>|

" Insert literal
"inoremap <C-b> <C-v>|cnoremap <C-b> <C-v>|

" Tabs
noremap <silent> <C-t> :tabnew<CR>|
noremap <silent> <C-p> :tabprev<CR>|
noremap <silent> <C-n> :tabnext<CR>|

" Viewport
" creating an empty viewport (<C-w>n) is not available
nnoremap w <C-w>|xnoremap w <C-w>|
nnoremap wn <C-w>h|xnoremap wn <C-w>h|
nnoremap wu <C-w>k|xnoremap wu <C-w>k|
nnoremap we <C-w>j|xnoremap we <C-w>j|
nnoremap wi <C-w>l|xnoremap wi <C-w>l|
" Unmap previous W and viewport keys
nnoremap W <Nop>|xnoremap W <Nop>
noremap <C-w> <Nop>|xnoremap <C-w> <Nop>

" Macros (replay the macro recorded by qq)
nnoremap Q @q|

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
"Plugin 'scrooloose/nerdcommenter'

" NERDTree
Plugin 'scrooloose/nerdtree'

" NERDTree Git
Plugin 'Xuyuanp/nerdtree-git-plugin'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Solarized Colorscheme
Plugin 'altercation/vim-colors-solarized'

" saltstack
Plugin 'saltstack/salt-vim'

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



"
" EasyMotion (replaces search)
"
let g:EasyMotion_do_mapping = 0

" Change the default keys to Colemak weighting
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'NTESIROALPUFYWKVHD'

" Change the highlight colors
hi EasyMotionTarget2First ctermbg=none ctermfg=darkgreen cterm=bold
hi EasyMotionTarget2Second ctermbg=none ctermfg=green cterm=bold

" Search (=easymotion-bd-fn)
map ? <Plug>(easymotion-sn)

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
noremap f <Nop>
noremap F <Nop>
noremap p <Nop>
noremap P <Nop>
noremap b <Nop>
noremap B <Nop>



"
" vim-multiple-cursors
"
" Note: 'set ignorecase' doesn't allow capital letters to be used as mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='m'
let g:multi_cursor_prev_key='p'
let g:multi_cursor_skip_key='f'
let g:multi_cursor_quit_key='<C-c>'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_visual_maps={}
let g:multi_cursor_insert_maps={}
let g:multi_cursor_normal_maps={}
" Disable <C-c> in normal mode so that it can be used as the quit key
nnoremap <C-c> <Nop>
" Disable the 'M' key
noremap M <Nop>


"
" NERDTree
"

" Close vim if the tree view is the last view
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable netrw (:Explore)
let loaded_netrwPlugin = 1



"
" ctrlp
"
let g:ctrlp_map = 'p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 5
" Excluding version control directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

let g:ctrlp_prompt_mappings = {
\ 'PrtBS()':              ['<bs>', '<c-h>'],
\ 'PrtDelete()':          ['<del>', '<c-d>'],
\ 'PrtDeleteWord()':      ['<c-w>'],
\ 'PrtClear()':           ['<c-k>'],
\ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
\ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
\ 'PrtSelectMove("t")':   [''],
\ 'PrtSelectMove("b")':   [''],
\ 'PrtSelectMove("u")':   [''],
\ 'PrtSelectMove("d")':   [''],
\ 'PrtHistory(-1)':       [''],
\ 'PrtHistory(1)':        [''],
\ 'AcceptSelection("e")': ['<c-o>'],
\ 'AcceptSelection("h")': [''],
\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\ 'AcceptSelection("v")': [''],
\ 'ToggleFocus()':        [''],
\ 'ToggleRegex()':        ['<c-r>'],
\ 'ToggleByFname()':      ['<c-i>'],
\ 'ToggleType(1)':        ['<c-t>'],
\ 'ToggleType(-1)':       [''],
\ 'PrtExpandDir()':       ['<tab>'],
\ 'PrtInsert("c")':       ['<c-l>'],
\ 'PrtInsert()':          [''],
\ 'PrtCurStart()':        ['<c-a>'],
\ 'PrtCurEnd()':          ['<c-e>'],
\ 'PrtCurLeft()':         ['<c-b>', '<left>'],
\ 'PrtCurRight()':        ['<c-f>', '<right>'],
\ 'PrtClearCache()':      [''],
\ 'PrtDeleteEnt()':       [''],
\ 'CreateNewFile()':      [''],
\ 'MarkToOpen()':         [''],
\ 'OpenMulti()':          [''],
\ 'PrtExit()':            ['<esc>', '<c-c>'],
\ }



"
" vim-airline
"

" Themes - https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme="light"
"let g:airline_theme="solarized"



"
" Solarized
"
"let g:solarized_termcolors=256
"set background=light
"colorscheme solarized
