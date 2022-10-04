return require("packer").startup {
    function(use)
        use("wbthomason/packer.nvim")

        use("nvim-lua/plenary.nvim")
        use("nvim-lua/popup.nvim")
        use("nvim-telescope/telescope.nvim")

        --[[
        -- Doesn't work ?? use Telescope oldfiles
        use {
            "nvim-telescope/telescope-frecency.nvim",
            config = function()
                require"telescope".load_extension("frecency")
            end,
            requires = { "kkharji/sqlite.lua" }
        }
        --]]

        use("nvim-treesitter/nvim-treesitter", {
            run = ":TSUpdate"
        })
        use("nvim-treesitter/playground")
        use("nvim-treesitter/nvim-treesitter-context")

        use("tpope/vim-surround")
        use("tpope/vim-abolish")
        use("junegunn/vim-easy-align")
        use("chase/vim-ansible-yaml")
        use("airblade/vim-gitgutter")
        use("TimUntersberger/neogit")
        use("numToStr/Comment.nvim")

        -- Colorschemes
        use("tjdevries/colorbuddy.nvim")
        use("tjdevries/gruvbuddy.nvim")
        use("folke/tokyonight.nvim")
        use("norcalli/nvim-colorizer.lua")

        use("ThePrimeagen/harpoon")

        -- Statusline
        use("tjdevries/express_line.nvim")

        -- Lsp and completion
        use("neovim/nvim-lspconfig")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/nvim-cmp")
        use("tzachar/cmp-tabnine", { run = "./install.sh" })
        use("onsails/lspkind-nvim")
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")
        use("simrat39/rust-tools.nvim")
        use("wbthomason/lsp-status.nvim")
        use("nvim-lua/lsp_extensions.nvim")
        use("j-hui/fidget.nvim")

        use("fatih/vim-go")
        use('dag/vim-fish')
    end
}
