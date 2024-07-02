return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { 'mason.nvim', 'hrsh7th/nvim-cmp' },

  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({})

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,


      ["ansiblels"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.ansiblels.setup({
          filetypes = { "yaml", "yml" },
          capabilities = capabilities,
        })
      end,

      ["pyright"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({
          capabilities = capabilities,
        })
      end,


      ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        })
      end


    })
  end
}
