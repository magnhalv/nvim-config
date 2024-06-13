local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "glsl_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}


lspconfig["clangd"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
vim.api.nvim_set_keymap("n", "<space>o", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

lspconfig["pylsp"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  settings = {
    -- configure plugins in pylsp
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pylint = { enabled = false },
      },
    },
  },
}

