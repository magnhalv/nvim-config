require "nvchad.mappings"

function CloseOtherBuffers()
  local current_buf = vim.fn.bufnr "%"
  for _, buf in ipairs(vim.fn.getbufinfo { bufloaded = true }) do
    if buf.bufnr ~= current_buf then
      vim.api.nvim_buf_delete(buf.bufnr, {})
    end
  end
end

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map(
  "n",
  "<Leader>bd",
  ":lua CloseOtherBuffers()<CR>",
  { desc = "Close all other buffers", noremap = true, silent = true }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
