return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
			servers = {
				-- kotlin_language_server = {},
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
				-- "kotlin-language-server",
				"prettierd",
			},
		},
	},
}
