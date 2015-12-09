set nocompatible " Required
filetype off

set textwidth=78
set formatoptions=1

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Core
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
" Plugin 'Lokaltog/powerline'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-dispatch'
" Plugin 'benmills/vimux' "just like vim-dispatch but tied to tmux

"Editing tweaks
" Plugin 'drmingdrmer/xptemplate'
" Plugin 'paradigm/vim-multicursor'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'

"Project
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/funcoo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rizzatti/dash.vim'
" Plugin 'wincent/Command-T'
" Plugin 'jgdavey/vim-turbux' "Commenting out since this maps <Leader>t in
" non-ruby files

"Source control
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"use this with airline?
let g:airline#extensions#branch#enabled = 1

"Multi-language (programming languages)
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets' "These are just snippets for ultisnips. no other purpose
" Plugin 'tomtom/tcomment_vim'

"JS
        "NOTE! Tern requires that you call 'npm install' inside its Plugin dir
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'

"CPP and Go
" TODO: find a non-crappy go plugin. All of them fail in ways that make me
" ragequit to sublime on a regular basis.
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'Blackrush/vim-gocode'
Plugin 'fatih/vim-go'
" Plugin 'nsf/gocode', {'rtp': 'vim/'}

"Clojure
" Plugin 'vim-scripts/foldsearch'
" Plugin 'tpope/vim-classpath'
" Plugin 'tpope/vim-fireplace'
" Plugin 'guns/vim-clojure-static'
" Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'vim-scripts/paredit.vim'

"""""""""""""""""""""""""End Plugins

call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme Monokai
"colorscheme lily "good for .Net at times
colorscheme grb256

let g:clojure_align_multiline_strings = 1

syntax on

let g:syntastic_javascript_checkers = ['jsxhint']

set backspace=indent,eol,start " make backspace a more flexible
set ruler
set co=120
set scrolloff=3
set history=200
set ignorecase "thas right... no case

let baan_fold=1
set foldmethod=indent   "fold based on indent
set foldnestmax=5      "deepest fold is 10 levels
set foldminlines=3
"set nofoldenable        "dont fold by default
"set foldmethod=marker " Fold on the marker
set foldlevel=2 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
function! SimpleFoldText()
    return getline(v:foldstart).' '
endfunction
"set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)

set nowrap
set sts=4
set ts=4
set sw=4
set et
set fen
set ai
set si
set cin

let g:multicursor_quit = "<Esc>"
"
"attempt to fix up multi-cursor. This map fails so I'm commenting out till I
"have time to fix it:
"xnoremap <Leader>` "*y<Esc>:call MultiCursorSearch('<c-r>=substitute(escape(@*, '\/.*$^~[]'), "\n", '\\n', "g")<cr>')<cr>

"""""""""""""""""""""""""""""""""""""
"from github nvie/vimrc

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" End of yanking from nvie/vimrc """"""""""""""""""""""""""""""""""""

fun! ScratchMarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfun

if has( "autocmd" )
    au FileType go setlocal nocindent
    au FileType md setlocal nocindent
    au FileType yaml setlocal ts=2 sts=2 sw=2 et
    au FileType sls setlocal ts=2 sts=2 sw=2 et
    au FileType yml setlocal ts=2 sts=2 sw=2 et
    au FileType jade setlocal ts=2 sts=2 sw=2 et
    au FileType clojure RainbowParenthesesLoadRound
endif

fun! ToggleNERDTree() "{{{
    if !exists("t:toggleNerdTree")
        let t:toggleNerdTree = 0
    endif
    if t:toggleNerdTree
        NERDTreeClose
        let t:toggleNerdTree = 0
    else
        NERDTree
        let t:toggleNerdTree = 1
    endif
endfunction "}}}

map <Leader>n :call ToggleNERDTree()<CR>
let NERDTreeIgnore = ['\.pyc$']

map <Leader>t :GoTest<CR>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

nnoremap ,, <C-^>

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
""Airline conf
""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

let g:UltiSnipsExpandTrigger="<c-j>"

set laststatus=2 nu hidden
let g:airline_powerline_fonts=1
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
