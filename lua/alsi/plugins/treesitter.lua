return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c_sharp",
				"csv",
				"diff",
				"editorconfig",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitattributes",
				"gitignore",
				"php",
				"powershell",
				"python",
				"regex",
			},
			incremental_selections = {
				enable = true,
				keymaps = {
					init_selection = "<C-^[[C>",
					node_incremental = "<C-^[[C>",
					scope_incremental = false,
					node_decremental = "<C-^[[D>",
				},
			},
		})

		local parsers = require("nvim-treesitter.parsers")
		parsers.get_parser_configs().jinja2 = {
			install_info = {
				url = "https://github.com/dbt-labs/tree-sitter-jinja2",
				files = { "src/parser.c" },
				branch = "main",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
			filetype = "jinja2",
		}

		local au = vim.api.nvim_create_augroup("jinja", { clear = true })

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			group = au,
			pattern = { "*.yaml.jinja" },
			callback = function()
				vim.bo.filetype = "jinja2"
			end,
		})
	end,
}
