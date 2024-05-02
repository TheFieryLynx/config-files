return {
  'nvim-tree/nvim-tree.lua',
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }

    nvtree.setup{
      view = {
        width = 35,
        relativenumber = true,
      },
      git = {
        enable = true
      }
    }
    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
  end,
}