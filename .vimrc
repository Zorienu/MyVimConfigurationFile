set nocompatible
set number
set mouse=a
set numberwidth=2
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set laststatus=2
set cursorline
set noshowmode
set sw=3
set cindent
set nohlsearch " no highlight the search forever
set scrolloff=8
" set C-v to paste
inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia

"scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
let g:polyglot_disabled = ['markdown']

call plug#begin('~/.config/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'

call plug#end()


let g:coc_node_path = '/usr/local/bin/node'

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_transparent_bg = "1"

" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline = 0

let mapleader=" " " leader key

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap + <Plug>NERDCommenterToggle
nmap + <Plug>NERDCommenterToggle


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show coc documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-emmet']

" enable Ctrl + space to show coc suggestions
inoremap <silent><expr><C-space> coc#refresh()

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t :NERDTreeFind<CR>
nmap <Leader>r :NERDTreeToggle<CR>
nmap <F5> :NERDTreeRefreshRoot<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" emmet vim
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" polyglot
let g:polyglot_disabled = ['autoindent']

":set hidden


