return {
  {
    "ThePrimeagen/harpoon",
    version = "*",
    config = function()
      local nmap = require("rh.keymap").nmap
      require("telescope").load_extension "harpoon"

      require("harpoon").setup {}

      nmap { "<leader>hm", require("harpoon.mark").add_file }
      nmap { "<leader>hl", require("harpoon.ui").toggle_quick_menu }

      for i = 1, 5 do
        nmap {
          string.format("<leader>%s", i),
          function()
            require("harpoon.ui").nav_file(i)
          end,
        }
      end
    end,
  },
}
