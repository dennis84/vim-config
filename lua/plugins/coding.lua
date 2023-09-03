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

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
      },
    },
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates" },
      }))
    end,
  }
}
