" PLUGINS:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" if vim-plug not installed then install:
" if VIM: change it to '~/.vim/autoload/plug.vim' in next and nextnext lines
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS:
call plug#begin()
" github copilot
" Plug 'github/copilot.vim'

Plug 'mattn/emmet-vim'

Plug 'ellisonleao/glow.nvim'
Plug 'iamcco/markdown-preview.nvim'

" Allows to change/add/delete quotes comfy
Plug 'tpope/vim-surround'
" Lets use . on plugins operation/complex operations
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

"md
Plug 'godlygeek/tabular'

" File Manager inside vim (default on left side):
Plug 'scrooloose/nerdtree'
" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'ThePrimeagen/vim-be-good'             "game from youtuber to train
Plug 'vim-scripts/AutoComplPop'             "constant pop-up menu with complitions

" Telescope:
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"complitions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'sirver/UltiSnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'hrsh7th/cmp-cmdline'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

"Color Themes:
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()
filetype plugin indent on
let g:glow_style = '~/dracula.json'

"design decision
set nofoldenable                " disable folding
syntax enable                   " highlight syntax
autocmd VimEnter * :hi normal guibg=000000  
"becoming transperent on start
set number relativenumber       " set line numbers relative to caret
set cursorline                  " highlight cursor line
set showmatch                   " shows matching brackets
" set nowrap                      " Dont wrap lines
set termguicolors
set background=dark
colorscheme gruvbox
set colorcolumn=80
set scrolloff=10

filetype plugin indent on       " turns on 'detection', 'plugin' and 'indent' at once
" imap jj <Esc> or inoremap jk <esc> but i reccomend Karabiner-elements for
" mac users. Using it you can remap caps to ESC
set noswapfile
set encoding=utf-8              " use utf-8 encoding


autocmd InsertEnter * norm zz

" i commented the line bellow in order for Telescope to work properly
" just open vim it directory you need for search and then use your shortcuts as usuall
" set autochdir                   " change current dir to file's dir

set completeopt-=preview        " dont show preview if using autocomplete
set laststatus=2                " it controls, when/how to display the status-bar: O=never, 1= {if > than 2 windows}, 2=always


" better search:
set incsearch                   " show search results immedeatly
set hlsearch                    " highlight found
set ignorecase                  " /word will find 'word' or 'Word' or 'WORD'
set smartcase                   " 11 When 'ignorecase' and 'smartcase' are both on, if pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, '/The'


"'smart ' tabs:
set tabstop=4                   " when indenting with '>', use 4 spaces width
set shiftwidth=4                " On pressing tab, insert 4 spaces
set expandtab                   " use spaces instead of tabs
set autoindent                  " set tabs automatically, when starting new line


"smth ab auto complete
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c                " hidding status bar 'insert ...'
"set wildmenu                    " opportunity to have complitions in cmd mode with Tab


"remove ESC delay:
set timeoutlen=1000
set ttimeoutlen=0

"use systerm clipboard
set clipboard+=unnamedplus


let mapleader = " "             " Set leader key:

" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"l letlplll g:user_emmet_leader_key=<leader>n
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" augroup EmmetSettings
  " autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)

" for colemak users

" noremap n j
" noremap e k
" nnoremap i l
" nnoremap u i
" nnoremap k e
" nnoremap l u
" nnoremap j n
" nnoremap dlp dip

" set langmap=dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP


"for fugitive
nmap <leader>gn :diffget //3<CR>
nmap <leader>gt :diffget //2<CR>
nmap <leader>gs : G<CR>


nnoremap <leader><leader> :NERDTreeToggle<CR>

" find and change to
nnoremap S :%s//g<Left><Left>

map <leader>vr :source %<CR>

"for MarkdownPreview
nmap <Leader>m :MarkdownPreview <CR>
nmap <leader>mn :Glow<CR>
nmap <Leader>mp <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D
" Save (Write) file:
nnoremap <leader>w :w <CR>
" Save All and Quit All:
nnoremap <leader>A :wqa <CR>
" move between windows inside vim:
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>


" Telescope:
nnoremap <leader>f :Telescope find_files <CR>
nnoremap <leader>g :Telescope live_grep <CR>
nnoremap <leader>b <cmd>Telescope buffers<cr>



" use ukr in normal mode:
set langmap=??f,??\\,,??d,??u,??l,??t,??',??\\;,??p,??b,??s,??],??q,??r,??k,??v,??y,??j,??g,??h,??c,??n,??e,??a,??[,??w,??x,??i,??o,??m,??.,??z,??F,??<,??D,??U,??L,??T,??\\",??:,??P,??B,??S,??},??Q,??R,??K,??V,??Y,??J,??G,??H,??C,??N,??E,??A,??{,??W,??X,??I,??O,??M,??>,??Z
" use urk in normal mode after you got used to colemak layout

" nnoremap ?????? gcc

"ruby
" autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
" autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=!
" autocmd FileType ruby compiler ruby
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
map <Leader>rr :!ruby %<CR>
map <Leader>rn :!node %<CR>
map <Leader>r :!python3 %<CR>


"function for complition to work
set completeopt=menu,menuone,noselect

lua << EOF
    -- Setup nvim-cmp.
    local cmp = require('cmp')

    cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,

            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,

            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            --['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            --['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            --['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            --['<C-e>'] = cmp.mapping({
            --  i = cmp.mapping.abort(),
            --  c = cmp.mapping.close(),
            --}),
        },
        sources = {
            { name = 'nvim_lsp' },
            --{ name = 'path' },
            --{ name = 'vsnip' },   -- For vsnip users.
            --{ name = 'luasnip' }, -- For luasnip users.
            { name = 'ultisnips' }, -- For ultisnips users.
            --{ name = 'snippy' },  -- For snippy users.
            --TODO: patter -> pattern
            --{ name = 'buffer', option = { keyword_patter = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\|[a-zA-Z??-????-??]*\)]] } },
        },
        snippet = {
            -- REQUIRED - you MUST specify a snippet engine
            expand = function(args)
              --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              --require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline('/', {
    --  sources = {
    --    { name = 'buffer' }
    --  }
    --})

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --cmp.setup.cmdline(':', {
    --  sources = cmp.config.sources({
    --    { name = 'path' }
    --  }, {
    --    { name = 'cmdline' }
    --  })
    --})

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['solargraph'].setup {
        capabilities = capabilities
    }
EOF

set nohlsearch                  " disable search highlight
" python3 -m pip install --user --upgrade pynvim
let g:python3_host_prog = '/usr/bin/python3' " -- Set python 3 provider


" tab is 2 spaces for html & css:
autocmd BufReadPost *.html setlocal shiftwidth=2
autocmd BufReadPost *.html setlocal tabstop=2
autocmd BufReadPost *.css setlocal shiftwidth=2
autocmd BufReadPost *.css setlocal tabstop=2
