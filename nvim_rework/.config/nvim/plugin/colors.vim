set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

"lua require('colorbuddy').colorscheme('gruvbuddy')
"lua require('colorizer').setup()

hi Normal                     guibg=NONE
hi NonText                    guibg=NONE

hi NonText      guifg=#3a3a3a
hi CursorLineNr guifg=#ff0000 guibg=#1c1c1c
hi ColorColumn                guibg=#1c1c1c
hi CursorLine                 guibg=#1c1c1c
hi Vertsplit    guifg=#ff0000 guibg=NONE
hi LineNr       guifg=#3a3a3a
hi SpecialKey   guifg=#3a3a3a
hi Folded                     guibg=NONE

hi Comment      guifg=#3a3a3a guibg=NONE

"hi PMenu        guifg=#000000 guibg=#3a3a3a
"hi PMenuSel     guifg=#000000 guibg=#d7005f
"hi PMenuSbar    guifg=none    guibg=#3a3a3a
"hi PMenuThumb   guifg=none    guibg=#005f87

hi netrwDir               guifg=#5eacd3

" Telescope
hi TelescopeBorder        guifg=#1c1c1c
hi TelescopeTitle         guifg=#5eacd3
hi TelescopePromptBorder  guifg=#1c1c1c
hi TelescopeResultsBorder guifg=#1c1c1c
hi TelescopePreviewBorder guifg=#1c1c1c
hi TelescopeMatching      guifg=#33ff00

"hi Normal                     ctermbg=NONE
"hi NonText      ctermfg=NONE  ctermbg=NONE 
"
"hi ColorColumn                ctermbg=234
"hi Vertsplit    ctermfg=red   ctermbg=NONE cterm=bold
"hi NonText      ctermfg=237
"hi SpecialKey   ctermfg=237
"hi LineNr       ctermfg=237
"hi CursorLineNr ctermfg=red   ctermbg=234 cterm=NONE
"hi CursorLine                 ctermbg=234 cterm=NONE
"hi PMenu        ctermfg=white ctermbg=237
"hi PMenuSel     ctermfg=white ctermbg=161
"hi PMenuSbar    ctermfg=none  ctermbg=237
"hi PMenuThumb   ctermfg=none  ctermbg=24
"hi Folded                     ctermbg=NONE

hi mkdxCheckboxComplete ctermfg=Green
hi mkdxCheckboxPending  ctermfg=Yellow
hi mkdxCheckboxEmpty    ctermfg=LightRed
