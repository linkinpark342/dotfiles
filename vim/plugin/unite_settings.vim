if has('nvim')
    nnoremap <C-p> :Unite -start-insert file_rec/neovim<cr>
else
    nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
endif
nnoremap <Space>f :execute "Unite -input=" . expand("%:h") . "/ -start-insert file_rec/async"<cr>
"let g:unite_source_rec_max_cache_files = 20
let g:unite_source_rec_async_command =
    \ ['ag', '--follow', '--nocolor', '--nogroup',
    \  '--hidden', '-g', '']

nnoremap <Space>/ :Unite grep:.<cr>
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --vimgrep --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1
nnoremap <Space>y :Unite -quick-match history/yank<cr>
nnoremap <Space>b :Unite buffer<cr>
nnoremap <Space>l :Unite -start-insert line<cr>
nnoremap <Space>r :UniteResume<cr>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    imap <buffer> <C-j> <Plug>(unite_insert_leave)
    nmap <buffer> <C-j> <Plug>(unite_loop_cursor_down)
    nmap <buffer> <C-k> <Plug>(unite_loop_cursor_up)
    imap <buffer> <C-w>c <Esc><Plug>(unite_all_exit)
    nmap <buffer> <C-w>c <Plug>(unite_all_exit)
    imap <buffer> <C-c> <Esc><Plug>(unite_all_exit)
    nmap <buffer> <C-c> <Plug>(unite_all_exit)
endfunction
