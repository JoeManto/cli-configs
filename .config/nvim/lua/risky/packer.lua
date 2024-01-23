-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'
        use "savq/melange-nvim"
	use { "ellisonleao/gruvbox.nvim" }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	}

	use {
		"kkharji/sqlite.lua"
	}

	use {
		"~/documents/cs/nvim-plugins/bookmark.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

    use {
        "ThePrimeagen/vim-be-good"
    }
end)
