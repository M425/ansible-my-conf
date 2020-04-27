" Vundle bootstrap
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'rking/ag.vim'
  "Plugin 'jlanzarotta/bufexplorer' | DEPREC. use CtrlP
  Plugin 'kien/ctrlp.vim.git'
  Plugin 'Yggdroot/indentLine.git'
  Plugin 'scrooloose/nerdcommenter.git'
  Plugin 'scrooloose/nerdtree.git'
  Plugin 'scrooloose/syntastic.git'
  Plugin 'majutsushi/tagbar'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'bling/vim-bufferline'
  Plugin 'chase/vim-ansible-yaml.git'
  Plugin 'ntpeters/vim-better-whitespace.git'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-fugitive.git'
  Plugin 'airblade/vim-gitgutter.git'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tpope/vim-surround'
  Plugin 'markcornick/vim-vagrant.git'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'moll/vim-bbye.git'
  Plugin 'ekalinin/Dockerfile.vim'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

" Leaders
  let mapleader="\<Space>"    " set leader as space
  nnoremap - :

" Syntax and rel
  syntax enable         " highlight languages syntax
  syntax on             " set on syntax
  set encoding=utf-8 nobomb
  set autoindent        " automagically indent
  set smartindent       " improve indent functionality
  set tabstop=2         " number of visual spaces per TAB
  set softtabstop=2     " number of spaces in tab when editing
  set showtabline=2     " File tabs allways visible
  set expandtab         " TABs are spaces
  set shiftwidth=2      " how long is tab
  filetype indent on    " load filetype-specific indent file
  set colorcolumn=+1
  set showmatch         " highlights matching {[()]}
  set cursorline        " highlight the line over the cursor
  set number            " show line number
  " indent to 4
  nnoremap · :call TabToggle()<CR>
  function TabToggle()
    if &shiftwidth==2
      set shiftwidth=4
      set softtabstop=4
      set tabstop=4
    else
      set shiftwidth=2
      set softtabstop=2
      set tabstop=2
    endif
    :IndentLinesReset
  endfunction
  set scrolloff=10

" aux
  set mouse=a           " availability of the mouse
  set clipboard=unnamed " ...
  set clipboard=unnamedplus " ...
  " set wildmenu          " visual autocomplete for command menu | DEPREC
  set laststatus=2      " ...
  set showcmd           " show command in bottom bar
  set hidden            " ...
  " set lazyredraw        " redraw only when we need to

" Color and interface
  set t_Co=256          " number of colors
  if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
  endif
  " set term=xterm-256color
  " Colors [ monokai, molokai, blackboard, solarized]
  " colorscheme materialbox
  " let g:solarized_termcolors=256

" Tmux: integration
  if &term =~ '^screen'
    " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
    execute "set t_kP=\e[5;*~"
    execute "set t_kN=\e[6;*~"
    " Arrow keys http://unix.stackexchange.com/a/34723
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  endif

" Searching
  set incsearch         " search as characters are entered
  set hlsearch          " the words searched are highlighted
  " turn off search highlights
  nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>
  " prettify highligthed search
  hi Search   cterm=NONE ctermbg=yellow ctermfg=darkgray guibg=yellow guifg=darkgray
  set ignorecase
  set smartcase         " case insensitive search
  " Highlights all ripetition of the word under the cursor
  map § *#

" Folding
  set foldenable        " enable folding
  set foldlevelstart=4 " open most folds by default
  set foldnestmax=10    " 10 nested fold max
  set foldmethod=indent " fold based on indent level
  " shortcut for open/close folds
  nnoremap , za
  nnoremap ; zA


" No backup files
  set nobackup
  set noswapfile

" Aux Func: confirm to exit
  " If the current buffer has never been saved, it will have no name,
  " call the file browser to save it, otherwise just save it.
  command -nargs=0 -bar Update if &modified
    \|    if empty(bufname('%'))
    \|        browse confirm write
    \|    else
    \|        confirm write
    \|    endif
    \|endif
  nnoremap <silent> <C-S> :<C-u>Update<CR>

" SHORTCUT : noop
  nnoremap ^ <nop>

" SHORTCUT : Panes
  set splitbelow
  set splitright
  nnoremap <Leader>h :split<CR>
  nnoremap <Leader>v :vsplit<CR>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  nnoremap <Leader><S-W> <C-W>q

" SHORTCUT : change buffers
  nnoremap <Leader>w :Bdelete<CR>
  nnoremap <Leader>n :bnext<CR>
"  nnoremap <Leader>1 :buffer 1<CR>
"  nnoremap <Leader>2 :buffer 2<CR>
"  nnoremap <Leader>3 :buffer 3<CR>
"  nnoremap <Leader>4 :buffer 4<CR>
"  nnoremap <Leader>5 :buffer 5<CR>
"  nnoremap <Leader>6 :buffer 6<CR>
"  nnoremap <Leader>7 :buffer 7<CR>
"  nnoremap <Leader>8 :buffer 8<CR>
"  nnoremap <Leader>9 :buffer 9<CR>

" SHORTCUT : Ctags
  map ts :tselect <C-R><C-W><CR>
  map tg :tag <C-R><C-W><CR>
  map tb :pop <CR>

" ====== PLUGINS ====== "

" Plugin: NERDTREE
  map <Leader>\ :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Plugin: Silver Searcher
  nnoremap <leader>a :Ag 

" Plugin: CtrlP
  nnoremap <Leader>p :CtrlP<CR>
  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_show_hidden = 1
  nnoremap <Leader>b :CtrlPBuffer<CR>
  nnoremap <leader>o :CtrlPCurWD<CR>

" Plugin: Tagbar
  nmap <leader>t :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
  let g:tagbar_compact = 1

" Plugin: Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  nnoremap <Leader>s :SyntasticCheck<CR>

" Plugin: vim-airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme             = 'sol'
  "let g:airline_enable_branch     = 1
  "let g:airline_enable_syntastic  = 1
  "let g:airline_left_sep = '▸'
  "let g:airline_right_sep = '◂'
  let g:airline#extensions#tabline#enabled = 1
  " let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline_section_c = "%{getcwd()} | %t"

  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  " let g:airline#extensions#hunks#enabled=1
  "let g:airline_symbols = get(g:, 'airline_symbols', {})
  "let g:airline_symbols.space = "\ua0"
  let g:bufferline_echo = 0
  set timeoutlen=200

" Plugin: GitGutter

" Plugin: Fugitive (git)

" Plugin: easymotion
  map \ <Plug>(easymotion-prefix)
  " \+w look for word forward
  " \+b look for word backward

" Plugin: YouCompleteMe
  nnoremap <Leader>g :YcmComplete;r GoToDefinition<CR>
  let g:ycm_key_list_select_completion = ['<TAB>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>']

" Plugin: indentLine
  let g:indentLine_color_term = 239
  let g:indentLine_showFirstIndentLevel=1
  let g:indentLine_char = '┊'
  " let g:indentLine_noConcealCursor=1
  let g:indentLine_bufNameExclude=['NERD_tree.*']
  let g:indentLine_leadingSpaceChar='·'
  let g:indentLine_leadingSpaceEnabled=1

  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
