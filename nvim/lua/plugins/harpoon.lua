return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local nmap = require("rh.keymap").nmap
      require("telescope").load_extension "harpoon"

      local harpoon = require "harpoon"

      harpoon:setup {}

      nmap {
        "<leader>hm",
        function()
          harpoon:list():append()
        end,
      }
      nmap {
        "<leader>hl",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      }

      for i = 1, 5 do
        nmap {
          string.format("<leader>%s", i),
          function()
            harpoon:list():select(i)
          end,
        }
      end
    end,
  },
}
