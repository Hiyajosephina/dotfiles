local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then return end

return packer.startup(function(use)

    -- plugins start

    use("wbthomason/packer.nvim") -- packer
    use("nvim-lua/plenary.nvim") -- plenary, used by many other plugins
    use("rafamadriz/neon") -- neon theme
    use("lunarvim/synthwave84.nvim") -- synthwave colorscheme
    use("christoomey/vim-tmux-navigator") -- tmux and window nav
    use("szw/vim-maximizer") -- maximize windows    
    use("tpope/vim-surround") -- surround text with character
    use("vim-scripts/ReplaceWithRegister") -- replace text with other text
    use("numToStr/Comment.nvim") -- commenting
    use("nvim-tree/nvim-tree.lua") -- file explorer
    use("nvim-tree/nvim-web-devicons") -- icons
    use("nvim-lualine/lualine.nvim") -- status line
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- telescope fuzzy
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x"}) -- telescope
    use("hrsh7th/nvim-cmp") -- autocomplete
    use("hrsh7th/cmp-buffer") -- autocomplete source (buffer)
    use("hrsh7th/cmp-path") -- autocomplete source (filepath)
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets
    use("williamboman/mason.nvim") -- managing LSPs
    use("williamboman/mason-lspconfig.nvim") -- communicate with config plugin
    use("neovim/nvim-lspconfig") -- config for LSPs
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({"glepnir/lspsaga.nvim", branch = "main"}) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use("jose-elias-alvarez/null-ls.nvim") -- formatting
    use("jayp0521/mason-null-ls.nvim") -- communicate with null-ls plugin
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function() -- treesitter 
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end
    })
    use("windwp/nvim-autopairs") -- auto pair symbols like {}
    use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"}) -- pair html tags
    use("lewis6991/gitsigns.nvim") -- gitsigns    
    use("norcalli/nvim-colorizer.lua") -- colorizer
    use({'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}) -- bracket colorizer
    use("lukas-reineke/indent-blankline.nvim") -- indent colorizer
    use('edluffy/hologram.nvim') -- image viewer
    use('lewis6991/spellsitter.nvim') -- spellcheck
    use {
        "ahmedkhalf/project.nvim",
        config = function() require("project_nvim").setup {} end
    }

    use('github/copilot.vim') -- copilot
    use {"catppuccin/nvim", as = "catppuccin"} -- catppuccin theme
    -- plugins end

    if packer_bootstap then require("packer").sync() end
end)
