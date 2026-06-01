return {
	"gbprod/nord.nvim",
	priority = 1000, -- make sure this loads first
	config = function()
		require("nord").setup({
			transparent = true,
		})
		vim.cmd("colorscheme nord")
	end,
}
