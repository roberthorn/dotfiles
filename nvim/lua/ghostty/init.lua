local config = require "ghostty.config"

local M = {}

---@param opts? ghostty.Config
function M.load(opts)
  opts = require("ghostty.config").extend(opts)
  vim.o.background = "dark"
  return require("ghostty.theme").setup(opts)
end

M.setup = config.setup

return M
