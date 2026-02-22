local diffview = {}

local c = require("ghostty.colors").palette

function diffview.highlights()
  return {
    DiffviewFilePanelInsertions = { fg = c.aurora.green },
    DiffviewFilePanelDeletions = { fg = c.aurora.red },
    DiffviewStatusModified = { fg = c.aurora.yellow },
  }
end

return diffview
