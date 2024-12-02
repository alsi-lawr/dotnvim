if not vim.g.vscode then
	return {
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
			-- "seblj/roslyn.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local on_attach = require("alsi.core.lsp_keymaps").on_attach

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "󰠠",
					},
				},
				jump = { float = true },
				underline = { severity = vim.diagnostic.severity.INFO },
				update_in_insert = true,
			})
			require("lspconfig").gopls.setup({})
			mason_lspconfig.setup_handlers({
				-- default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["docker_compose_language_service"] = function()
					lspconfig["docker_compose_language_service"].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
								pattern = "docker-compose*",
								command = "set filetype=yaml.docker-compose",
							})

							on_attach(client, bufnr)
						end,
					})
				end,
				["graphql"] = function()
					lspconfig["graphql"].setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
						on_attach = on_attach,
					})
				end,
				["emmet_ls"] = function()
					lspconfig["emmet_ls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
				["bashls"] = function()
					lspconfig["bashls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = { "sh", "zsh" },
					})
				end,
				["dockerls"] = function()
					lspconfig["dockerls"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							docker = {
								languageserver = {
									formatter = {
										ignoreMiltilineInstructions = true,
									},
								},
							},
						},
					})
				end,
			})
		end,
	}
else
	return {}
end
