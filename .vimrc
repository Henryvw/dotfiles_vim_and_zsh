"set nobackup
"The above set nobackup tells VIM not to save Swapfiles. If VIM is crashing I
"will now lose those files. I can also tell VIM to save them in a TMP
"directory somewhere. I have commented it out because without Swapfiles it
"appears that Ack no longer functions"
nmap <F8> :TagbarToggle<CR>
syntax on
"Puts debugging - 'wtf' command will add 90s and show the call stack. This is
"for debugging when you know WHERE the problem is but not how it's getting
"called.
nnoremap <C-e>wtf oputs "#" * 90<c-m>puts "Here's the callstack<c-m>"caller<c-m>puts "#" * 90<esc>
set number
execute pathogen#infect()
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

set tabstop=2
set shiftwidth=2
set expandtab
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_match_window = 'results:100' " overcome ctrl-p limit imposed by max height
let g:ctrlp_show_hidden = 1
let g:NERDTreeDirArrows=0
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let NERDTreeIgnore = ['\.swp$']
let NERDTreeShowHidden=1

syntax enable
colorscheme monokai
"Fix the goddamn monokai color problem where the nontext area has a different
"color than the text color. See below. It is color 235 (of 256 colors) and
"that is the same as the text background color. The highlight feature enables
"you to change colors for various segments of VIM.
highlight NonText ctermbg=233
highlight Normal ctermbg=233

"Backspace problems
:fixdel
set backspace=2
:let g:NERDTreeWinSize=22

"Put VIM cursor into the edit-window rather than having it appear in the
"NERDTree colum
autocmd VimEnter * wincmd p

set noswapfile

"Use Ag Silver Searcher with Ack, not sure how they interact but apparently
"useful"
let g:ackprg = 'ag --nogroup --nocolor --column'

"Speed up Ctrl-P by linking it to Ag somehow"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

"Solves Mac Vim problem of ^G appearing in Nerdtree
let g:NERDTreeNodeDelimiter = "\u00a0"
"Copy and Paste with the Clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set clipboard=unnamed
