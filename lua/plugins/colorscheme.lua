return {
  'shaunsingh/nord.nvim',
  config = function()
    vim.g.nord_disable_background = true
    require('nord').set()

    require("notify").setup({
      background_colour = "#000000",
    })

    vim.cmd[[colorscheme nord]]
  end
}
