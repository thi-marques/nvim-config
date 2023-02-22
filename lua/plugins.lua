---@diagnostic disable: undefined-global
local ok, packer = pcall(require, "packer")
if not ok then
	print("Packer not founded. I'll try to install it")
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd('packadd packer.nvim')
end

-- CoC extesions
vim.g.coc_global_extensions = {
	'coc-snippets',
	'coc-json',
	'coc-prettier',
	'coc-tsserver',
	'coc-java',
	'coc-lua'
}

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Nord Theme
	use("arcticicestudio/nord-vim")

	-- Colors for hex, rgb, hsl, etc.
	use('brenoprata10/nvim-highlight-colors')

	-- Lualine
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})

	-- Coc
	use({ 'neoclide/coc.nvim', branch = 'release' })

	-- JSONC
	use('neoclide/jsonc.vim')

	-- Visual Multi
	use('mg979/vim-visual-multi')

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter Syntax Highlighting
	use("nvim-treesitter/nvim-treesitter")

	-- Auto pairs and surround
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use('tpope/vim-surround')

	-- Comments
	use('tpope/vim-commentary')

	-- Indicate when a file is modified
	use("lewis6991/gitsigns.nvim")

	-- Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		requires = { { "lewis6991/gitsigns.nvim" } },
	})

	-- NERDTree
	use("preservim/nerdtree")
	use("ryanoasis/vim-devicons")

	if packer_bootstrap then
		packer.sync()
	end
end
)
