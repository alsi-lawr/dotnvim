return {
	"blazkowolf/gruber-darker.nvim",
	priority = 1000,
	config = function()
		require("gruber-darker").setup()
		vim.cmd("colorscheme gruber-darker")
	end,
}
