local function find_venv(path)
  local possible_env_names = {}
  possible_env_names[1] = "/.env"
  possible_env_names[2] = "/.venv"
  possible_env_names[3] = "/env"
  possible_env_names[4] = "/venv"

  for _, v in ipairs(possible_env_names) do
    local possible_path = path .. v
    if vim.fn.isdirectory(possible_path) == 1 then
      vim.notify("Found python environment: " .. possible_path)
      return possible_path
    end
  end
  vim.notify("Python environment not found!")
end

local pyright_restarted = false

local function pyright_on_init()
  if not pyright_restarted then
    local cwd = vim.fn.getcwd()
    local current_venv = find_venv(cwd)
    if current_venv then
      vim.fn.setenv('VIRTUAL_ENV', current_venv)

      vim.schedule(function()
        vim.cmd("LspRestart pyright")
        vim.notify("Lsp pyright restarted")
        pyright_restarted = true
      end)
    end
  end
  return true
end

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "mason.nvim", "hrsh7th/nvim-cmp" },

  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({})

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
          filetypes = { "python" },
          on_init = function()
            return pyright_on_init()
          end,
        })
      end,

      ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        })
      end,
    })
  end,
}
