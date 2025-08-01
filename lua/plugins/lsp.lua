local util = require("lspconfig.util")

local root_files = {
	"settings.gradle", -- Gradle (multi-project)
	"settings.gradle.kts", -- Gradle (multi-project)
	"build.xml", -- Ant
	"pom.xml", -- Maven
	"build.gradle", -- Gradle
	"build.gradle.kts", -- Gradle
}

return {
	{
		"nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				kotlin_lsp = {},
				eslint = {
					settings = {
						-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
						workingDirectory = { mode = "auto" },
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			-- Add kotlin_lsp if not already configured
			if not configs.kotlin_lsp then
				configs.kotlin_lsp = {
					default_config = {
						cmd = { "kotlin-lsp", "--stdio" },
						filetypes = { "kotlin" },
						root_dir = lspconfig.util.root_pattern(
							"settings.gradle", -- Gradle (multi-project)
							"settings.gradle.kts", -- Gradle (multi-project)
							"pom.xml", -- Maven
							"build.gradle", -- Gradle
							"build.gradle.kts", -- Gradle
							"workspace.json" -- Used to integrate your own build system
						),
						settings = {},
					},
				}
			end

			-- Setup the server
			lspconfig.kotlin_lsp.setup(opts.servers.kotlin_lsp or {})
		end,
	},
}
