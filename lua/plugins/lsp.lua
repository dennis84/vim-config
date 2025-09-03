return {
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "kotlin-lsp" } },
	},
	{
		"nvim-lspconfig",
		opts = function(_, opts)
			local configs = require("lspconfig.configs")
			if not configs.kotlin_lsp then
				local util = require("lspconfig.util")
				configs.kotlin_lsp = {
					default_config = {
						cmd = { "kotlin-lsp", "--stdio" },
						filetypes = { "kotlin" },
						root_dir = util.root_pattern(
							"settings.gradle",
							"settings.gradle.kts",
							"pom.xml",
							"build.gradle",
							"build.gradle.kts",
							"workspace.json"
						),
					},
				}
			end
      opts.inlay_hints = { enabled = false }
			opts.servers = opts.servers or {}
			opts.servers.kotlin_lsp = opts.servers.kotlin_lsp or {}
		end,
	},
}
