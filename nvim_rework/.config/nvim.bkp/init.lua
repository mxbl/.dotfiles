vim.g.mapleader = " "

require('packer').startup({
  function(use)
    use({ 'wbthomason/packer.nvim' })

    -- Colors
    use({ 'tjdevries/colorbuddy.vim' })
    use({ 'tjdevries/gruvbuddy.nvim' })

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'nvim-treesitter/playground' })

    -- Telescope
    use({ 'nvim-lua/popup.nvim' })
    use({ 'nvim-lua/plenary.nvim' })
    use({ 'nvim-telescope/telescope.nvim' })
    use({ 'nvim-telescope/telescope-file-browser.nvim' })
    use({ 'nvim-telescope/telescope-ui-browser.nvim' })

  end
})
