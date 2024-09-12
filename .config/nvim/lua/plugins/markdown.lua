return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	config = function()
		vim.keymap.set("n", "<leader>md", "<cmd>RenderMarkdown toggle<CR>", {})
		require("render-markdown").setup()
	end,
}
