local nord_config = {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local user_settings = require("user-settings")

    vim.g.nord_disable_background = user_settings.transparent_background
    vim.g.nord_italic = false
    require("nord").set()
    vim.opt.termguicolors = true
    vim.cmd([[colorscheme nord]])
  end,
}

local catppuccin_config = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local user_settings = require("user-settings")

    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = user_settings.transparent_background,
      default_integrations = true,
      integrations = {
        nvimtree = true,
        mason = true,
        notify = true,
        dashboard = true,
        treesitter = true,
        which_key = true,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}

local function select_theme()
  local theme = require("user-settings").theme
  local sys_params = require("system-params")
  if theme == sys_params.available_themes.catppuccin then
    return catppuccin_config
  end
  if theme == sys_params.available_themes.nord then
    return nord_config
  end
end

return select_theme()
