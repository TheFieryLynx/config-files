return {
  'shaunsingh/nord.nvim',
  config = function()
    vim.g.nord_disable_background = true
    require('nord').set()

    vim.cmd[[colorscheme nord]]
  end
}
