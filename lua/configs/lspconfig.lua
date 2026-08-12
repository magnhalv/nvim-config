vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.config("dartls", {
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
})

vim.lsp.config("pylsp", {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        mccabe = { enabled = false },
      },
    },
  },
})

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "dartls",
  "rust_analyzer",
  "pylsp",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
