return {
	"Exafunction/codeium.vim",
	event = { "BufEnter" },
	config = function()
		vim.g.codeium_disable_bindings = 1

		local keymap = vim.keymap
		keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Codeium: Accept suggestion" })
		keymap.set("i", "<c-j>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true, desc = "Codeium: Cycle completions up" })
		keymap.set("i", "<c-k>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true, desc = "Codeium: Cycle completions down" })
		keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true, desc = "Codeium: Clear suggestion" })
	end,
}
