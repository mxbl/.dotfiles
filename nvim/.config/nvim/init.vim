" Plugins {{{
call plug#begin('~/.nvim/plugged')

" Conquer of Completion 
" NOTE: run :CocInstall coc-tsserver to use coc for typescript
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'thoughtbot/vim-rspec'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer' 
Plug 'junegunn/vim-easy-align'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'majutsushi/tagbar'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'zackhsi/fzf-tags'
Plug 'wookayin/fzf-ripgrep.vim'

" Markdown
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'SidOfc/mkdx'

" Configuration for Neovim's built-in language server client
" NOTE:
"  - Requires Neovim HEAD/nightly (https://github.com/neovim/neovim/releases/tag/nightly)
"  - tsserver needs tsconfig.json in project root directory
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" my development plugins
Plug '~/devel/nvim/nvim-notesapp'
Plug '~/devel/nvim/nvim-whid'

" Colorschems
"Plug 'sainnhe/sonokai'

" Harpoon stuff
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

lua require('testingmodule')
" }}}

syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set path+=**
set autowriteall
set mouse=a
set ignorecase
set smartcase
set conceallevel=2
set scrolloff=7
set sidescrolloff=7
set splitbelow
set splitright

" show status only if there at least two windows
set laststatus=1

" don't show mode if airline theme is in use
"set noshowmode

" open link under cursor with `gx`
let g:netrw_browsex_viewer = 'firefox'
let g:netrw_liststyle = 3
let g:netrw_banner = 0
"let g:netrw_browse_split = 2
let g:netrw_winsize = 75
let g:netrw_localrmdir='rm -r'

set foldenable
autocmd FileType vim,conf,sh,tmux,xdefaults setlocal foldmethod=marker
hi Folded ctermbg=None

if executable('rg')
    let g:rg_derive_root = 'true'
endif

" Appearance {{{
" List of all airline themes with screenshot:
"  * https://github.com/vim-airline/vim-airline/wiki/Screenshots
"
" serene:
"  * ~/.nvim/plugged/vim-airline-themes/autoload/airline/themes/serene.vim
"
"let g:airline_theme='serene'
fun PrimesColors()
  let g:gruvbox_contrast_dark = 'hard'
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  let g:gruvbox_invert_selection='0'
  colorscheme gruvbox
endfun
"call PrimesColors()

set background=dark
set colorcolumn=80
set fillchars=vert:│
set list
set listchars=tab:▸\ ,eol:¬,space:·,trail:~
set statusline=%<%f%h%m%r%h\ %w%y\ %{&ff}\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k%=%l:%c%V\ %P
hi ColorColumn  ctermbg=78
hi VertSplit    ctermbg=NONE ctermfg=Red cterm=Bold
hi NonText      ctermfg=237
hi SpecialKey   ctermfg=237
hi LineNr       ctermfg=237
hi CursorLineNr ctermfg=Red ctermbg=234
set cursorline
hi CursorLine cterm=NONE ctermbg=234

"hi Comment ctermfg=darkcyan

"hi StatusLine ctermfg=238 ctermbg=46
"hi StatusLineNC ctermfg=black
"
" Clean up lsp visuals
hi SignColumn                           ctermbg=black
hi LspDiagnosticsDefaultError           ctermfg=124
hi LspDiagnosticsVirtualTextInformation ctermfg=237
hi LspDiagnosticsVirtualTextHint        ctermfg=237
hi LspDiagnosticsVirtualTextWarning     ctermfg=237

" No underlining
hi LspDiagnosticsUnderlineWarning       cterm=None
hi LspDiagnosticsUnderlineHint          cterm=None
hi LspDiagnosticsUnderlineInformation   cterm=None
hi LspDiagnosticsUnderlineError         cterm=None

" PMenu
hi PMenu ctermfg=white ctermbg=237
hi PMenuSel ctermfg=white ctermbg=161
hi PMenuSbar ctermfg=none ctermbg=237
hi PMenuThumb ctermfg=none ctermbg=24


" }}}
" Commands {{{
command! ReloadConfig :so ~/.config/nvim/init.vim
" }}}
" Keybindings {{{
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" leaders
let mapleader = ","
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
"nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>u :UndotreeShow<cr>
nnoremap <leader>g :RgFzf<cr>

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-^> <C-\><C-n><C-^>
tnoremap <leader>b <C-\><C-n>:CtrlPBuffer<cr>

" coc - bindings for typescript
augroup tsbindings
  autocmd! tsbindings
  autocmd Filetype typescript nmap <buffer> <leader>gd <Plug>(coc-definition)
  autocmd Filetype typescript nmap <buffer> <leader>gr <Plug>(coc-references)
  autocmd Filetype typescript nmap <buffer> <leader>rn <Plug>(coc-rename)
augroup end

" fugitive
nmap <leader>gs :G<cr>
" diffget 3 from the right side (j)
nmap <leader>dj :diffget //3<cr>
" diffget 2 from the left side (f)
nmap <leader>df :diffget //2<cr>

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Rust buffer local bindings
augroup rustbindings
  autocmd! rustbindings
  autocmd Filetype rust nmap <buffer> <leader>rr :15RustTest<cr>
  autocmd Filetype rust nmap <buffer> <leader>ra :15RustTest!<cr>
augroup end

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" Harpoon bindings
nmap <leader>ha :lua require("harpoon.mark").add_file()<cr>
nmap <leader>hq :lua require("harpoon.ui").toggle_quick_menu()<cr>
nmap <leader>h1 :lua require("harpoon.ui").nav_file(1)<cr>
nmap <leader>h2 :lua require("harpoon.ui").nav_file(2)<cr>
nmap <leader>h3 :lua require("harpoon.ui").nav_file(3)<cr>
nmap <leader>h4 :lua require("harpoon.ui").nav_file(4)<cr>
 
"imap jk <esc>
" }}}
" Lsp / Completion {{{

" - menuone, popup even when there's only one match
" - noinsert, Do not insert text until a selection is made
" - noselect, Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"lua require('lspconfig').tsserver.setup{ on_attach=require('completion').on_attach }

" Configure LSP
"
" More information 
"   -> https://github.com/neovim/nvim-lspconfig
"   -> https://sharksforarms.dev/posts/neovim-rust/
"
" download rust anaylzer -> https://github.com/rust-analyzer/rust-analyzer/releases/tag/nightly
"   or install rust analyzer via pacman
lua <<EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client)
  require'completion'.on_attach(client)
end
nvim_lsp.tsserver.setup({ on_attach=on_attach })
EOF

" Have a fixed column for the diagnostic signs
set signcolumn=yes

" Some experimental bindings for diagnostics
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> sd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>

imap <Tab> <Plug>(completion_smart_tab)

" }}}
" Ruby Devel / RSpec {{{
augroup rubybindings
  autocmd! rubybindings
  autocmd Filetype ruby nmap <buffer> <leader>rr :call RunCurrentSpecFile()<cr>
augroup end

let g:rspec_command = 'call RspecRun("bundle exec rspec --format f {spec}")'

funct! RspecRun(cmd)
  let output = system(a:cmd)
  if output == ""
    echohl WarningMsg | echom "No Failures" | echohl None
    return
  endif

  " clean up old buffer from last run
  if bufexists("quickfix") | sil! exec 'bw! ' . bufnr("quickfix") | endif

  " create hidden unlisted nofile buffer
  let g:quickfixbuf = bufadd("quickfix")
  call setbufvar(g:quickfixbuf, "&buftype", "nofile")

  " goto quickfix buffer and append each line of output
  let curbuf = bufnr("")
  sil exe g:quickfixbuf . "buffer"
  for line in split(output, "\n")
    call appendbufline(g:quickfixbuf, line('$') - 1, line)
  endfo
  exe line('$') . "d"

  " read error list from buffer and go back to specfile buffer
  exe 'cbuffer'
  sil exe curbuf . "buffer"
  exe 'clist'
endf
" }}}
" {{{ Markdown / mkdx plugin settings
let g:mkdx#settings = { 'highlight': { 'enable': 1 },
                    \   'fold':      { 'enable': 1 },
                    \   'gf_on_steroids': 1,
                    \ }

" Note: mkdx will to nothing if this is set to 1
let g:markdown_folding = 0

" see :h mkdx-hightlighting
hi mkdxCheckboxComplete ctermfg=Green
hi mkdxCheckboxPending  ctermfg=Yellow
hi mkdxCheckboxEmpty    ctermfg=LightRed
" }}}

" Go development setup
let g:go_fmt_autosave = 0
augroup gobindings
  autocmd! gobindings
  autocmd Filetype go nmap <buffer> <leader>t :GoTest<cr>
  autocmd Filetype go nmap <buffer> <leader>c :GoBuild<cr>
augroup end

" my lua test tools
command! Scratch lua require'tools'.makeScratch()

" Fzf configure
let g:fzf_preview_window = []

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

