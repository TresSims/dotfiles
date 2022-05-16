vim.cmd([[

function s:commands()
        return [
        \ {'line': 'Open Project', 'cmd': 'Telescope project'},
        \ {'line': 'File Browser ', 'cmd': 'Telescope file_browser'},
        \ ]
endfunction
        

let g:startify_lists = [
\ { 'header': ['   Telescope'],            'type': function('s:commands') },
\ { 'header': ['   Sessions'],       'type': 'sessions' },
\ { 'header': ['   Recent Files'],       'type': 'files' },
\ ]

]])
