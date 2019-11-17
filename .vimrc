set nocompatible              " be iMproved, required

" Download vim-plug if not installed
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Shougo/neocomplete.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'ethereum/vim-solidity'
<<<<<<< Updated upstream
Plug 'exaatto/vim-sas'
Plug 'jceb/vim-orgmode'
=======
Plug 'iamcco/markdown-preview.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'vimwiki/vimwiki'

>>>>>>> Stashed changes

"Color Themes
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'marcopaganini/termschool-vim-theme'

" Initialize plugin system
call plug#end()

"PlugInstall
" 488 Class language syntax highlighting
"au BufNewFile,BufRead *.488 so ~/.vim/syntax/488.vim

"Mappings
map <A-Right> gt
map <A-Left> gT

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/Documents/vwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"AirlineTheme setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='tenderplus'

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
set mouse=a
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
set clipboard=unnamedplus
set background=dark    " Setting dark mode for gruvbox
colorscheme tender

"Clear background to keep transparent
"hi NonText ctermbg=none
"hi Normal ctermbg=none

"hi clear CursorLine
"augroup CLClear
"        autocmd! ColorScheme * hi clear CursorLine
"augroup END
"
"hi CursorLineNR cterm=bold
"augroup CLNRSet
"        autocmd! ColorScheme * hi CursorLineNR cterm=bold
"augroup END


function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

