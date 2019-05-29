function! Include(filename)
    execute 'source ' .  $HOME . '/.vim/' . a:filename
endfunction

call Include('fkeys/tools.vim')
"call Include('fkeys/toolsmock.vim')

call Include('fkeys/mappings.vim')
"call Include('fkeys/mappingsall.vim')

call Include('fkeys/escseq-default.vim')

"viminfo+=n$HOME/.vim/viminfo
execute 'set viminfo+=n' .  $HOME . '/.vim/viminfo'

" Disable Ex Mode
nnoremap Q <nop>

" Don't create .netrwhist file
let g:netrw_dirhistmax = 0

" Restore screen contents after exit
"let &t_ti = "\<Esc>[?47h"
"let &t_te = "\<Esc>[?47l"

" Tabs
set expandtab
set tabstop=4
autocmd FileType make setlocal noexpandtab

" Syntax highlighting
syntax on             " Enable syntax HL'ing
colorscheme earthrise
match Todo /TODO:\|TODO\|FIXME\|FIXME:/ " Highlight all-caps TODO and FIXME
set showmatch         " Show matching brackets.

" Highlighting of search matches
set hlsearch
hi Search ctermbg=blue

" Highlight matching angle brackets
set mps+=<:>

" Highlight current line in dark grey
"set t_Co=256
set cursorline
hi CursorLine NONE ctermbg=233

" Highlight tabs and trailing whitespaces
highlight SpecialKey ctermfg=DarkGray ctermbg=233
set listchars=tab:>\ ,trail:\ 
set list

" Show (partial) command in status line.
set showcmd

" Remember last position in file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" Indent size
set shiftwidth=4

" Enable auto indent
set autoindent
filetype plugin indent on

" Keep selection when indenting in visual mode
vnoremap > >gv
vnoremap < <gv

" Disable auto-word-wrap
set tw=0


" Search
set ignorecase                  " Do case insensitive matching ...
set smartcase                   " ... but case sensitive when search term contains caps.
set incsearch                   " Incremental search


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" Set leader key to ","
let mapleader = ","

" <leader>r in visual mode: find & replace current selection
vnoremap <leader>r "sy:.,$s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

" <leader>cc and <leader>uc : (un)comment blocks of code.
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
autocmd FileType make             let b:comment_leader = '#'
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" paste without yanking selection
vnoremap <leader>p "_dP

" <leader>b in normal mode: type 4 backticks, put curor in middle of them
" and go to insert mode.
nnoremap <leader>b i````<Esc>hi

" <leader>b in visual mode: surround selection with double backticks
vnoremap <leader>b di````<Esc>hhpll

" <leader>= in normal mode: underline current line
nnoremap <leader>= yyp<S-v>r=
" <leader>- in normal mode: underline current line
nnoremap <leader>- yyp<S-v>r-

" Gracefully save buffer when receiving deadly signal
" Doesn't seem to work
autocmd VimLeavePre * if v:dying | execute "wa" | endif

" Disable code folding
set nofoldenable
