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
      if buf.changed == 1 then
        local name = buf.name ~= "" and buf.name or "[No Name]"
        local choice = vim.fn.confirm(
          "Save changes to " .. name .. "?",
          "&Save\n&Discard\n&Skip",
          3
        )
        if choice == 1 then
          vim.api.nvim_buf_call(buf.bufnr, function() vim.cmd "write" end)
          vim.api.nvim_buf_delete(buf.bufnr, {})
        elseif choice == 2 then
          vim.api.nvim_buf_delete(buf.bufnr, { force = true })
        end
        -- choice == 3 (Skip): do nothing
      else
        vim.api.nvim_buf_delete(buf.bufnr, {})
      end
    end
  end
end

vim.api.nvim_create_user_command("CloseAllOtherBuffers", CloseOtherBuffers, {})

local map = vim.keymap.set
map(
  "n",
  "<Leader>bd",
  ":lua CloseOtherBuffers()<CR>",
  { desc = "Close all other buffers", noremap = true, silent = true }
)

map("n", "<Leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", { desc= "Switch Source/Header C/C++"})

