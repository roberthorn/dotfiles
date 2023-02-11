return function ()
  require("catppuccin").setup({
    flavour = "frappe",
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      lightspeed = true,
    }
  })
end

