" Load vimrc file
function! LoadDefaultVimrc()
    if filereadable($HOME . "/.vimrc")
        source ~/.vimrc
    elseif filereadable($HOME . "/.vim/vimrc")
        source ~/.vim/vimrc
    else
        echom "ERROR"
    endif
endfunction

"
function DoBashCommand(cmd)
    silent let retval = system(a:cmd)
endfunction

call LoadDefaultVimrc()

call Mapam('<F6>', ':call DoBashCommand("sendKeysToPane output F6")<CR>')
call Mapam('<S-F6>', ':call DoBashCommand("sendKeysToPane output S-F6")<CR>')
call Mapam('<M-F12>', ':call DoBashCommand("saveAndExitLo")<CR>')
call Mapam('<C-F12>', ':call DoBashCommand("exitLo")<CR>')
