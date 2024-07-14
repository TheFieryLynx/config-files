return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local user_settings = require("user-settings")
    lualine.setup({
      options = {
        theme = user_settings.theme,
      },
    })
  end,
}
