return {
	-- inserts printlns on `cll`
	{ "dennis84/cll" },
	-- show and remove trailing whitespace
	{
		"zakharykaplan/nvim-retrail",
		init = function()
			require("retrail").setup()
		end,
	},
}
