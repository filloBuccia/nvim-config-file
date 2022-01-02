:set number "Enable line numbering
:set relativenumber "Shows line number in a more helpfull way
:set nowrap "Display long lines in a unique line
:set splitbelow splitright 

:set autoindent "automatic indentation, have a look at https://vi.stackexchange.com/questions/5818/what-is-the-difference-between-autoindent-and-smartindent-in-vimrc
:set shiftwidth=4 "Understand these lines at https://tedlogan.com/techblog3.html
:set tabstop=4 
:set softtabstop=4
:set smartindent "when you create a new line it copy the indentation of the previous one
:set smarttab "Smart tabbing 

"use / in normal mode for searching words 
"/ with a empty pattern will repeat the last search

"options for search mode
:set incsearch "autocomplite while your're searching with Ctrl-L, Ctrl-W for going back
:set hlsearch 
:set smartcase "Search upper and lower cases
:set mouse=a "Enable mouse 
:syntax enable 
:set clipboard=unnamedplus " Copy paste between vim and everything else

:set encoding=UTF-8
call plug#begin('~/.local/share/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding with ysw) for a single word, yss) for the entire line 
Plug 'https://github.com/preservim/nerdtree'  " Nerd Tree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc (a single line) & gc(lines selected)
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'jiangmiao/auto-pairs' "Doppia coppia di parentesi e di virgolette in automatico
Plug 'machakann/vim-highlightedyank' "Evidenziare la sezione selezionata

"Color customization 
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons

Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal, for running terminal command when in normal mode
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
call plug#end()


":colorscheme purify "also onedark and happy_hacking are good


"NERDTree is a directory displayer

"shortcut for NERDTree (C-q means ctrl q)
nnoremap <C-q> :NERDTreeToggle<CR>

"New NerdTree symbols  
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~" 

"Tagbar
"shortcut for Tagbar
nnoremap <C-a> :TagbarToggle<CR>

"Airline is the status bar below 
" New air-line symbols 
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"set <tab> for moving between suggestions
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
