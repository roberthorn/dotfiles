return {
  {
    "folke/sidekick.nvim",
    lazy = false,
    opts = {
      cli = {
        mux = {
          enabled = true,
          backend = "tmux",
        },
        picker = "telescope",
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle { name = "claude" }
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send { name = "claude", msg = "{this}" }
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send { name = "claude", msg = "{file}" }
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send { name = "claude", msg = "{selection}" }
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt { name = "claude" }
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
