" let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'
" Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

"=======================================================
" MAP LEADER KEY
let mapleader = "\<Space>"
"=======================================================

"=======================================================
" INSTALL PLUGINS
"========================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
" Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-projectionist'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'mbbill/undotree'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './instalL --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'uarun/vim-protobuf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'editorconfig/editorconfig-vim'
Plug 'fishbullet/deoplete-ruby'
" Plug 'bkad/CamelCaseMotion'
" Plug 'jeetsukumaran/vim-indentwise'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/git-time-lapse'
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
" set tags=./tags;,tags;./git/tags;
set number
set autoindent
set clipboard=unnamedplus
set splitright
set splitbelow
set lazyredraw
set laststatus=2
set encoding=utf8
" set background=light
set textwidth=0
set wrapmargin=0
set cc=80
set expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
set bs=2 tabstop=2 shiftwidth=2 softtabstop=2
set backupcopy=yes
set pastetoggle=<F2>
" autocomplete menu provided by zsh
set wildmenu
set wildmode=full
" Set up vim text object
" Enabling the matchit plugin will enhance
" Vim’s built-in % command, making it possible to jump between pairs of
" Ruby keywords, such as class , module , def , if , do , and their
" corresponding end (as demonstrated in Part 1).
runtime macros/matchit.vim
set nocompatible
" if has("autocmd")
"   filetype indent plugin on
" endif
""""""""""""""""
xnoremap p pgvy
setlocal foldmethod=indent
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
colorscheme tender
" Make comment italic
" highlight Comment gui=italic
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
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 0
" python
let g:ale_python_pylint_options = '--load-plugins pylint_django'
highlight SignColumn guibg=255
"========================================================
" CONFIG CAMELCASE MOTION
"========================================================
" call camelcasemotion#CreateMotionMappings('<leader>')
"========================================================
" CONFIG VIM EASYMOTION
"========================================================
" function! s:incsearch_config(...) abort
"   return incsearch#util#deepextend(deepcopy({
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {
"   \     "\<CR>": '<Over>(easymotion)'
"   \   },
"   \   'is_expr': 0
"   \ }), get(a:, 1, {}))
" endfunction
"
" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_smartcase = 1
" nmap <silent> ;; <Plug>(easymotion-overwin-f)
" nmap <silent> ;l <Plug>(easymotion-overwin-line)
" map / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" nmap <silent> <tab> <Plug>(easymotion-overwin-w)
"========================================================
" CONFIG INCSEARCH
"========================================================
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
"========================================================
" CONFIG CLEVER F
"========================================================
let g:clever_f_across_no_line = 1
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
"========================================================
" CONFIG AUTO PAIRS
"========================================================
let g:AutoPairsShortcutFastWrap = '<C->>'
let g:AutoPairsShortcutBakkInsert = '<C-<>'
let g:AutoPairsFlyMode = 0
"========================================================
" CONFIG COC NVIM
"========================================================
set updatetime=300
" https://stackoverflow.com/questions/19580157/to-hide-user-defined-completion-message-at-vim
set shortmess+=c

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

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> cs <Plug>(coc-search)
nnoremap <silent> sd :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `:Format` for format current buffer
" command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" function! StatusDiagnostic() abort
"   let info = get(b:, 'coc_diagnostic_info', {})
"   if empty(info) | return '' | endif
"   let msgs = []
"   if get(info, 'error', 0)
"     call add(msgs, 'E' . info['error'])
"   endif
"   if get(info, 'warning', 0)
"     call add(msgs, 'W' . info['warning'])
"   endif
"   return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
" endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{StatusDiagnostic()}
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"========================================================
" CONFIG DEOPLETE
"========================================================
set completeopt+=noselect
let g:deoplete#enable_at_startup = 0
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:is_whitespace() "{{{
  let col = col('.') - 1
  return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
"
"========================================================
" CONFIG LIGHTLINE
"========================================================
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ ['fileicon'], [ 'cocstatus' ], [ 'filename' ] ],
      \   'right': [ [ 'icongitbranch' ], [ 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [], ['fileicon'], [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \ },
      \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:tcd_blacklist = '\v(cheat40|denite|gundo|help|nerdtree|netrw|peekaboo|quickmenu|startify|tagbar|undotree|unite|vimfiler|vimshell|fzf)'

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
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
"========================================================
" MAPPING ALE
"========================================================
map <silent> <leader>p <ESC>:ALEFix<CR>
"=======================================================
" MAPPING NERDTree
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
function! NERDTreeToggleAndFind()
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction
"========================================================
" MAPPING RSPEC VIMTEST
"========================================================
map <Leader>tn :TestNearest<CR>
map <Leader>tt :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
" let test#ruby#rspec#executable = 'rspec'
"========================================================
" MAPPING FZF
"========================================================
" nnoremap <c-o> <ESC>:Tags<CR>
nnoremap <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>
nnoremap <c-g> <ESC>:Rg<space>
nnoremap <c-f> <ESC>:Files<space>
" nnoremap <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), {'options': '--exact'})<cr>
nnoremap <silent> <leader>mm <ESC>:Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>A :Windows<CR>
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

let g:fzf_prefer_tmux = 1
" let g:fzf_layout = { 'down': '~100%' }
" let g:fzf_layout = { 'window': '10new' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"========================================================
" MISC MAPPING
"========================================================
map <silent> <leader>urt <ESC>:call URT()<CR>
map <silent> <leader>uet <ESC>:call UET()<CR>
" nnoremap <silent> <CR> <ESC>:noh<CR>
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'

map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>i <ESC>:call IndentGuideToggle()<CR>
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> ^ (v:count == 0 ? 'g^' : '^')
noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '^')
nmap <silent> <leader>t :TagbarToggle<CR>
if has("nvim")
  tnoremap <c-e> <C-\><C-n>
end
" Copy file name / relative path / fullpath
nmap <silent> cprp :let @+=expand("%")<CR>
nmap <silent> cpfp :let @+ = expand("%:p")<CR>
nmap <silent> cpfn :let @+ = expand("%:t")<CR>
" Jump to reference file under cursor in split window
nnoremap gf :vertical wincmd f<CR>
nnoremap <C-W><C-F> gf
"========================================================
" MISC CONFIG
"========================================================
"Autopair
let g:AutoPairsMultilineClose = 0
" Indentline
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
" Rpsec vimtest config
let test#strategy = "vimux"
let g:VimuxUseNearest = 0
" Vim move
" let g:move_key_modifier = 'C'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.eex,*.html.erb"
"========================================================
" Misc Functions
"========================================================
" Update ruby ctags
function! URT()
  return system('ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)')
endfunction
function! UET()
  return system('ctags -R --languages=elixir --exclude=.git --exclude=log .')
endfunction
" Toogle indents
function! IndentGuideToggle()
  let g:indent_guide_displayed = get(g:, 'indent_guide_displayed', '0')
  if g:indent_guide_displayed=='0'
    let g:indent_guide_displayed = '1'
    execute 'IndentLinesEnable'
    set colorcolumn=+1
  else
    let g:indent_guide_displayed = '0'
    execute 'IndentLinesDisable'
    set colorcolumn=0
  endif
endfunction
"========================================================
" AUGROUP
"========================================================
  :augroup numbertoggle
  :  autocmd!
  :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  :augroup END

"========================================================
" MIGRATION OLD VIM CONFIGURATION
"========================================================
" map <C-o> :NERDTreeToggle<CR>

set cursorline
set nowrap
set title
set formatoptions=tcqronj

" Map keyboard for Vim Tab /vim-buffet
" noremap <Tab> :bn<CR>
" noremap <S-Tab> :bp<CR>
" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bw!<CR>
" map <C-t> :tab split<CR>

" function! g:BuffetSetCustomColors()
"     hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
" endfunction
" let g:buffet_powerline_separators = 1
" let g:buffet_tab_icon = "\uf00a"
" let g:buffet_left_trunc_icon = "\uf0a8"
" let g:buffet_right_trunc_icon = "\uf0a9"

" mouse interractive
set mouse=nicr
set smartindent
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace
let g:netrw_localrmdir='rm -r'
filetype plugin indent on

nnoremap Jn i<CR><ESC>

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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" Vim folding configuration
set foldmethod=indent
set foldlevelstart=20

" vim zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" I don't use recording, don't judge me
" map q <Nop>

" Moving cursor in insert mode
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>

" vim key mapping
nmap <C-e> A<ESC>
nmap <C-i> I<ESC>

" Vim Surround customization
autocmd FileType ruby let b:surround_45 = "do \r end"

" Edit insert mode
inoremap jk <ESC>

" Map 0 to move cursor to first character of line
nmap 0 ^

" Reloads $MYVIMRC
map <Leader>r :so $MYVIMRC<cr>

" Edit Vim
nmap <leader>ve :vsplit $MYVIMRC<cr>

" Save all
nmap <leader>w :wa<cr>
nmap <leader>e :q<cr>

" VIM RAILS MAPPING
nnoremap <leader>rm :Emigration<cr>
nnoremap <leader>rc :Econtroller<cr>

" Insert new line above
nnoremap <leader>k O<Esc>
" Insert new line below
nnoremap <leader>j o<Esc>
" Open relative file
nnoremap <leader>or :e %:h<cr>
nnoremap <leader>i :PlugInstall<cr>
