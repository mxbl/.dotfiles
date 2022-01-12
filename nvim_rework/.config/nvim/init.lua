require "mx.profile"

if require "mx.first_load"() then
  return
end

function plugin_installed(plugin)
  return vim.fn.isdirectory(
    vim.fn.stdpath('data') .. '/site/pack/packer/start/' .. plugin) == 1
end

require('packer').startup({
  function()
    use({ 'lewis6991/impatient.nvim' })
    use({ 'wbthomason/packer.nvim' })
    use({ 'tpope/vim-surround' })
    use({ 'junegunn/fzf' })
    use({ 'junegunn/fzf.vim' })
    use({ 'junegunn/vim-easy-align' })
    use({ 'christoomey/vim-tmux-navigator' })
    use({ 'dag/vim-fish' })
    use({ 'SidOfc/mkdx' })

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_cmd = '50vnew \\[packer\\]',
    },
  },
})

-- Set this early, because otherwise any mapping before doing this,
-- will be set to the old leader
vim.g.mapleader = ","

-- colorscheme and misc highlightings {{{
vim.cmd([[
hi ColorColumn  ctermbg=234
hi Vertsplit    ctermfg=red   ctermbg=NONE cterm=bold
hi NonText      ctermfg=237
hi SpecialKey   ctermfg=237
hi LineNr       ctermfg=237
hi CursorLineNr ctermfg=red   ctermbg=234 cterm=NONE
hi CursorLine                 ctermbg=234 cterm=NONE
hi PMenu        ctermfg=white ctermbg=237
hi PMenuSel     ctermfg=white ctermbg=161
hi PMenuSbar    ctermfg=none  ctermbg=237
hi PMenuThumb   ctermfg=none  ctermbg=24
hi Folded                     ctermbg=NONE

hi mkdxCheckboxComplete ctermfg=Green
hi mkdxCheckboxPending  ctermfg=Yellow
hi mkdxCheckboxEmpty    ctermfg=LightRed
]])
-- }}}

vim.cmd([[
  augroup InitAutoCommands
    au!
    au FileType vim,conf,sh,tmux,xdefaults setlocal foldmethod=marker
  augroup END
]])

-- TODO: Move to ./after/plugin/mkdx.lua, fails for some reason
vim.g['mkdx#settings'] = {
  restore_visual = 1,
  gf_on_steroids = 1,
  enter = { shift = 1 },
  highlight = { enable = 1 },
  fold = { enable = 1 },
  links = { external = { enable = 1 }},
  toc = {
    text = 'Table of Content',
    update_on_write = 1,
    details = { nesting_level = 0 },
  },
}
-- mkdx will do nothing if this is set to 1
vim.g.markdown_folding = 0
