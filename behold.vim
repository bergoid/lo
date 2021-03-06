" Map ANSI escape sequences to functions keys + modifier keys
execute 'source' . $PARENT_DIR . '/mappings.vim'

" Disallow all editing
set nomodifiable

" Show as much as possible of last 'visible' line, even if it is
" too long to fit in the rest of the viewport
set display+=lastline

" Timer ID
let g:tailTimer=0

" Highlighting of search matches
set hlsearch
"hi Search ctermbg=blue
hi Search ctermbg=17

" Highlight current line in dark grey
set cursorline
hi CursorLine NONE ctermbg=233

" Imitate the behaviour of 'less' somewhat
" ----------------------------------------

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
    " BEGIN TESTCODE
    silent let b=system('logMessage StopTailing')
    " END TESTCODE
    call timer_stop(g:tailTimer)
    set statusline=NOT_FOLLOWING
endfunction

" quit
call Mapam('q', ':q!<CR>')

" follow
call Mapam('F', ':call StartTailing()<CR>')

" stop following
call Mapam('<C-c>', ':call StopTailing()<CR>')


" Search for lines with path:line:col info
" ----------------------------------------

"
let queryPalico = '^\(\/.\{-}\):\([0-9]\{-}\)\?:\([0-9]\{-}\)\?:'
let queryLine = '^\/.\{-}:'

"
function SearchPalico(dir)
    let flags = "W" . a:dir
    " A line number of 0 means no match found
    let linenbr_matched = search(g:queryLine, flags)
    if linenbr_matched > 0
        let palicoList = matchlist(getline(linenbr_matched), g:queryPalico)
        let path = palicoList[1]
        let line = str2nr(palicoList[2])
        let column = str2nr(palicoList[3])

        " Send vim command to other panel
        silent let retval = system('gotoPalico ' . path . ' ' . line . ' ' . column)
    endif
endfunction

"
"function SendString(str)
"    " BEGIN TESTCODE
""    silent let b=system('logMessage ' . a:str)
"    " END TESTCODE
"
"    silent let a=system('sendStringToMonitor ' . a:str)
"endfunction

" Mappings
call Mapam('<F6>', ':call SearchPalico("")<CR>')
call Mapam('<S-F6>', ':call SearchPalico("b")<CR>')
