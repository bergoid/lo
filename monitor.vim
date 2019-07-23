" Map ANSI escape sequences to functions keys + modifier keys
execute 'source' . $PARENT_DIR . '/mappings.vim'

" Disable ruler
"set noshowmode
"set noruler
"set laststatus=0
"set noshowcmd

" Disallow all editing
"set nomodifiable

" Disable vim command-line
"nnoremap : <Nop>
"
" Disable some vim commands
"nnoremap i <Nop>

" Set leader key to ","
let mapleader = ","

" Show the argument string on the first line
function ShowString(str)
    execute 'normal ' . 'O' . a:str
endfunction

