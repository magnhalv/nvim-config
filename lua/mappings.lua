require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--

function CloseOtherBuffers()
  local current_buf = vim.fn.bufnr "%"
  for _, buf in ipairs(vim.fn.getbufinfo { bufloaded = true }) do
    if buf.bufnr ~= current_buf then
      vim.api.nvim_buf_delete(buf.bufnr, {})
    end
  end
end

local map = vim.keymap.set
map(
  "n",
  "<Leader>bd",
  ":lua CloseOtherBuffers()<CR>",
  { desc = "Close all other buffers", noremap = true, silent = true }
)

map("n", "<Leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", { desc= "Switch Source/Header C/C++"})

