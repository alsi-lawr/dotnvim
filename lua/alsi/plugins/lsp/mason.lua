if not vim.g.vscode then
	return {
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"dockerls",
					"lua_ls",
					"graphql",
					"docker_compose_language_service",
					"jsonls",
					"marksman",
					"powershell_es",
					"sqlls",
					"somesass_ls",
					"bashls",
					"gopls",
					"csharp_ls",
					"rust_analyzer",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"pylint",
					"eslint_d",
					"csharpier",
					"netcoredbg",
					"markdownlint",
					"editorconfig-checker",
					"shfmt",
				},
			})
		end,
	}
else
	return {}
end
