return {
  "natecraddock/workspaces.nvim",
  event = "VeryLazy",
  lazy = false,
  config = function()
    require("workspaces").setup {
      hooks = {
        open_pre = {
          -- If recording, save current session state and stop recording
          "SessionsStop",

          -- delete all buffers (does not save changes)
          "silent %bdelete!",
        },
        open = function()
          require("sessions").load(nil, { silent = true })
        end,
      },
    }

    require("telescope").load_extension "workspaces"
    vim.keymap.set("n", "<leader>W", ":Telescope workspaces<CR>", { desc = "Open workspaces window" })
  end,
}
