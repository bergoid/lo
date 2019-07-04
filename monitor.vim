" Key mappings
function! Include(filename)
    execute 'source ' . a:filename
endfunction

call Include($PARENT_DIR . '/mappings.vim')

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

" <leader>r in normal mode
"execute 'nnoremap <leader>r' . ' ' . 'Oabc<Esc>'
"call Mapam('<leader>k', 'Oabc<Esc>')

" Stop tailing current file
function ShowString(str)
    execute 'normal ' . 'O' . a:str
endfunction

nnoremap <leader>k :call ShowString(input(""))<CR>

