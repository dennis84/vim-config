return {
  -- open line in guthub with `<leader>go`
  {
    "ruanyl/vim-gh-line",
    init = function()
      vim.g.gh_line_map = '<leader>go'
    end
  },
}
