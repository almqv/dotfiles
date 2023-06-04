local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Core
	use "wbthomason/packer.nvim"
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use {
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	}

	-- Themes
	use "savq/melange-nvim"
	use "chriskempson/base16-vim"

	-- LSP
	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		}
	}

	-- Misc
	-- use "vimsence/vimsence"
	use "andweeb/presence.nvim"
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true }
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use "navarasu/onedark.nvim"

	if packer_bootstrap then
		require("packer").sync()
	end
end)
