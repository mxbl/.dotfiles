require "mx.profile"

if require "mx.first_load"() then
  return
end

-- Set this early, because otherwise any mapping before doing this,
-- will be set to the old leader
vim.g.mapleader = " "

-- Setup globals that I expect to be always available
require "mx.globals"

-- Lsp configuration
require "mx.lsp"

-- My lua tryout space
require "mx.scratch"

require('packer').startup({
  function(use)
    use({ 'lewis6991/impatient.nvim' })
    use({ 'wbthomason/packer.nvim' })
    use({ 'tpope/vim-surround' })
    use({ 'junegunn/vim-easy-align' })
    use({ 'christoomey/vim-tmux-navigator' })
    use({ 'SidOfc/mkdx' })
    --use({ 'dag/vim-fish' })
    use({ 'rust-lang/rust.vim' })
    use({ 'chase/vim-ansible-yaml' })
    use({ 'tpope/vim-fugitive' })
    use({ 'junegunn/gv.vim' })
    use({ 'simeji/winresizer' })
    use({ 'rcarriga/nvim-notify' })

    -- Colorschemes
    use({ 'gruvbox-community/gruvbox' })
    use({ 'tjdevries/colorbuddy.vim' })
    use({ 'tjdevries/gruvbuddy.nvim' })
    use({ 'norcalli/nvim-colorizer.lua' })

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'nvim-treesitter/playground' })

    -- Telescope
    use({ 'nvim-lua/popup.nvim' })
    use({ 'nvim-lua/plenary.nvim' })
    use({ 'nvim-telescope/telescope.nvim' })
    use({ 'nvim-telescope/telescope-file-browser.nvim' })
    use({ 'nvim-telescope/telescope-ui-select.nvim' })

    -- Statusline
    use({ 'tjdevries/express_line.nvim' })

    -- LSP
    use 'tjdevries/nlua.nvim'
    use 'neovim/nvim-lspconfig'
    use 'wbthomason/lsp-status.nvim'
    use 'nvim-lua/completion-nvim'
    use 'euclidianAce/BetterLua.vim'
    use 'j-hui/fidget.nvim'

    -- Harpoon
    use({ 'ThePrimeagen/harpoon' })
  end,
  config = {
    display = {
      open_cmd = '50vnew \\[packer\\]',
    },
  },
})

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
  fold = { enable = 0 },
  links = { external = { enable = 1 }},
  toc = {
    text = 'Table of Content',
    update_on_write = 1,
    details = { nesting_level = 0 },
  },
}
-- mkdx will do nothing if this is set to 1
vim.g.markdown_folding = 0

require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
