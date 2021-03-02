let mapleader=','
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'yggdroot/leaderf'
call plug#end()

" Coc extentions
let g:coc_global_extensions = [
  \ 'coc-html', 
  \ 'coc-eslint',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ 'coc-vetur',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-vimlsp',
  \ 'coc-translator',
  \ 'coc-snippets',
  \ 'coc-angular',
  \ 'coc-html-css-support',
  \ 'coc-xml',
  \ 'coc-highlight',
  \ 'coc-cssmodules',
  \ 'coc-calc',
  \ 'coc-emmet',
  \ 'coc-powershell'
  \]

" === add these contents to the CocConfig
"{
 "eslint.autoFixOnSave": true,
 "coc.preferences.extensionUpdateCheck": "daily",
 "prettier.eslintIntegration": true
"}
" === end of CocConfig

" prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Prettier<CR>

" leaderf config
let g:Lf_WildIgnore = {
  \ 'dir': ['.svn','.git','.vscode','node_modules','dist','.idea'],
  \ 'file': ['.DS_Store','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
  \}

" Coc configurations
set hidden
set updatetime=100
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" nerdtree configurations
let NERDTreeShowHidden=1

set number
syntax enable
colorscheme gruvbox
set background=dark
set hlsearch
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab

if v:vim_did_enter
  execute('AirlineTheme bubblegum')
else
  au VimEnter * execute('AirlineTheme bubblegum')
endif

" mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap ss <Plug>(easymotion-s2)

nnoremap <leader>v :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <C-p> :Leaderf file<CR>
nnoremap <leader>t :CocCommand translator.popup<CR>
nnoremap <leader>ps :terminal powershell<CR>
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
