

" F2 : save & browse current directory
"call Mapam('<F2>', ':update<CR>:e .<CR>')
"
"" F4 : Delete trailing whitespace on all lines
"" and replace all tabs with 4 spaces
""call Mapam('<F4>', 'ma:%s/\s\+$//ge<CR>:%s/\t/    /ge<CR>`a')
"call Mapam('<F4>', 'ma:%s/\s\+$//ge\|%s/\t/    /ge<CR>`a')
"
"" Shift+F4 : Clear buffer & go to insert mode
"call Mapam('<S-F4>', 'ggdGi')
"
"" F5 : increase height of current window
"call Mapam('<F5>', ':res +1<CR>')
"
"" Shift+F5 : decrease height of current window
"call Mapam('<S-F5>', ':res -1<CR>')






" F6 : goto to next error
"call Mapam('<F6>', ':update<CR>:cn<CR>zz')

" Shift-F6 : goto previous error
"call Mapam('<S-F6>', ':update<CR>:cp<CR>zz')

" F7 : make
"call Mapam('<F7>', ':make -k<CR>:cw<CR>')





" F10 : Clear highlight after search
"call Mapam('<F10>', ':noh<CR>')
"
"" F12 : save & continue
"call Mapam('<F12>', ':update<CR>')
"
"" Alt-F12 : save & exit
"call Mapam('<M-F12>', 'ZZ')
"
"" Ctrl-F12 : exit
"call Mapam('<C-F12>', 'ZQ')

" Shift-F12 : reload file
"call Mapam('<S-F12>', ':e!<CR>')

