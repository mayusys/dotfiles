filetype off
filetype plugin indent off

"# Plugins
if has('vim_starting')
    set runtimepath+=~/.config/nvim/plugged/vim-plug
    if !isdirectory(expand('$XDG_CONFIG_HOME/nvim/plugged/vim-plug'))
        call system('mkdir -p ~/.config/nvim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/plugged/vim-plug/autoload')
    end
endif

call plug#begin(expand('$XDG_CONFIG_HOME/nvim') . '/plugged/vim-plug/autoload')
    Plug 'junegunn/vim-plug', {'dir': expand('~/.config/nvim') . '/plugged/vim-plug/autoload'}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

"# Edit settings
set title
set showmatch
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set list
set smartindent
set cursorline
set number
syntax on

"# Search settings
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

"# Disable beep sound
set visualbell t_vb=
set novisualbell
set noerrorbells

"# Go
autocmd FileType go set runtimepath+=globpath($GOROOT, "/misc/vim")
autocmd FileType go set runtimepath+=globpath($GOPATH, "src/github.com/nsf/gocode/vim")
autocmd FileType go autocmd BufWritePre <buffer> Fmt
set completeopt=menu,preview

"# Key mappings
noremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

filetype plugin indent on
filetype on
