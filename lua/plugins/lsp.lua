return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
			servers = {
				-- kotlin_language_server = {},
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
