return function ()
  require("catppuccin").setup({
    flavour = "macchiato",
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      lightspeed = true,
    }
  })
end

