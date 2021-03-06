""""""""""""""""""""""""""""""
"          VIMPLUG           "
""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs',          { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim',               { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'juancampa/solvent.vim'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'derekwyatt/vim-scala'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'elmcast/elm-vim'
Plug 'keith/swift.vim'
Plug 'idris-hackers/idris-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/echodoc.vim'
Plug 'reasonml-editor/vim-reason'
Plug 'raichoo/purescript-vim'
Plug 'joshhartigan/vim-reddit'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

syntax enable
filetype plugin indent on
colorscheme onedark


if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

inoremap jj <Esc>
inoremap kkk <Esc>
set timeoutlen=1000 ttimeoutlen=0

set autoindent
set expandtab
set ts=2
set shiftwidth=2
set shiftround
set nowrap

set ignorecase
set smartcase
set ruler
set cursorline

set number
set relativenumber

set hlsearch
set showmatch

set splitbelow
set splitright

set pastetoggle=<F2>
map <F7> mzgg=G`z

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let mapleader = ","

set mouse-=a

" Autoformat document                                                                                                                     
nnoremap F gg=G''

""""""""""""""""""""""""""""""
"          Undo              "
""""""""""""""""""""""""""""""
set undodir=~/.config/nvim/undodir
set undofile

""""""""""""""""""""""""""""""
"         AIRLINE            "
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""
"          Multiple          "
""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

""""""""""""""""""""""""""""""
"          Deoplete          "
""""""""""""""""""""""""""""""
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes.js = 'jsx'
let g:context_filetype#same_filetypes.jsx = 'js'
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" ultisnips for Deoplete
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""
"          MARKDOWN          "
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""""""""""""""
"          VCXPROJ           "
""""""""""""""""""""""""""""""

let g:context_filetype#same_filetypes.vcxproj = 'xml'
let g:context_filetype#same_filetypes.vcxproj = 'xml'

""""""""""""""""""""""""""""""
"          PYTHON            "
""""""""""""""""""""""""""""""
let python_highlight_all = 1
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
autocmd BufNewFile,BufRead *.py :setlocal sw=4 ts=4 sts=4

""""""""""""""""""""""""""""""
"          JAVASCRIPT        "
""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

""""""""""""""""""""""""""""""
"          HTML              "
""""""""""""""""""""""""""""""
set matchpairs+=<:>
let g:html_indent_tags = 'li\|p'

""""""""""""""""""""""""""""""
"          TABS              "
""""""""""""""""""""""""""""""
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tt :tabnew<CR>

""""""""""""""""""""""""""""""
"          CTRLP             "
""""""""""""""""""""""""""""""
" let g:ctrlp_map = '<c-n>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


""""""""""""""""""""""""""""""
"          TMUX              "
""""""""""""""""""""""""""""""
" See Dylan

""""""""""""""""""""""""""""""
"          HASKELL           "
""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
