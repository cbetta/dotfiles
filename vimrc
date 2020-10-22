call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'ntpeters/vim-better-whitespace'

"" Theming and UI tweaks
Plug 'altercation/vim-colors-solarized'
Plug 'dantoml/fairyfloss.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" Autocomplete
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'

" Focus Mode
Plug 'junegunn/goyo.vim'

call plug#end()

" Settings
syntax enable                  " Editing without highlighting is sadness
set ruler                      " Because some people make lists like this
set noerrorbells               " please don't make noises
set backspace=indent,eol,start " Makes backspace more useful
set noswapfile                 " I like to live dangerously
set nobackup                   " Very dangerously in fact
set nowritebackup
set number

set wrap linebreak nolist
" set colorcolumn=80
set cursorline
set numberwidth=6

set splitright
set splitbelow
set encoding=utf-8
set autowrite                  " Autosave before :make/:test etc
au FocusLost * :wa             " Set vim to save the file on focus out.

set hlsearch                   " Highlight found searches
set incsearch                  " Show matches whilst typing

set tabstop=2                 " Use 2 spaces to a tab
set shiftwidth=2              " As above
set expandtab                 " Expand tabs into spaces

set mouse=a
set laststatus=2              " Airline, Required to work without splits.

set gcr=a:blinkon0            " Disable the blinking cursor.
set scrolloff=3

" Nobody is happy until they have these
cnoreabbrev W w
cnoreabbrev X x
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" NERDTree configuration
let g:NERDTreeShowHidden=1
noremap <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"
" CtrlP
"

" If ripgrep is installed, use it, as it is /fast/.
if executable('rg')
  " Use rg instead of grep
  set grepprg=rg\ --column\ --color=never

  " Use rg for ctrlp for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
else
  " This ignores the `.git` directory and submodules by default
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

"
" Clipboard Support
"
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif

"
" Ctrl-S to save
"
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

"
" Crtl-W support
"
inoremap <c-w> <c-o>:q!<CR>
nnoremap <silent> <C-W> :<C-u>:q!<CR>

