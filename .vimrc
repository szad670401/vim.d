set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'cuteErrorMarker'
Plugin 'vim-scripts/wombat256.vim'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/matchit'
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Nimo's vimrc
" https://github.com/nimo1491/vimrc

"---------------------------------------------------
" Runtimepath Setting
"---------------------------------------------------
" Let windows also use .vim {
    if has('win32') || ('win64')
        set runtimepath=$HOME/.vim,$VIM/.vim,$VIM/vimfiles,$VIMRUNTIME
    endif
" }




"---------------------------------------------------
" VIM UI
"---------------------------------------------------

" General Settings {
    set nocompatible    "not compatible with the old-fashion vi mode        
    set bg=dark         "set dark background
    set bs=2            "equals bs=indent,eol,start     
    set history=50      "keep 50 lines of command line history        
    set autoread        "auto read when file is changed from outside
    set nobackup        "disable backup
    set ruler           "show the ruler
    set modeline        "enable modeline
    " set showmatch       "show matching brackets/parenthesis
    set showmode        "display the current mode
    set number          "line number on
    set mat=15          "how many tenths of a second to blink
    set ff=unix         "force newline = 0x0a
    " set scroll options
    set scrolljump=1    "lines to scroll when cursor leaves screen
    set scrolloff=6     "minimum lines to keey above and below cursor
    " set search options
    set hlsearch        "highlight search terms
    set incsearch       "find as you tye search
    set smartcase       "ignore case if search pattern is all lowercase
    set ignorecase      "case insensitive search
" }

" Set wild options {
    set  wildmenu       
    set  wildmode=longest,list
    set  wildignore+=*.o,*.class,*.pyc,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git
    set  winaltkeys=no
" }

" Formatting {
    set nowrap          "wrap long lines
    " Set indent options
    set autoindent      "indent at the same level of the previous line
    set smartindent     "advanced auto indent, remember to enable autoindent 
    set copyindent      "copy the previous indentation on autoindenting
    " Set tab options
    set smarttab        "insert tabs on the start of a line according to contect
    set expandtab       "replace <TAB> with spaces
    set shiftwidth=4    "use indents of 4 spaces
    set tabstop=4       "an indentation every four columns
    set softtabstop=4   "let backspace delete indent
    " Makefile have to use <TAB> excepts spaces
    au FileType Makefile set noexpandtab
" }

" Disable sound on errors {
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
" }

" Auto reload vimrc when editing it {
    "if has("win32") || ("win64")
    "    autocmd! bufwritepost _vimrc source $VIM\_vimrc 
    "else
    "    autocmd! bufwritepost .vimrc source ~/.vimrc    
    "endif
" }

" GVIM settings {
    if has("gui_running")
    	" GUI
        colorscheme wombat256mod               "scheme
        set         gfn=Consolas:h12        "font
        set         guioptions-=T           "remove toolbar
        set         cursorline              "highlight current line
        " Language
        language    mes en_US.UTF_8
        lang        en_US.UTF_8
        set         langmenu=en_US.UTF-8
        " Gvim windows position and size
        winsize     120  35
        winpos      20  20
        set guifont=Monospace\ 14
        set guifontwide=STHeiti\ 14 
    else
    	" GUI
        set         t_Co=256                "color
        colorscheme wombat256mod               "scheme
    endif
" }

" Autoload syntax and filetype related script. Must set before GVIM Settings {
    syntax on
    filetype on
    filetype plugin on
    filetype indent on
" }

" Status line {
    if has('statusline') 
        set laststatus=2
        set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
        set statusline+=\ \ \ [%{&ff}/%Y] 
        set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
        set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

        function! CurDir()
            let curdir = substitute(getcwd(), $HOME, "~", "")
            return curdir
        endfunction

        function! HasPaste()
            if &paste
                return '[PASTE]'
            else
                return ''
            endif
        endfunction
    endif
" }

" Encoding settings {
    set fencs=utf-8,big5,euc-jp,utf-bom,iso8859-1
    set fenc=utf-8 enc=utf-8 tenc=utf-8
" }

" Save view {
    autocmd  BufWinLeave *.*	silent mkview
    autocmd  BufWinEnter *.*	silent loadview
" }

" C/C++ specific settings
    au FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

" Restore cursor to file position in previous editing session
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"---------------------------------------------------
" VIM Key Mappings
"---------------------------------------------------

" Set leader to ',' {
    let mapleader=","
    let g:mapleader=","
" }

" Change working directory to that of the current file
    cmap cd. lcd %:p:h

" Trun off search highlighting 
    nmap <leader>/ :nohl<CR>

" ,p toggles paste mode
    nmap <leader>p :set paste!<BAR>set paste?<CR>

" For when you forget to sudo in ubuntu/mint...
    cmap w!! w !sudo tee % > /dev/null

" Move around tabs. conflict with the original screen top/bottom {
" Comment them out if you want the original H/L
    map <S-H> gT
    map <S-L> gt
" }

" Allow multiple indentation/deindentation in visual mode {
    vnoremap < <gv
    vnoremap > >gv
" }

" Move around and maximum the split {
    map     <c-j>   <c-w>j<c-w>_
    map     <c-k>   <c-w>k<c-w>_
    nmap    <c-h>   <c-w>h<c-w><bar>
    nmap    <c-l>   <c-w>l<c-w><bar>
    " Set the min width of a window to 0 so we can maximize others
    set     wmw=0   
    " Set the min height of a window to 0 so we can maximize others
    set     wmh=0
" }

" Command line mapping {
    cm  <c-a>   <home>
    cm  <c-e>   <end>
    cno <c-b>   <left>
    cno <c-d>   <del>
    cno <c-f>   <right>
    cno <c-n>   <down>
    cno <c-p>   <up>
" }

" ,r replace the current word in all opened buffers {
    map <leader>r :call Replace()<CR>
    fun! Replace() 
        let s:word = input("Replace " . expand('<cword>') . " with:") 
        :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
        :unlet! s:word 
    endfun
" }

" ,g generates the header guard {
    map <leader>g :call IncludeGuard()<CR>
    fun! IncludeGuard()
       let basename = substitute(bufname(""), '.*/', '', '')
       let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
       call append(0, "#ifndef " . guard)
       call append(1, "#define " . guard)
       call append( line("$"), "#endif // for #ifndef " . guard)
    endfun
" }

" Quick Fix {
    com! -bang -nargs=? QFix cal QFixToggle(<bang>0)
    fu! QFixToggle(forced)
      if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
      else
        copen 10
        let g:qfix_win = bufnr("$")
      en
    endf   
    nn      <leader>q :QFix<cr>
    nn      <leader>] :cn<cr>
    nn      <leader>[ :cp<cr>
" }


"---------------------------------------------------
" VIM Plugins
"---------------------------------------------------

" Onmi completion {
    " Enable onmi completion (C-x C-o) 
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType c set omnifunc=ccomplete#Complete
        autocmd FileType java set omnifunc=javacomplete#Complete

    " Use syntax complete if nothing else available 
        if has("autocmd") && exists("+omnifunc")
          autocmd Filetype *
                      \	if &omnifunc == "" |
                      \		setlocal omnifunc=syntaxcomplete#Complete |
                      \	endif
        endif

    " Make CSS omnicompletion work for SASS and SCSS 
        autocmd BufNewFile,BufRead *.scss       set ft=scss.css
        autocmd BufNewFile,BufRead *.sass       set ft=sass.css
" }

" NERD tree
    nm      <leader>e   :NERDTreeToggle<CR>
    " Auto open NERDTree
    "au      VimEnter * NERDTreeToggle
    "au      BufEnter * NERDTreeMirror

" Taglist {
    nm      <leader>t   :TlistToggle<CR>
    let     Tlist_Exit_OnlyWindow       = 1
    let     Tlist_File_Fold_Auto_Close  = 1
    let     Tlist_Use_Right_Window      = 1
    let     Tlist_Show_Menu             = 1
    let     Tlist_Show_One_File         = 1
    let     Tlist_Auto_Open             = 0
" }

" AutoClose {
    "set term=linux
    imap <leader>k <ESC>O
    imap <leader>j <ESC>o
    imap <leader>l <ESC>la
    imap <leader>h <ESC>hi
" }

" SuperTab {
    let g:SuperTabDefaultCompletionType = "context"
    let SuperTabMappingForward = '<leader><tab>'
    let g:SuperTab_tab = 0
    fu! ToggleSuperTabMap()
        if g:SuperTab_tab == 1
        	let g:SuperTabMappingForward = "<leader><tab>"
        	let g:SuperTabMappingTabLiteral = "<tab>"
        	let g:SuperTab_tab = 0
        	echo "SuperTab key = <leader><tab>"
        else
        	let g:SuperTabMappingForward = "<tab>"
        	let g:SuperTabMappingTabLiteral = "<leader><tab>"
        	let g:SuperTab_tab = 1
        	echo "SuperTab key = <tab>"
        endif
        if has('win32') || ('win64')
            so  $VIM/.vim/bundle/supertab/plugin/supertab.vim
        else
            so  $HOME/.vim/bundle/supertab/plugin/supertab.vim
        endif
    endf
    map <leader>st :call ToggleSuperTabMap()<CR>
    imap <leader>st <ESC>:call ToggleSuperTabMap()<CR>a
" }

" Fuzzy Finder {
    nnoremap    <leader>ff  :FufFile!<CR>
    nnoremap    <leader>fb  :FufBuffer!<CR>
" }

set autochdir
filetype plugin on
filetype plugin indent on
autocmd Filetype c setlocal sts=4 sw=4 expandtab
autocmd Filetype cpp setlocal sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
autocmd Filetype tex setlocal sts=2 sw=2 expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
