return {
  'akinsho/bufferline.nvim',
  config = function()
    vim.opt.termguicolors = true

    local highlights = require("nord").bufferline.highlights({
      italic = false,
      bold = true,
      fill = "#181c24",
      buffer_bg = "#000000"
    })

    local buffer = require("bufferline")
    buffer.setup({
      options = {
        separator_style = "thin",
        highlights = highlights,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Nvim Tree",
            separator = true,
            text_align = "left"
          }
        },
        diagnostics = "nvim_lsp",
        modified_icon = '●',
        show_close_icon = true,
        close_icon = '󰅖',
        show_buffer_close_icons = true,
      }
    }
    )
    require("which-key").register({
      ["<leader>h"] = { "<cmd> BufferLineCyclePrev <CR>", "Buffer prev" },
      ["<leader>l"] = { "<cmd> BufferLineCycleNext <CR>", "Buffer next" },
      ["<leader>w"] = { "<cmd> bp|sp|bn|bd! <CR>", "Buffer close" },
    })
  end
}
