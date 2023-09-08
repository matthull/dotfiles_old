-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
  { "RRethy/nvim-treesitter-endwise" },
  { "machakann/vim-sandwich" },
  { "stevearc/dressing.nvim" },
  { "rcarriga/nvim-notify" },
  { "tpope/vim-rails" },
  { "klen/nvim-test" },
  {"lukas-reineke/lsp-format.nvim"}
}

vim.notify = require("notify")

-- Remap access to insert and EX modes
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.normal_mode[";"] = ":"

-- Send keys to nvim terminal ALT-1
lvim.builtin.which_key.mappings["d"] = {
  "<cmd>ToggleTermSendCurrentLine 0<cr>", "Send Line"
}
lvim.builtin.which_key.mappings["x"] = {
  "<cmd>ToggleTermSendVisualLines 0<cr>", "Send Visual Lines"
}

-- Beginning/end of line shortcuts
lvim.keys.normal_mode["<C-h>"] = "^"
lvim.keys.normal_mode["<C-l>"] = "$"

require('nvim-treesitter.configs').setup {
  endwise = {
    enable = true,
  },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Rails",
  a = { "<cmd>A<cr>", "Alternate" },
  r = { "<cmd>R<cr>", "Related" }
}

require('nvim-test').setup {
  run = true,                 -- run tests (using for debug)
  commands_create = true,     -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
  silent = false,             -- less notifications
  term = "toggleterm",        -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96,               -- terminal's width (for vertical|float)
    height = 12,              -- terminal's height (for horizontal|float)
    go_back = false,          -- return focus to original window after executing
    stopinsert = true,        -- exit from insert mode (true|false|"auto")
    keep_one = true,          -- keep only one terminal for testing
  },
  runners = {                 -- setup tests runners
    ruby = "nvim-test.runners.rspec",
  }
}

require('nvim-test.runners.rspec'):setup {
  command = "docker",
  args = { "exec", "-ti", "-e", "RAILS_ENV=test", "-e", "RUBYOPT=-W0", "musashi-web-1", "bundle", "exec", "rspec" },
  file_pattern = "\\v(test/.*|(_spec))\\.(rb)$",
  find_files = { "{name}_spec.{ext}" },
  filename_modifier = nil,
  working_directory = nil,
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Test",
  f = { "<cmd>TestFile<cr>", "Run Tests for Current File" }
}

lvim.builtin.which_key.mappings["k"] = { "<C-l><C-w>k", "Leave Terminal" }

require("lsp-format").setup {}
require("lspconfig").solargraph.setup { on_attach = require("lsp-format").on_attach }

vim.g.rails_projections = {
  ["app/controllers/app/api/*_controller.rb"] = {
    test = {
      "spec/requests/app/api/{}_controller_spec.rb"
    }
  },
  ["app/controllers/users/*_controller.rb"] = {
    test = {
      "spec/requests/users/{}_controller_spec.rb"
    }
  },
  ["spec/requests/app/api/*_spec.rb"] = {
    alternate = {
      "app/controllers/app/api/{}.rb"
    }
  },
  ["spec/requests/users/*_spec.rb"] = {
    alternate = {
      "app/controllers/users/{}.rb"
    }
  }
}
