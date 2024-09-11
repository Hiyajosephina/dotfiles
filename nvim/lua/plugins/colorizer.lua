return {
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"CatppuccinLavender",
				"CatppuccinSky",
				"CatppuccinTeal",
				"CatppuccinGreen",
				"CatppuccinPeach",
				"CatppuccinRed",
				"CatppuccinPink",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "CatppuccinLavender", { bg = "#b4befe" })
				vim.api.nvim_set_hl(0, "CatppuccinSky", { bg = "#89dceb" })
				vim.api.nvim_set_hl(0, "CatppuccinTeal", { bg = "#94e2d5" })
				vim.api.nvim_set_hl(0, "CatppuccinGreen", { bg = "#a6e3a1" })
				vim.api.nvim_set_hl(0, "CatppuccinPeach", { bg = "#fab387" })
				vim.api.nvim_set_hl(0, "CatppuccinRed", { bg = "#f38ba8" })
				vim.api.nvim_set_hl(0, "CatppuccinPink", { bg = "#f5c2e7" })
			end)

			require("ibl").setup({ indent = { highlight = highlight, tab_char = "▎" } })
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("rainbow-delimiters.setup").setup()
		end,
	},
}
