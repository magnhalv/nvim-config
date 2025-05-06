return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- python
        "python-lsp-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
      },
    },
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "plugins.configs.conform"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "BufEnter",
    opts = function()
      vim.api.nvim_set_keymap("n", ",", "<cmd>lua require'hop'.hint_words()<cr>", {})
    end,
  },
  require "plugins.configs.undo",
  require "plugins.configs.nvim-treesitter-textobjects",
  {
    "natecraddock/sessions.nvim",
    event = "VeryLazy",
    config = function()
      require("sessions").setup {
        events = { "BufEnter" },
        session_filepath = vim.fn.stdpath "data" .. "/sessions",
        absolute = true,
      }
    end,
  },
  require "plugins.configs.workspaces",
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
  },
  require "plugins.configs.workspaces",
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
