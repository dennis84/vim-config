return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		init = function()
			vim.keymap.set("n", "-", ":Neotree position=current<cr>", { desc = "Open neo-tree" })
		end,
	},
}
