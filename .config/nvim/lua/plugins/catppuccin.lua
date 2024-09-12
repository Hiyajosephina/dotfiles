return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
			no_italic = false,
			no_bold = false,
			styles = {
				comments = { "italic" },
				conditionals = { "bold" },
				loops = { "bold" },
				functions = { "italic", "bold" },
				keywords = { "bold" },
				strings = { "italic" },
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				lsp_saga = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
