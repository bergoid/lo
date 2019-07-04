
" Function key mappings

" Map key to a sequence in all modes
function! Mapam(key, sequence)
    let seq_esc = a:sequence
    execute 'nnoremap ' . a:key . ' ' . seq_esc
    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
    execute 'cnoremap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

"" Recursively map key to a sequence in all modes
function! RMapam(key, sequence)
        let seq_esc = a:sequence
        execute 'nmap ' . a:key . ' ' . seq_esc
        execute 'imap ' . a:key . ' <esc>' . seq_esc
        execute 'vmap ' . a:key . ' <esc><esc>' . seq_esc
        execute 'cmap ' . a:key . ' <esc><esc>' . seq_esc
endfunction
