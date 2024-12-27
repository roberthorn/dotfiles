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
      theme = "ivy",
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

nmap {
  "<leader>;",
  function()
    require("telescope.builtin").buffers(require("telescope.themes").get_ivy {})
  end,
  { desc = "[;] Find existing buffer" },
}
nmap {
  "<leader>?",
  function()
    require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy {})
  end,
  { desc = "[?] Find recently opened files" },
}
nmap {
  "<leader>/",
  function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy {
      previewer = false,
    })
  end,
  { desc = "[/] Fuzzily search in current buffer" },
}
nmap {
  "<leader>sf",
  function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy {})
  end,
  { desc = "[S]earch [F]iles" },
}
nmap {
  "<leader>sh",
  function()
    require("telescope.builtin").help_tags(require("telescope.themes").get_ivy {})
  end,
  { desc = "[S]earch [H]elp" },
}
nmap {
  "<leader>sw",
  function()
    require("telescope.builtin").grep_string(require("telescope.themes").get_ivy {})
  end,
  { desc = "[S]earch current [W]ord" },
}
nmap {
  "<leader>sg",
  function()
    require("telescope.builtin").live_grep(require("telescope.themes").get_ivy {})
  end,
  { desc = "[S]earch by [G]rep" },
}
nmap {
  "<leader>sd",
  function()
    require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy {})
  end,
  { desc = "[S]earch [D]iagnostics" },
}

-- file browser
nmap { "<leader>fe", require("telescope").extensions.file_browser.file_browser, { desc = "[F]ile [E]xplorer" } }
nmap {
  "<leader>fb",
  function()
    require("telescope").extensions.file_browser.file_browser { select_buffer = true, path = "%:p:h" }
  end,
  { desc = "[F]ile Explorer ([B]uffer)" },
}
