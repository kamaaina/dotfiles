local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- my plugins here
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'ron-rs/ron.vim' -- ron syntax highlighting
  --use 'fannheyward/coc-rust-analyzer'
  --use 'machakann/vim-highlightedyank'  -- FIXME: needed?
  use 'ap/vim-css-color' -- show color in file
  --use {
  --  'neoclide/coc.nvim', branch = 'release',
  --}
  use 'rust-lang/rust.vim'  -- format rust files on save
  use("simrat39/rust-tools.nvim") -- adds extra functionality over rust analyzer
  use 'nvim-treesitter/nvim-treesitter'  -- syntax highlighting

  use { -- lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use "EdenEast/nightfox.nvim" -- color theme

  use { -- autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'

  -- for zig support
  use 'nvim-lua/completion-nvim'
  use 'ziglang/zig.vim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
