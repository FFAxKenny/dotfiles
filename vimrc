"	
"
"	Kenny Luong
"	Vim Configuration File
"
"

call pathogen#infect()
call pathogen#helptags()

syntax on
set bg=dark

""  Uncomment to enable 100 column red highlighting 
"match ErrorMsg '\%>100v.\+'

""  Set Paragraph options
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"" Turns on line numbers 
set number

""  Uncomment the following lines to enable syntax highlighting for
""  solarized gnome terminal
syntax enable
colorscheme solarized
se t_Co=16

""  To get syntax highlighting on SSH secure shell
"set term=ansi

""  Set other filetypes!
filetype on
au BufNewFile,BufRead *.ino set filetype=c
" Markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown

"" File specific commands
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile   *.html set ts=2 sw=2
autocmd BufRead,BufNewFile   *.php set ts=2 sw=2
autocmd BufRead,BufNewFile   Makefile set noexpandtab
autocmd BufRead,BufNewFile   makefile set noexpandtab

setl nosmartindent

set bs=2

""  
"" Begin Key configs
""
set pastetoggle=<f5>

" Set TagList to opoen on the left side
let Tlist_Use_Right_Window = 0

" Set Nerd Tree on the right side
let g:NERDTreeWinPos = "right"

" Use Nerd Tree Tabs Toggle, to enable nerdtree support across tabs
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>

" map ctrl+d to open a shell, so we can toggle between the two quickly!
noremap <C-d> :sh<cr>

" remap for easier window navigation!
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-H> <C-W>h<C-W>
map <C-L> <C-W>l<C-W>

" Set the terminal so we can have a transparent terminal in gnome
hi Normal ctermbg=none

" Turn on auto commenting
set formatoptions+=r

" Remap the sudow command to write to a file that needs root permission
" w !sudo tee % >/dev/null executes sudo and uses tee to redirect 
" to null so you don't see it
cnoremap sudow w !sudo tee % >/dev/null


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
