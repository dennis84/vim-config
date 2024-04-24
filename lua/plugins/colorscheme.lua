return {
	{
		"folke/tokyonight.nvim",
		opts = { style = "moon" },
	},
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.cmd("colorscheme tokyonight-moon")
			end,
			set_light_mode = function()
				vim.cmd("colorscheme tokyonight-day")
			end,
		},
		init = function()
			require("auto-dark-mode").init()
		end,
	},
}
