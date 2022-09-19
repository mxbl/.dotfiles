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
    use("tjdevries/colorbuddy.nvim")
    use("folke/tokyonight.nvim")

    use("ThePrimeagen/harpoon")

    -- Lsp and completion
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("fatih/vim-go")
end)
