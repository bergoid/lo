" Function key mappings
function! Include(filename)
    execute 'source ' . a:filename
endfunction

" Allow character sequences like '<CR>' to be treated specially
set nocompatible

call Include($BEHOLD_DIR . '/ansi2key.vim')

" Map key to a sequence in all modes
function Mapam(key, sequence)
    let seq_esc = a:sequence
    execute 'nnoremap ' . a:key . ' ' . seq_esc
    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
    execute 'cnoremap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

" TEST
"call Mapam('<C-F12>', 'ZQ')

call Include($BEHOLD_DIR . '/ansi2key.vim')

" Disallow all editing
set nomodifiable

" Show as much as possible of last 'visible' line, even if it is
" too long to fit in the rest of the viewport
set display+=lastline

" Timer ID
let g:tailTimer=0

" Highlighting of search matches
set hlsearch
hi Search ctermbg=blue

" Highlight current line in dark grey
set cursorline
hi CursorLine NONE ctermbg=233

" Function definitions
" --------------------

" Map key to a sequence in all modes
"function MapKey(key, sequence)
"    let seq_esc = a:sequence
"    execute 'nnoremap ' . a:key . ' ' . seq_esc
""    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
"    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
"    execute 'cnoremap ' . a:key . ' <esc><esc>' . seq_esc
"endfunction

" Reload current file
function Reload(timer)
    silent e!
    normal G
endfunction

" Start tailing current file
function StartTailing()
    let g:tailTimer = timer_start(500, 'Reload', {'repeat':-1})
    set statusline=FOLLOWING
endfunction

" Stop tailing current file
function StopTailing()
    call timer_stop(g:tailTimer)
    set statusline=NOT_FOLLOWING
endfunction

"
function TestSearch()
    " A linenbr of 0 means nothing found
    let linenbr = search("^\/.*:", "W")
"    echom linenbr
endfunction

" Map keys to imitate 'less'
" --------------------------

" quit
"call MapKey('q', ':q!<CR>')
call Mapam('q', ':q!<CR>')

" follow
call Mapam('F', ':call StartTailing()<CR>')

" stop following
call Mapam('<C-c>', ':call StopTailing()<CR>')

" Test search
call Mapam('<F6>', ':call TestSearch()<CR>')

