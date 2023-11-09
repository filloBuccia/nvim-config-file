:set number "Enable line numbering
:set relativenumber "Shows line number in a more helpfull way
:syntax enable 
:set mouse=a "Enable mouse 
":set nowrap "Display long lines in a unique line
set linebreak " Break long lines at spaces, not in the middle of a word
:set splitbelow splitright 
:set scrolloff=1 "Always show at least one line above/below the cursor

:set autoindent "automatic indentation, have a look at https://vi.stackexchange.com/questions/5818/what-is-the-difference-between-autoindent-and-smartindent-in-vimrc
:set shiftwidth=4 "Understand these lines at https://tedlogan.com/techblog3.html
:set tabstop=4 
:set softtabstop=4
:set smartindent "when you create a new line it copy the indentation of the previous one
:set smarttab "Smart tabbing 
:set expandtab " Use space characters instead of tabs
:set encoding=UTF-8

"use / in normal mode for searching words 
"/ with a empty pattern will repeat the last search

"options for search mode
:set incsearch "autocomplete while your're searching with Ctrl-L, Ctrl-W for going back
:set hlsearch 
:set smartcase "Search upper and lower cases
:set clipboard=unnamedplus " Copy paste between vim and everything else



call plug#begin('~/.local/share/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' "Explanation below
Plug 'https://github.com/preservim/nerdtree'  " Nerd Tree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc (a single line) & gc(lines selected)
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'machakann/vim-highlightedyank' "Highlight code selected


"Html plugins
Plug 'alvan/vim-closetag'

"Color customization 
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons

Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal, for running terminal command when in normal mode
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion


call plug#end()




:colorscheme purify "also onedark and happy_hacking are cool





"VIM SORROUND EXPLANATION
"Add surroundings with ys, iw means is a word, s is a line, so ysiw( adds
"brackets to the word
"Change surroundings with cs, adding then the previous surrounding and then
"the new one, eg cs'" or cst(
"Delete surroundings with ds plus the type
"Remember that ( adds spaces, ) no


"CLOSE-TAG settings
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



"NERDTree is a directory displayer

"shortcut for NERDTree (C-q means ctrl q)
nnoremap <C-q> :NERDTreeToggle<CR>

"New NerdTree symbols  
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~" 

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())


"TAGBAR
"shortcut for Tacool
nnoremap <C-a> :TagbarToggle<CR>


"AIRLINE is the status bar below 
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


"COC.NVIM configuration

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <ctrl p> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-p> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif





