" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tomasr/molokai'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'

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
" Put your non-Plugin stuff after this line

set t_Co=256
set history=1024
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab   
set smarttab
set softtabstop=4
 
set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.

set showmatch   
set mat=2
set hlsearch 
set incsearch 
set ignorecase  
 
set smartcase  
 
set backspace=eol,start,indent     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      
 
set textwidth=80   
 
set formatoptions=c,q,r
"set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)

set ruler 
 
set background=dark 
 
set mouse=a  

set whichwrap=b,s,<,>,[,]

set wrap
set smartindent
set cindent
set wildmenu
set hidden "Cambiar de buffer sin necesidad de guardarlo
syntax enable
"set spell spelllang=es
filetype plugin on
filetype plugin indent on

set cursorline
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox
"Para el tema molokai
"let g:molokai_original = 1
"let g:rehash256 = 0

"hi Normal ctermbg=none  "Para usar el mismo color de fondo que la terminal.
set guifont=Input\ 12

"Esto es para recordar la posición del cursor.
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"ESto es para guardar los dobleces.
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
set foldmethod=marker

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set laststatus=2
set noshowmode
"set showtabline=2

"Esto es para el tamaño de gvim
if has("gui_running")
    set lines=24 columns=80
endif

"Esto es para usar ranger como explorador de archivos:
function! RangerChooser()
let temp = tempname()
    if has("gui_running")
        exec 'silent !xterm -e "ranger --choosefiles=' . shellescape(temp) . '"'
        "exec 'silent !gnome-terminal -e "ranger --choosefiles=' . shellescape(temp) . '"'
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangerChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
"Esto es para Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"let g:lightline={
      "\ 'colorscheme': 'default', 
      "\ 'component': {
      "\   'readonly': '%{&readonly?"":""}',
      "\ },
      "\ 'separator': { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' }
      "\ }
      ""

let g:lightline={
      \ 'colorscheme': 'gruvbox', 
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '│', 'right': '│' }
      \ }
      "

""Símbolos raros para lightline
""┃ ┤ ┣ ┫ ├ ┊ ▙ ░ ▒ ▓ ▔▕ ▖▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ ▙ ╠ ╣

"Para que syntastic use python2 en vez del 3:
let g:syntastic_python_python_exec='/usr/bin/python2'
let g:syntastic_python_checkers='flake8'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_messages = {"regex": 'used but not defined'}

"Para Valloric/MatchTagAlways
let g:mta_filetypes = {'html' : 1,'xhtml' : 1,'xml' : 1,'jinja' : 1,'php' : 1}
let g:mta_use_matchparen_group = 1
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" MiniBufExpl Colors
hi MBENormal               guifg=#777777 guibg=bg
hi MBEChanged              guifg=#f7593e guibg=bg
hi MBEVisibleNormal        guifg=#2d2d2d guibg=#dedede
hi MBEVisibleChanged       guifg=#f7593e guibg=#dedede
hi MBEVisibleActiveNormal  guifg=#000000 guibg=#ffffff
hi MBEVisibleActiveChanged guifg=#f7593e guibg=#ffffff

"Para rainbow-parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
