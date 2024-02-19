local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.api.nvim_set_keymap("n", "\\", "`", { noremap = true, silent = true })

autocmd("VimEnter", {
  pattern = "*",
  command = "hi Normal ctermbg=none guibg=none",
})

