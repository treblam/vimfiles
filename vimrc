"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim to behave like windows applications
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim
"behave mswin

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings to solve the chinese error code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lang English_United States
"lang mes en
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
"Set the default encoding for new files in xp
if MySys() == 'xp'
  setglobal fileencoding=cp936
endif
"set fileencoding=utf-8
"au BufReadPost setlocal nobomb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM has to remember
set history=400

"Share windows clipboard
"set clipboard=unnamed 

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Current directory is always matching the content of the active window
set autochdir

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
map <leader>w :w!<cr>
vmap <leader>w :w!<cr>gv
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/vimfiles/vimrc<cr>
"Fast editing of .vimrc
map <leader>v :e! ~/vimfiles/vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/vimfiles/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable

if has("gui_running")
  "Hide the toolbar
  set guioptions-=T
  let psc_style='cool'

  "Highlight current
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333

  colorscheme oceandeep

  "Omni menu colors
  hi Pmenu guibg=#111111
  hi PmenuSel guibg=#ff00ff guifg=#ffffff

  "Maximize window on startup
  if has("gui_win32")
    au GUIEnter * simalt ~x
  endif

elseif
  set background=dark
  "colorscheme zellner
endif

if MySys() == 'win7'
  "Set font for win7
  set guifont=Consolas:h12
  set guifontwide=NSimsun:h12
elseif MySys() == 'xp'
  "Set font for xp
  set guifont=Courier_New:h10:cANSI
  set guifontwide=YaHei_Consolas_Hybrid:h10,NSimsun:h10
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
"map <leader>1 :set syntax=cheetah<cr>
"map <leader>2 :set syntax=xhtml<cr>
"map <leader>3 :set syntax=python<cr>
"map <leader>4 :set ft=javascript<cr>
"map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set scrolloff=7

"Turn on WiLd menu
set wildmenu

"Bash-like auto-complete style
"set wildmode=list:longest,full

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set number

"Do not redraw, when running macros.. lazyredraw
set lazyredraw

"Change buffer - without saving
set hidden

"Set backspace
set backspace=eol,start,indent

"Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Search options
set ignorecase
set smartcase
set incsearch
set hlsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set vb t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/jerry/', "~/", "g")
  return curdir
endfunction

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Space for page up/down
noremap <space> <c-f>
noremap <M-space> <c-b>

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"map <C-j> and <C-k> to gj and gk respectively
"noremap <C-k> gk
"noremap <C-j> gj

"Actually, the tab does not switch buffers, but my arrows
"Bclose function can be found in "Buffer related" section
nnoremap <silent> <Leader>bd :Bclose<CR>
"map <down> <leader>bd
"Use the arrows to something usefull
"map <right> :bn<cr>
"map <left> :bp<cr>

" Window movement
noremap <C-TAB> :bn<CR>
noremap <silent> <C-F4> :Bclose<CR>
noremap <S-C-TAB> :bp<CR>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=usetab
  set stal=1
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-4> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $1 ()<esc>:let leavechar=")"<cr>i
inoremap $2 []<esc>:let leavechar="]"<cr>i
inoremap $3 {}<esc>:let leavechar="}"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $q ''<esc>:let leavechar="'"<cr>i
inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Amir Salihefendic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
if MySys() == 'win7'
  cno $d e ~/Desktop/
elseif MySys() == 'xp'
  cno $d e ~/×ÀÃæ/
endif
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
"au FileType html,python,vim,javascript setl shiftwidth=2
"au FileType html,python,vim,javascript setl tabstop=2
"au FileType java setl shiftwidth=4
"au FileType java setl tabstop=4

set smarttab
set lbr
set tw=500

   """"""""""""""""""""""""""""""
   " Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set autoindent

   "Smart indet
   set smartindent

   "C-style indeting
   set cindent

   "Wrap lines
   set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """"""""""""""""""""""""""""""
   " Vim Grep
   """"""""""""""""""""""""""""""
   let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
   let Grep_Cygwin_Find = 1

   """"""""""""""""""""""""""""""
   " Yank Ring
   """"""""""""""""""""""""""""""
   map <leader>r :YRShow<cr>

   """"""""""""""""""""""""""""""
   " File explorer
   """"""""""""""""""""""""""""""
   "Split vertically
   let g:explVertical=1

   "Window size
   let g:explWinSize=35

   let g:explSplitLeft=1
   let g:explSplitBelow=1

   "Hide some files
   let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

   "Hide the help thing..
   let g:explDetailedHelp=0

   """"""""""""""""""""""""""""""
   " Minibuffer
   """"""""""""""""""""""""""""""
   "let g:miniBufExplMapWindowNavVim = 1 
   "let g:miniBufExplMapWindowNavArrows = 1 
   "let g:miniBufExplMapCTabSwitchBufs = 1 
   "let g:miniBufExplModSelTarget = 1 
   "let g:bufExplorerSortBy = "name"

   "autocmd BufRead,BufNew :call UMiniBufExplorer

   """"""""""""""""""""""""""""""
   " Tag list (ctags) 
   """"""""""""""""""""""""""""""
   if MySys() == 'win7'
     let Tlist_Ctags_Cmd=$HOME.'\vimfiles\ctags57\ctags.exe'
   elseif MySys() == 'xp'
     let Tlist_Ctags_Cmd='C:\Docume~1\Administrator\vimfiles\ctags57\ctags.exe'
   endif
   let Tlist_Sort_Type = "name"
   let Tlist_Show_Menu = 1
   "noremap <leader>t :Tlist<cr>

   """"""""""""""""""""""""""""""
   " Tag list (ctags) 
   """"""""""""""""""""""""""""""
   map <leader>t :NERDTree<cr>

   """"""""""""""""""""""""""""""
   " LaTeX Suite things
   """"""""""""""""""""""""""""""
   set grepprg=grep\ -nH\ $*
   let g:Tex_DefaultTargetFormat="pdf"
   let g:Tex_ViewRule_pdf='xpdf'

   "Bindings
   autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

   "Auto complete some things ;)
   autocmd FileType tex inoremap $i \indent
   autocmd FileType tex inoremap $* \cdot
   autocmd FileType tex inoremap $i \item
   autocmd FileType tex inoremap $m \[<cr>\]<esc>O

   """"""""""""""""""""""""""""""
   " JavaScript section
   """""""""""""""""""""""""""""""
   "au FileType javascript so ~/vimfiles/syntax/javascript.vim
   function! JavaScriptFold()
     setl foldmethod=syntax
     setl foldlevelstart=1
     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

     function! FoldText()
       return substitute(getline(v:foldstart), '{.*', '{...}', '')
     endfunction
     setl foldtext=FoldText()
   endfunction
   "au FileType javascript call JavaScriptFold()
   au FileType javascript setl fen

   au FileType javascript imap <c-t> console.log();<esc>hi
   au FileType javascript imap <c-a> alert();<esc>hi
   au FileType javascript setl nocindent
   au FileType javascript inoremap <buffer> $r return

   au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
   au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F4>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Copy,Past and Cut
inoremap <C-v> <esc>"+]p`]a
noremap <leader>y "+y
noremap <leader>yy "+yy
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>d "+d
noremap <leader>dd "+dd
noremap <leader>D "+D

"Select all
"map <leader>a <esc>ggVG
"Remove highlight
nmap <silent> <F3> :nohlsearch<CR>
