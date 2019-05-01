
" Allow character sequences like '<CR>' to be treated specially
set nocompatible

" Disallow all editing
"set nomodifiable

" Timer ID
let g:tailTimer=0


" Function definitions
" --------------------

" Map key to a sequence in all modes
function MapKey(key, sequence)
    let seq_esc = a:sequence
    execute 'nnoremap ' . a:key . ' ' . seq_esc
"    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

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

" TEST
function TestFun()
    execute "normal OFOLLOW"
endfunction


" Map keys to imitate 'less'
" --------------------------

" quit
call MapKey('q', ':q!<CR>')

" follow
call MapKey('F', ':call StartTailing()<CR>')

" stop following
call MapKey('<C-c>', ':call StopTailing()<CR>')

