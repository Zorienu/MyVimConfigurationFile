set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set relativenumber
set laststatus=2
set cursorline
set noshowmode
set sw=2

call plug#begin('~/.config/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

call plug#end()

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_transparent_bg = "1"
:let g:airline_theme = 'gruvbox'

let NERDTreeQuitOnOpen=1

let mapleader=" " " leader key

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" enable Ctrl + space to show coc suggestions
inoremap <silent><expr><C-space> coc#refresh()

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
