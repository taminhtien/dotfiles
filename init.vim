" let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'
" Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

let mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'vim-ruby/vim-ruby'
Plug 'benmills/vimux'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-line'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './instalL --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'uarun/vim-protobuf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/git-time-lapse'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on
set ai
set autoread
set hidden
set ruler
set linespace=1
set wrap linebreak nolist
set breakindent
set nofoldenable
set tags=./tags;,tags;./git/tags;
set number
set autoindent
set clipboard=unnamedplus
set splitright
set splitbelow
set lazyredraw
set laststatus=2
set encoding=utf8
set background=light
colorscheme NeoSolarized
" highlight CocErrorHighlight ctermfg=Red guifg=#ff0000
" highlight CocWarningHighlight ctermfg=Brown guifg=#ff0000
set textwidth=0
set wrapmargin=0
set cc=80
set expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
set bs=2 tabstop=2 shiftwidth=2 softtabstop=2
set backupcopy=yes
set pastetoggle=<F2>
set noswapfile
set wildmenu
set wildmode=full
set hlsearch
set incsearch
set cursorline
set nowrap
set title
set formatoptions=tcqronj
set mouse=nicr
set smartindent
setlocal foldmethod=indent
set updatetime=300
set signcolumn=yes
set nobackup
set nowritebackup
set shortmess+=c
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set foldmethod=indent
set foldlevelstart=20
 set termguicolors
" Enabling the matchit plugin will enhance
" Vim’s built-in % command, making it possible to jump between pairs of
" Ruby keywords, such as class , module , def , if , do , and their
" corresponding end (as demonstrated in Part 1).
runtime macros/matchit.vim
set nocompatible
" "========================================================
" CONFIG VIM AIRLINE
"========================================================
let g:airline_extensions=['coc', 'branch']
"========================================================
" CONFIG ALE
"========================================================
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier'],
      \ 'python': ['black'],
      \ 'go': ['gofmt']
      \}
let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint'],
      \   'ruby': ['rubocop', 'ruby'],
      \   'go': ['golangci-lint', 'gofmt']
      \}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = '☢'
let g:ale_lint_on_text_changed="never"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 0
" python
let g:ale_python_pylint_options = '--load-plugins pylint_django'
highlight SignColumn guibg=255
map <silent> <leader>p <ESC>:ALEFix<CR>
"========================================================
" "========================================================
" CONFIG CLEVER F
"========================================================
let g:clever_f_across_no_line = 1
" "========================================================
" CONFIG VIM PROJECTIONIST
"========================================================
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }
"========================================================
" CONFIG COC NVIM
"========================================================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css', 'coc-html', 'coc-snippets', 'coc-solargraph' ]
" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction
"========================================================
" CONFIG SIGNIFY
"========================================================
let g:signify_vcs_list = ['git']
let g:signify_sign_show_count = 0
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '·'
let g:signify_sign_changedelete      = g:signify_sign_change
highlight SignifySignAdd guibg=255
highlight SignifySignDelete guibg=255
highlight SignifySignChange guibg=255
"=======================================================
" CONFIG NERDTree
"========================================================
map <silent> <leader>n <ESC>:NERDTreeToggle<CR>
map <silent> <F1> <ESC>:NERDTreeToggle<CR>
map <F1> :call NERDTreeToggleAndFind()<cr>
map <silent> <leader>rev :NERDTreeFind<CR>
let NERDTreeIgnore=['^node_modules']
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""
function! NERDTreeToggleAndFind()
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction
"========================================================
map <Leader>tn :TestNearest<CR>
map <Leader>tt :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>
"========================================================
" MAPPING FZF
"========================================================
" nnoremap <c-o> <ESC>:Tags<CR>
nnoremap <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>
nnoremap <leader>s <ESC>:Rg<space>
" nnoremap <c-f> <ESC>:Files<space>
" nnoremap <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), {'options': '--exact'})<cr>
" nnoremap <silent> <leader>mm <ESC>:Commands<CR>
" nnoremap <silent> <leader>? :History<CR>
" nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> K :call SearchWordWithRg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
" let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'
let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
" No need preview
let g:fzf_preview_source=" --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* SearchExactWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --color=always --glob "!{.git, node_modules}" '.shellescape(<q-args>), 1, <bang>0)
function! SearchWordWithRg()
  execute 'SearchExactWord' expand('<cword>')
endfunction
function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'SearchExactWord' selection
endfunction

" let g:fzf_prefer_tmux = 1
let g:fzf_layout = { 'down': '~100%' }
" let g:fzf_layout = { 'window': '10new' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"========================================================
" MISC MAPPING
"========================================================
" nnoremap <silent> <CR> <ESC>:noh<CR>
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'

" Copy file name / relative path / fullpath
nmap <silent> cprp :let @+=expand("%")<CR>
nmap <silent> cpfp :let @+ = expand("%:p")<CR>
nmap <silent> cpfn :let @+ = expand("%:t")<CR>
" Jump to reference file under cursor in split window
nnoremap gf :vertical wincmd f<CR>
" Open file
nnoremap <C-W><C-F> gf
"========================================================
" AUTOPAIR CONFIG
"========================================================
let g:AutoPairsMultilineClose = 0
"========================================================
" INDENT LINE CONFIG
"========================================================
let g:indentLine_char = '│'
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
"========================================================
" VIM TEST CONFIG
"========================================================
let test#strategy = "vimux"
"========================================================
" AUGROUP
"========================================================
  :augroup numbertoggle
  :  autocmd!
  :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  :augroup END

autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace
let g:netrw_localrmdir='rm -r'

" Copy to 'clipboard registry'
vmap <C-c> "*y
" Select all text
nmap <C-y> ggVG

" Duplicate everything selected
vmap D y'>p

" Remove search highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" vim zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" Moving cursor in insert mode
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>

" Vim Surround customization
autocmd FileType ruby let b:surround_45 = "do \r end"

" Edit insert mode
inoremap jk <ESC>

" Reloads $MYVIMRC
map <Leader>rv :so $MYVIMRC<cr>

" Edit Vim
nmap <leader>ve :vsplit $MYVIMRC<cr>

" Save all
nmap <leader>w :w<cr>
nmap <leader>e :q<cr>

" VIM RAILS MAPPING
nnoremap <leader>rm :Emigration<cr>
nnoremap <leader>rc :Econtroller<cr>
nnoremap <leader>a :A<cr>
" Enter command line mode
nnoremap <leader>rb <ESC>:!bundle<cr>

" Insert new line above
nnoremap <leader>k O<Esc>

" Insert new line below
nnoremap <leader>j o<Esc>

nnoremap <leader>i :PlugInstall<cr>

" Break line by comma
vnoremap bl :s/,/,\r/g<cr><C-p>

" Quick fix mappings
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>co :copen<Esc>
