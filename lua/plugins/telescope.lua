return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'duane9/nvim-rg' },
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')

    -- set keymaps
    local keymap = vim.keymap

    keymap.set('n', '<leader><Space>', telescope_builtin.find_files, {})
    keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
    keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
    keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

  end,
}
