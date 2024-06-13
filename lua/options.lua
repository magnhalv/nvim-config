require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd

vim.opt.relativenumber = true
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.g.neovide_scale_factor = 0.75

autocmd("VimEnter", {
  callback = function()
    local conf = require("telescope.config").values
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local pickers = require "telescope.pickers"

    local flatten = vim.tbl_flatten

    -- i would like to be able to do telescope
    -- and have telescope do some filtering on files and some grepping

    function RG_WITH_FILTER(opts)
      opts = opts or {}
      opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
      opts.shortcuts = opts.shortcuts
        or {
          ["l"] = "*.lua",
          ["v"] = "*.vim",
          ["n"] = "*.{vim,lua}",
          ["c"] = "*.c",
          ["r"] = "*.rs",
          ["g"] = "*.go",
          ["cpp"] = "*.cpp",
          ["hpp"] = "*.hpp",
          ["py"] = "*.py",
        }
      opts.pattern = opts.pattern or "%s"

      local custom_grep = finders.new_async_job {
        command_generator = function(prompt)
          if not prompt or prompt == "" then
            return nil
          end

          local prompt_split = vim.split(prompt, "  ")

          local args = { "rg" }
          if prompt_split[1] then
            table.insert(args, "-e")
            table.insert(args, prompt_split[1])
          end

          if prompt_split[2] then
            table.insert(args, "-g")

            local pattern
            if opts.shortcuts[prompt_split[2]] then
              pattern = opts.shortcuts[prompt_split[2]]
            else
              pattern = prompt_split[2]
            end

            table.insert(args, string.format(opts.pattern, pattern))
          end

          return flatten {
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
          prompt_title = "Live Grep (with shortcuts)",
          finder = custom_grep,
          previewer = conf.grep_previewer(opts),
          sorter = require("telescope.sorters").empty(),
        })
        :find()
    end
    vim.api.nvim_create_user_command("RgWithFilter", RG_WITH_FILTER, {})
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
