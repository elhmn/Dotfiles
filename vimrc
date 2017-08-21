" vim:      set fenc=utf-8 ft=vim fdm=marker fmr={{{,}}}:
" file:     ~/.vimrc
" author:   Thomas Ruoff (with the help of a myriad others)

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'L9'
Plug 'unimpaired.vim'
Plug 'surround.vim'
Plug 'Align'
Plug 'Raimondi/delimitMate'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-projectionist'

Plug 'maralla/completor.vim', { 'do': 'make js'}

Plug 'ludovicchabant/vim-gutentags'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/conflict-marker.vim'
Plug 'airblade/vim-gitgutter'

Plug 'inside/vim-search-pulse'

Plug 'itchyny/lightline.vim'

Plug 'morhetz/gruvbox'

Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'

Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-grepper'

Plug 'sheerun/vim-polyglot'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tweekmonster/startuptime.vim'

" Investigate on custom text object, seems really usefull
" Plug 'kana/vim-textobj-user'
" Plug 'jceb/vim-textobj-uri' | Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-user'

call plug#end()
" }}}

" Basics {{{
set nocompatible

set hidden
set ttyfast
set synmaxcol=512
set modeline
set nobackup
set noswapfile

set mouse=a
set mousehide

set wildmode=list:longest,full
set wildignore+=*.swp,*.bak,*.jpg,*.gif,*.png,*.git,

set splitright
set splitbelow

" set ignorecase
set infercase
set smartcase
set hlsearch

set gdefault

set number
set report=0

set showcmd
set showmatch

set spell
set spellcapcheck=
set complete+=kspell

"" netrw
let g:netrw_liststyle = 1
let g:netrw_sizestyle = "H"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 1
"let g:netrw_banner = 0


" }}}

" Local .vimrc {{{
set exrc
set secure
" }}}

" Text Formatting {{{
set list
set breakindent

set showbreak=↳
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=79
set colorcolumn=80
set nojoinspaces
" }}}

" Folding {{{
set foldmethod=indent
set foldlevelstart=5
" }}}

" Diff settings {{{
set fillchars+=diff:⣿
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
" }}}

" {{{ Undo
set undodir=~/.vim/undos,/tmp
set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Visual Setting {{{
"
set background=dark
set cursorline
colorscheme gruvbox

set number
if exists('+relativenumber')
  set relativenumber
endif
" }}}

" GUI Settings {{{
if has("gui_running")
  "disable menu, toolsbar, scrollbar
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif
" }}}

" Key mappings {{{

let mapleader=','
let maplocalleader=','

"" fast escaping
inoremap jj <ESC>

"" fast editing
nnoremap <leader>e :e<space>

"" fast saving
nnoremap <leader>w :update<cr>

"" remove hightlighting
nnoremap <leader><space> :nohls <cr>

"" fast window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" open next,prev buffer, cycle
noremap <leader>. :bn<cr>
noremap <leader>m :bp<cr>
noremap <leader>: :b#<cr>

"" delete buffer
noremap <leader>bd :bd<cr>

"" indent visual selected code without unselecting and going back to normal mode
vnoremap > >gv
vnoremap < <gv

"" allow using . with visual mode
vnoremap . :norm.<cr>

"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" pull word under cursor into lhs of a substitute (for quick search and replace)
nnoremap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

"" fast editing of the .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>

"" turn on spell checking
noremap <leader>spl :setlocal spell!<cr>
"" spell checking shortcuts
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

"" toggle states
nnoremap <silent> <leader>hh :set invhlsearch<CR>
nnoremap <silent> <leader>ll :set invlist<CR>
nnoremap <silent> <leader>pp :set invpaste<CR>

nnoremap <silent> <leader>nn :set invnumber<CR>
nnoremap <silent> <leader>ii :set invrelativenumber<CR>

"" <Leader>0: Run the visually selected code in node and replace it with the output
vnoremap <silent> <Leader>0 :!node<cr>

" debugging, use leader-DD to start, do a slow action, then leader-DQ to
" finish. Your output will be in profile.log
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

"" abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

iab xnow <c-r>=strftime("%Y-%m-%d %H:%M")<cr>
" }}}

" Plugin Configuration {{{

"" editorconfig
let g:EditorConfig_core_mode = 'python_external'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" gutentags

let g:gutentags_cache_dir="~/.tags"
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }

"" fzf
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>FF :Files<cr>
vnoremap <leader>ff y:Files <c-r>"<cr>
nnoremap <leader>aa :Ag<space>
vnoremap <leader>aa y:Ag <c-r>"<cr>
nnoremap <leader>AA :Ag <c-r><c-w><cr>
nnoremap <leader>cc :Commits<cr>
nnoremap <leader>hf :History<cr>
nnoremap <leader>hc :History<cr>
nnoremap <leader>h/ :History<cr>

"" minibufexpl
map <Leader>t :MBEToggle<cr>

"" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" lightline
if filereadable(expand("~/.vim/lightline.vim"))
    source ~/.vim/lightline.vim
    augroup ale-statusline
        autocmd!
        autocmd User ALELint call lightline#update()
    augroup END
endif

"" Unimpaired
"" bubble single lines
nnoremap <leader>k [e
nnoremap <leader>j ]e
"" bubble multiple lines
vnoremap <leader>k [egv
vnoremap <leader>j ]egv

"" Indent Guides
nnoremap <leader>g :IndentGuidesToggle<CR>

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
nnoremap <leader>lp :InstantMarkdownPreview<CR>

" Tex
let g:tex_flavor = "latex"
let g:livepreview_previewer = 'zathura'

" markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'javascript', 'js=javascript', 'json=javascript'
      \ ]

" vim-jsx
let g:jsx_ext_required = 0

" }}}

" Autocmd Rules {{{

"" do syntax highlight syncing from start
augroup general
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

"" txt, mail, tex
augroup text
    autocmd!
    autocmd FileType text,markdown,mail,tex set wrap wm=2 nocindent spell
augroup END

"" Python
augroup python
    autocmd FileType python set noexpandtab
augroup END

"" JavaScript
augroup web
    autocmd!
    autocmd FileType javascript map <leader>r <esc>:TernRename<CR>
    autocmd BufRead,BufNewFile *.json set ft=json
    autocmd BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache
augroup END

" }}}

