return {
  { "rafamadriz/friendly-snippets", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "-",
        function()
          require("neo-tree.command").execute({
            position = "current",
            reveal = true,
          })
        end,
      },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
