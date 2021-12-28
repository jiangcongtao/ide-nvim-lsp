local utils = require("utils")

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path})
end
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
    return string.format('require("setup/%s")', name)
end

return require('packer').startup({
    function(use)
        -- List plugins to be installed
        -- it is recommened to put impatient.nvim before any other plugins
        -- use {
        --     'lewis6991/impatient.nvim',
        --     config = [[require('impatient')]]
        -- }
        use 'wbthomason/packer.nvim' -- Packer can manage itself
        use 'mhinz/vim-startify' -- start screen
        use 'tpope/vim-endwise'
        use 'jiangmiao/auto-pairs'

        -- A list of colorscheme plugin you may want to try. Find what suits you.
        -- Use packadd command to add opt package/plugin
        use({
            "lifepillar/vim-gruvbox8",
            opt = true
        })
        use({
            "navarasu/onedark.nvim",
            config = get_setup('onedark')
        })

        -- Show git change (change, delete, add) signs in vim sign column
        use({
            "mhinz/vim-signify",
            event = 'BufEnter'
        })
        -- Another similar plugin
        use 'airblade/vim-gitgutter'

        -- Snippet engine and snippet template
        use({
            "SirVer/ultisnips",
            event = 'InsertEnter'
        })
        use({
            "honza/vim-snippets",
            after = 'ultisnips'
        })

        -- Translation
        use({
            'voldikss/vim-translator',
            config = get_setup("translator")
        })

        -- Comment plugin
        use({
            "tpope/vim-commentary",
            event = "VimEnter"
        })

        -- Post-install/update hook with neovim command
        use({
            "onsails/lspkind-nvim",
            requires = {{"famiu/bufdelete.nvim"}}
        })
        -- use({
        --     "neovim/nvim-lspconfig",
        --     config = get_setup("lsp")
        -- })
        use({
            "hrsh7th/nvim-cmp",
            requires = {{"neovim/nvim-lspconfig"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-nvim-lua"},
                        {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/vim-vsnip"},
                        {"hrsh7th/cmp-vsnip"}, {"hrsh7th/vim-vsnip-integ"},
                        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}},
            config = get_setup("cmp")
        })
        use({
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            event = "BufReadPre",
            config = get_setup("gitsigns")
        })

        use({
            "williamboman/nvim-lsp-installer",
            requires = {{"neovim/nvim-lspconfig"}},
            config = get_setup('lsp-installer')
        })

        use({"tpope/vim-repeat"})
        use({"tpope/vim-surround"})
        use({
            'mfussenegger/nvim-dap',
            config = get_setup('dap')
        })
        use({
            'Pocco81/DAPInstall.nvim',
            config = get_setup('dap-install')
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            config = get_setup("treesitter"),
            run = ":TSUpdate"
        })
        use("nvim-treesitter/nvim-treesitter-textobjects")
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = {{"nvim-lua/plenary.nvim"}},
            config = get_setup('null-ls')
        })
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {
                "nvim-telescope/telescope-fzf-native.nvim"}},
            config = get_setup('telescope')
          }

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = require("packer.util").float
        },
        profile = {
            enable = true,
            threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        }
    }
})

