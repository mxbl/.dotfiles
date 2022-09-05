return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("tpope/vim-surround")
    use("chase/vim-ansible-yaml")
    use("airblade/vim-gitgutter")
    use("TimUntersberger/neogit")

    -- Colorschemes
    use("folke/tokyonight.nvim")
end)
