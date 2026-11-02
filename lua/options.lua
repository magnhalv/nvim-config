require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd

vim.opt.relativenumber = true
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

if vim.g.neovide then
  vim.g.neovide_scale_factor = vim.loop.os_uname().sysname == "Darwin" and 0.95 or 0.75
end

autocmd("VimEnter", {
  callback = function()
    local action_state = require "telescope.actions.state"
    local conf = require("telescope.config").values
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local pickers = require "telescope.pickers"

    local file_globs = {
      l = "*.lua",
      v = "*.vim",
      n = "*.{vim,lua}",
      c = "*.c",
      r = "*.rs",
      g = "*.go",
      cpp = "*.cpp",
      hpp = "*.hpp",
      py = "*.py",
      yml = "*.{yml,yaml}",
      yaml = "*.{yml,yaml}",
    }

    local last_prompt = ""

    local function parse_prompt(prompt)
      local sep = prompt:find("  ", 1, true)
      return sep and vim.trim(prompt:sub(1, sep - 1)) or vim.trim(prompt),
        sep and vim.trim(prompt:sub(sep + 2)) or nil
    end

    local function rg_with_filter(opts)
      opts = opts or {}
      opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
      opts.default_text = last_prompt

      local custom_grep = finders.new_async_job {
        command_generator = function(prompt)
          if not prompt or prompt == "" then
            return nil
          end

          local query, glob = parse_prompt(prompt)
          if query == "" then
            return nil
          end

          local args = { "rg", "-e", query }
          if glob and glob ~= "" then
            table.insert(args, "-g")
            table.insert(args, file_globs[glob] or glob)
          end

          return vim.tbl_flatten {
            args,
            { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
          }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
      }

      pickers
        .new(opts, {
          debounce = 100,
          initial_mode = last_prompt ~= "" and "normal" or "insert",
          prompt_title = "Live Grep (type filter after two spaces)",
          finder = custom_grep,
          previewer = conf.grep_previewer(opts),
          sorter = require("telescope.sorters").empty(),
          attach_mappings = function(prompt_bufnr, _)
            vim.api.nvim_create_autocmd("BufLeave", {
              buffer = prompt_bufnr,
              once = true,
              callback = function()
                local picker = action_state.get_current_picker(prompt_bufnr)
                if picker then
                  last_prompt = picker:_get_prompt()
                end
              end,
            })

            return true
          end,
        })
        :find()
    end

    vim.api.nvim_create_user_command("RgWithFilter", rg_with_filter, {})
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
