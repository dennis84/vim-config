return {
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<Esc>"] = "actions.close",
			},
		},
		init = function()
			-- vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open Oil (press '-' again for parent dir)" })
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
		config = function(this)
			require("oil").setup(this.opts)
		end,
	},
}
