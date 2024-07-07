return {
	"shaunsingh/nord.nvim",
	lazy = false,
	config = function()
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		require("nord").set()
		vim.opt.termguicolors = true
		vim.cmd([[colorscheme nord]])
	end,
}
