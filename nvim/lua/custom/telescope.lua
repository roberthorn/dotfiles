local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browser = false },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"

local nmap = require("rh.keymap").nmap

nmap { "<leader>;", require("telescope.builtin").buffers, { desc = "[;] Find existing buffer" } }
nmap {
  "<leader>?",
  require("telescope.builtin").oldfiles,
  { desc = "[?] Find recently opened files" },
}
nmap {
  "<leader>/",
  function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end,
  { desc = "[/] Fuzzily search in current buffer" },
}

nmap { "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" } }
nmap { "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" } }
nmap { "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" } }
nmap { "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" } }
nmap { "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" } }

-- file browser
nmap { "<leader>fe", require("telescope").extensions.file_browser.file_browser, { desc = "[F]ile [E]xplorer" } }
nmap {
  "<leader>fb",
  function()
    require("telescope").extensions.file_browser.file_browser { select_buffer = true, path = "%:p:h" }
  end,
  { desc = "[F]ile Explorer ([B]uffer)" },
}
