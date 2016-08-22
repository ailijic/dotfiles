execute pathogen#infect()
syntax on
filetype plugin indent on


autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" Make sure color is set to 256 then set colors
set t_Co=256
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm
if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color tmux and GNU screen.
      " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
      set t_ut=
endif
" colorscheme C64

" Turn on autosave for vim
set updatetime=100
:au! CursorHoldI,CursorHold,BufLeave <buffer> silent! :update

" Set Local Leader key to <TAB>
let maplocalleader = "\t"
let g:niji_use_legacy_colours = 1

" tslime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'
" }}}

filetype plugin indent on
" show existing tab with 4 spaces width
 set tabstop=4
" " when indenting with '>', use 4 spaces width
 set shiftwidth=4
" " On pressing tab, insert 4 spaces
 set expandtab

 set number             " Show current line number
 set relativenumber     " Show relative line numbers
set linebreak           " When text wrap is on, lines do not wrap mid word
set wrap    " Turn on line wraping
set nolist  " list disables linebreak
set textwidth=0    " breaks the line after <X> num of chars
set wrapmargin=0    " breaks the line when within <X> chars of the right of screen
set breakindent
" set breakindentopt=shift:6
let &showbreak = '> '

" (for tmux) set it so that the cursor changes 
" shape when not in insert mode.
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Underline the current line
set cursorline
hi clear CursorLine
hi CursorLine cterm=underline gui=underline 

" allow inserting one character via <Space>
function! RepeatChar(char, count)
      return repeat(a:char, a:count)
endfunction
nnoremap <Space> :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <Space> :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Add powerline to vim
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Display statusline (0=>never, 1=>If 2+_windows, 2=>Always)
set laststatus=0

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
 set t_Co=256

 " Reduce time to switch between modes
 
" Use ctrl-tab & ctrl-shift-tab to switch between file buffers
nnoremap <C-Tab> :bn<CR> nnoremap <C-S-Tab> :bp<CR>

