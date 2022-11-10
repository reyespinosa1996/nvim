-- Vim editor options 
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Packer installer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end



-- Plugin list to be installed by packer

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'
	
	-- Theme inspired by Atom
	use 'joshdick/onedark.vim'
	
--Other themes
	use 'folke/tokyonight.nvim'
-- Icons themes
	use 'kyazdani42/nvim-web-devicons'

	-- Other Plugins
	
	-- A nice statusbar
	use 'nvim-lualine/lualine.nvim'
	
	-- Code like a pro
	use 'wellle/targets.vim'
	use 'numToStr/Comment.nvim'

	
	use 'tpope/vim-surround'

	-- nvim.tree setup and configuration 
	use 'kyazdani42/nvim-tree.lua'

	-- Telescope doing magic
	use 'nvim-telescope/telescope.nvim'


	--Togleterm stuff 
	use 'akinsho/toggleterm.nvim'
	
	-- vim fugitive a git client
	use 'tpope/vim-fugitive'
	
	-- Others plugins needed
	use 'nvim-lua/plenary.nvim' -- Telescope dependency
	use 'tpope/vim-repeat'
	use 'editorconfig/editorconfig-vim' -- Editor for configuration files

	if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

-- Vim Color Scheme options

vim.opt.termguicolors = true

vim.cmd('colorscheme onedark')

-- Calling and configuring lualine

require('lualine').setup()

-- enabling vim modules
--[[ require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  }, 
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
    'python',
    'c',
  },
})
--]]


	require('Comment').setup({})

	require('nvim-tree').setup({})

	require('toggleterm').setup({
	  open_mapping = '<C-g>',
	  direction = 'float',
	  shade_terminals = true
	})
 



