---@class ghostty.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias ghostty.Highlights table<string,ghostty.Highlight|string>

---@alias ghostty.HighlightsFn fun(colors: ColorScheme, opts:ghostty.Config):ghostty.Highlights

---@class ghostty.Cache
---@field groups ghostty.Highlights
---@field inputs table
