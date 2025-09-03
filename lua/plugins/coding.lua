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
    "L3MON4D3/LuaSnip",
    opts = {
      history = false,
    },
  },
  -- reopen files at your last edit position
  { "farmergreg/vim-lastplace" },
}
