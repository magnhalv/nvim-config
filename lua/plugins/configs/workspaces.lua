return {
  "natecraddock/workspaces.nvim",
  lazy = false,
  dependencies = { "natecraddock/sessions.nvim" },
  config = function()
    require("workspaces").setup {
      auto_open = true,
      hooks = {
        open_pre = {
          -- If recording, save current session state and stop recording
          function()
            require("sessions").stop_autosave()
          end,

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
