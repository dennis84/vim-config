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
				kotlin_language_server = {
					storagePath = util.root_pattern(unpack(root_files))(vim.fn.expand("%:p:h")),
				},
				eslint = {
					settings = {
						-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
						workingDirectory = { mode = "auto" },
					},
				},
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"kotlin-language-server",
				"prettierd",
			},
		},
	},
}
