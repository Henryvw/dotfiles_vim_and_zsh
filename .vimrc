"Give Tagbar (plugin to show classes) a button
nmap <F8> :TagbarToggle<CR>
syntax on
autocmd vimenter * NERDTree
set number
execute pathogen#infect()
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
au VimEnter *  NERDTree
autocmd VimEnter * wincmd p
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
let NERDTreeShowHidden=1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_match_window = 'results:100' " overcome ctrl-p limit imposed by max height
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let NERDTreeIgnore = ['\.swp$']

set background=dark
" monokai options
let g:monokai_visibility = "high"
let g:monokai_contrast = "high"
let g:monokai_termcolors = 256
colorscheme monokai
