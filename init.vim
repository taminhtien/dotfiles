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
" Plug 'flrnprz/candid.vim'
" Plug 'challenger-deep-theme/vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/vim-auto-save'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-endwise'
Plug 'mbbill/undotree'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-rhubarb'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './instalL --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'uarun/vim-protobuf'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'terryma/vim-smooth-scroll'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-cucumber'
Plug 'editorconfig/editorconfig-vim'
Plug 'fishbullet/deoplete-ruby'
Plug 'bkad/CamelCaseMotion'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'schickling/vim-bufon'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'zenbro/mirror.vim'
" Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/git-time-lapse'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bagrat/vim-buffet'
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
set tags=./tags;,tags;
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
call camelcasemotion#CreateMotionMappings('<leader>')
"========================================================
" CONFIG CLEVER F
"========================================================
let g:clever_f_across_no_line = 1
"========================================================
" CONFIG COC NVIM
"========================================================
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph']

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
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
      \   'left': [ ['mode', 'paste'], ['readonly', 'modified', 'gitbranch', 'filename'] ],
      \   'right': [ ['lineinfo'], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head',
      \   'percent': 'MyLightLinePercent',
      \   'lineinfo': 'MyLightLineLineInfo',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'modified': 'MyLightLineSignify'
      \ },
      \ }
let g:tcd_blacklist = '\v(cheat40|denite|gundo|help|nerdtree|netrw|peekaboo|quickmenu|startify|tagbar|undotree|unite|vimfiler|vimshell|fzf)'
function! LightlineFileformat()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? &ft : ''
endfunction
function! Devicon()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? (WebDevIconsGetFileTypeSymbol()) : ''
endfunction
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root && winwidth(0) > 40
    return &filetype !~# g:tcd_blacklist ? path[len(root)+1:] : ''
  elseif path[:len(root)-1] ==# root && winwidth(0) <= 40
    return &filetype !~# g:tcd_blacklist ? expand('%:t') : ''
  endif
  return &filetype !~# g:tcd_blacklist && winwidth(0) > 70 ? expand('%') : &filetype
endfunction
function! MyLightLinePercent()
  if &ft !~# g:tcd_blacklist && winwidth(0) > 70
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction
function! MyLightLineLineInfo()
  if &ft !~# g:tcd_blacklist
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction
function! MyLightLineSignify()
  let [added, modified, removed] = sy#repo#get_stats()
  let l:sy = ''
  for [flag, flagcount] in [
        \   [exists("g:signify_sign_add")?g:signify_sign_add:'+', added],
        \   [exists("g:signify_sign_delete")?g:signify_sign_delete:'-', removed],
        \   [exists("g:signify_sign_change")?g:signify_sign_change:'!', modified]
        \ ]
    if flagcount> 0
      let l:sy .= printf('%s%d', flag, flagcount)
    endif
  endfor
  if !empty(l:sy) && &ft !~# g:tcd_blacklist
    let l:sy = printf('[%s]', l:sy)
    let l:sy_vcs = get(b:sy, 'updated_by', '???')
    return printf('%s%s', l:sy_vcs, l:sy)
  else
    return ''
  endif
endfunction
"========================================================
" CONFIG MIRROR VIM
"========================================================
nnoremap <leader>mp :MirrorPush<CR>
nnoremap <leader>ml :MirrorPull<CR>
nnoremap <leader>md :MirrorDiff<CR>
nnoremap <leader>me :MirrorEdit<CR>
nnoremap <leader>mo :MirrorOpen<CR>
nnoremap <leader>ms :MirrorSSH<CR>
nnoremap <leader>mi :MirrorInfo<CR>
nnoremap <leader>mc :MirrorConfig<CR>
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
" map <F1> :call NERDTreeToggleAndFind()<cr>
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
" MAPPING EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" map / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" nmap <silent> <tab> <Plug>(easymotion-overwin-w)
"========================================================
" MAPPING VIMSMOOTHSCROLL
"========================================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"========================================================
" MAPPING EASYALIGN
"========================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
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
nnoremap <c-o> <ESC>:Tags<CR>
" nnoremap <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>
nnoremap <c-p> <ESC>:call fzf#vim#files('.')<CR>
nnoremap <c-g> <ESC>:Rg<space>
nnoremap <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), {'options': '--exact'})<cr>
nnoremap <silent> <leader>mm <ESC>:Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> K :call SearchWordWithRg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'
let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
" No need preview
" let g:fzf_preview_source=" --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
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
nnoremap <silent> <CR> <ESC>:noh<CR>
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>
" Navigation around windows
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>

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
let g:move_key_modifier = 'C'
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
" VIM AUTO SAVE
"========================================================
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

"========================================================
" MIGRATION OLD VIM CONFIGURATION
"========================================================
" map <C-o> :NERDTreeToggle<CR>

set cursorline
set nowrap
set title
set formatoptions=tcqronj

" Map keyboard for Vim Tab /vim-buffet
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
map <C-t> :tab split<CR>

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

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

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" Vim folding configuration
set foldmethod=indent
set foldlevelstart=20

" vim zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" Moving cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" vim key mapping
nmap <C-e> A<ESC>
nmap <C-i> I<ESC>

" Vim Surround customization
autocmd FileType ruby let b:surround_45 = "do \r end"

" Edit insert mode
inoremap jk <ESC>

" Map 0 to move cursor to first character of line
nmap 0 ^

