local M = {}

function M.load()
  vim.cmd "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
  end

  vim.g.colors_name = "ghostty"

  local palette = {
    [0] = "#1d1f21",
    [1] = "#cc6566",
    [2] = "#b6bd68",
    [3] = "#f0c674",
    [4] = "#82a2be",
    [5] = "#b294bb",
    [6] = "#8abeb7",
    [7] = "#c4c8c6",
    [8] = "#666666",
    [9] = "#d54e53",
    [10] = "#b9ca4b",
    [11] = "#e7c547",
    [12] = "#7aa6da",
    [13] = "#c397d8",
    [14] = "#70c0b1",
    [15] = "#eaeaea",
  }

  local colors = {
    bg = "#282c34",
    fg = "#ffffff",
    cursor = "#ffffff",
    cursor_text = "#353a44",
    sel_bg = "#ffffff",
    sel_fg = "#282c34",
    -- sel_fg = "#404755", -- copied
    -- copied
    inactive_bg = "#22252a", -- inactive background
    error_bg = "#3a2a2a", -- error background
    warn_bg = "#3a3a2a", -- warning background
    info_bg = "#2a3a3a",
  }

  local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core UI Elements
  set_hl("Normal", { fg = colors.fg, bg = colors.bg })
  set_hl("NormalNC", { fg = palette[7], bg = colors.inactive_bg })
  set_hl("NormalFloat", { fg = colors.fg, bg = palette[0] })
  set_hl("FloatBorder", { fg = palette[8], bg = palette[0] })
  set_hl("FloatTitle", { fg = palette[12], bold = true })
  set_hl("FloatShadow", { bg = "#000000", blend = 80 })
  set_hl("FloatShadowThrough", { bg = "#000000", blend = 100 })
  set_hl("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
  set_hl("CursorIM", { fg = colors.cursor_text, bg = colors.cursor })
  set_hl("lCursor", { fg = colors.cursor_text, bg = colors.cursor })
  set_hl("Visual", { fg = colors.sel_fg, bg = colors.sel_bg })
  set_hl("VisualNOS", { bg = "#555555" })
  set_hl("LineNr", { fg = palette[8] })
  set_hl("LineNrAbove", { fg = palette[8] })
  set_hl("LineNrBelow", { fg = palette[8] })
  set_hl("CursorLine", { bg = palette[0] })
  set_hl("CursorColumn", { bg = palette[0] })
  set_hl("CursorLineNr", { fg = palette[7], bold = true })
  set_hl("CursorLineSign", { bg = palette[0] })
  set_hl("CursorLineFold", { bg = palette[0] })
  set_hl("ColorColumn", { bg = palette[0] })
  set_hl("SignColumn", { fg = palette[8], bg = colors.bg })
  set_hl("Folded", { fg = palette[8], bg = palette[0], italic = true })
  set_hl("FoldColumn", { fg = palette[8], bg = colors.bg })
  set_hl("Conceal", { fg = palette[4], bg = colors.bg })
  set_hl("NonText", { fg = palette[8] })
  set_hl("SpecialKey", { fg = palette[8] })
  set_hl("EndOfBuffer", { fg = palette[8] })
  set_hl("Whitespace", { fg = palette[8] })
  set_hl("ModeMsg", { fg = palette[7], bold = true })
  set_hl("MoreMsg", { fg = palette[10], bold = true })
  set_hl("Question", { fg = palette[11], bold = true })
  set_hl("MsgArea", { fg = palette[7] })
  set_hl("MsgSeparator", { fg = palette[8], bg = palette[0] })
  set_hl("ErrorMsg", { fg = palette[15], bg = palette[1], bold = true })
  set_hl("WarningMsg", { fg = palette[15], bg = palette[0] })

  -- Statusline and Tabline
  set_hl("StatusLine", { fg = palette[7], bg = palette[0] })
  set_hl("StatusLineNC", { fg = palette[8], bg = colors.inactive_bg })
  set_hl("StatusLineTerm", { fg = palette[7], bg = palette[0] })
  set_hl("StatusLineTermNC", { fg = palette[8], bg = colors.inactive_bg })
  set_hl("TabLine", { fg = palette[8], bg = palette[0] })
  set_hl("TabLineSel", { fg = palette[15], bg = colors.bg, bold = true })
  set_hl("TabLineFill", { bg = palette[0] })
  set_hl("VertSplit", { fg = palette[8] })
  set_hl("WinSeparator", { fg = palette[8] })
  set_hl("WinBar", { fg = palette[7], bg = palette[0] })
  set_hl("WinBarNC", { fg = palette[8], bg = colors.inactive_bg })

  -- Popup Menu
  set_hl("Pmenu", { fg = colors.fg, bg = palette[0] })
  set_hl("PmenuSel", { fg = colors.bg, bg = palette[7] })
  set_hl("PmenuSbar", { bg = palette[8] })
  set_hl("PmenuThumb", { bg = palette[7] })
  set_hl("PmenuKind", { fg = palette[11] })
  set_hl("PmenuKindSel", { fg = palette[11], bg = palette[7] })
  set_hl("PmenuExtra", { fg = palette[8] })
  set_hl("PmenuExtraSel", { fg = palette[8], bg = palette[7] })
  set_hl("WildMenu", { fg = colors.bg, bg = palette[12], bold = true })

  -- Search and Diff
  set_hl("Search", { fg = palette[0], bg = palette[9] })
  set_hl("IncSearch", { fg = palette[0], bg = palette[3] })
  set_hl("CurSearch", { fg = palette[0], bg = palette[11], bold = true })
  set_hl("Substitute", { fg = palette[0], bg = palette[11] })
  set_hl("DiffAdd", { fg = palette[2], bg = "#2a3a2a" })
  set_hl("DiffChange", { fg = palette[3], bg = "#3a3a2a" })
  set_hl("DiffDelete", { fg = palette[1], bg = "#3a2a2a" })
  set_hl("DiffText", { fg = palette[11], bg = "#4a4a2a", bold = true })
  set_hl("diffAdded", { fg = palette[2] })
  set_hl("diffRemoved", { fg = palette[1] })
  set_hl("diffChanged", { fg = palette[3] })
  set_hl("diffFile", { fg = palette[4] })
  set_hl("diffNewFile", { fg = palette[10] })
  set_hl("diffLine", { fg = palette[7] })
  set_hl("diffSubname", { fg = palette[8] })

  -- Syntax Highlighting
  set_hl("Comment", { fg = palette[8], italic = true })
  set_hl("Constant", { fg = palette[6] })
  set_hl("String", { fg = palette[2] })
  set_hl("Character", { fg = palette[2] })
  set_hl("Number", { fg = palette[6] })
  set_hl("Boolean", { fg = palette[6] })
  set_hl("Float", { fg = palette[6] })
  set_hl("Identifier", { fg = palette[15] })
  set_hl("Function", { fg = palette[12] })
  set_hl("Statement", { fg = palette[5] })
  set_hl("Conditional", { fg = palette[5] })
  set_hl("Repeat", { fg = palette[5] })
  set_hl("Label", { fg = palette[5] })
  set_hl("Operator", { fg = palette[7] })
  set_hl("Keyword", { fg = palette[5] })
  set_hl("Exception", { fg = palette[5] })
  set_hl("PreProc", { fg = palette[3] })
  set_hl("Include", { fg = palette[3] })
  set_hl("Define", { fg = palette[3] })
  set_hl("Macro", { fg = palette[3] })
  set_hl("PreCondit", { fg = palette[3] })
  set_hl("Type", { fg = palette[11] })
  set_hl("StorageClass", { fg = palette[11] })
  set_hl("Structure", { fg = palette[11] })
  set_hl("Typedef", { fg = palette[11] })
  set_hl("Special", { fg = palette[6] })
  set_hl("SpecialChar", { fg = palette[6] })
  set_hl("Tag", { fg = palette[9] })
  set_hl("Delimiter", { fg = palette[7] })
  set_hl("SpecialComment", { fg = palette[8], italic = true })
  set_hl("Debug", { fg = palette[9] })
  set_hl("Underlined", { fg = palette[4], underline = true })
  set_hl("Ignore", { fg = palette[8] })
  set_hl("Title", { fg = palette[12], bold = true })
  set_hl("Directory", { fg = palette[4] })

  -- Diagnostics
  set_hl("Error", { fg = palette[1], bold = true })
  set_hl("Todo", { fg = palette[15], bg = palette[1] })
  set_hl("DiagnosticError", { fg = palette[1] })
  set_hl("DiagnosticWarn", { fg = palette[3] })
  set_hl("DiagnosticInfo", { fg = palette[4] })
  set_hl("DiagnosticHint", { fg = palette[7] })
  set_hl("DiagnosticOk", { fg = palette[2] })
  set_hl("DiagnosticUnderlineError", { sp = palette[1], underline = true })
  set_hl("DiagnosticUnderlineWarn", { sp = palette[3], underline = true })
  set_hl("DiagnosticUnderlineInfo", { sp = palette[4], underline = true })
  set_hl("DiagnosticUnderlineHint", { sp = palette[7], underline = true })
  set_hl("DiagnosticUnderlineOk", { sp = palette[2], underline = true })
  set_hl("DiagnosticVirtualTextError", { fg = palette[1], bg = colors.error_bg })
  set_hl("DiagnosticVirtualTextWarn", { fg = palette[3], bg = colors.warn_bg })
  set_hl("DiagnosticVirtualTextInfo", { fg = palette[4], bg = colors.info_bg })
  set_hl("DiagnosticVirtualTextHint", { fg = palette[7], bg = colors.info_bg })
  set_hl("DiagnosticVirtualTextOk", { fg = palette[2], bg = "#2a3a2a" })
  set_hl("DiagnosticFloatingError", { fg = palette[1], bg = palette[0] })
  set_hl("DiagnosticFloatingWarn", { fg = palette[3], bg = palette[0] })
  set_hl("DiagnosticFloatingInfo", { fg = palette[4], bg = palette[0] })
  set_hl("DiagnosticFloatingHint", { fg = palette[7], bg = palette[0] })
  set_hl("DiagnosticFloatingOk", { fg = palette[2], bg = palette[0] })
  set_hl("DiagnosticSignError", { fg = palette[1], bg = colors.bg })
  set_hl("DiagnosticSignWarn", { fg = palette[3], bg = colors.bg })
  set_hl("DiagnosticSignInfo", { fg = palette[4], bg = colors.bg })
  set_hl("DiagnosticSignHint", { fg = palette[7], bg = colors.bg })
  set_hl("DiagnosticSignOk", { fg = palette[2], bg = colors.bg })

  -- Markdown highlights (used in LSP documentation)
  set_hl("markdownCode", { fg = colors.fg }) -- Inline code
  set_hl("markdownCodeBlock", { fg = colors.fg, bg = palette[0] }) -- Code blocks
  set_hl("markdownH1", { fg = palette[12], bold = true }) -- Headers
  set_hl("markdownH2", { fg = palette[12], bold = true })
  set_hl("markdownH3", { fg = palette[12], bold = true })
  set_hl("markdownLinkText", { fg = palette[4], underline = true }) -- Links
  set_hl("markdownUrl", { fg = palette[4], underline = true })
  set_hl("markdownBold", { fg = colors.fg, bold = true }) -- Bold text
  set_hl("markdownItalic", { fg = colors.fg, italic = true }) -- Italic text

  -- Spell Checking
  set_hl("SpellBad", { sp = palette[1], undercurl = true })
  set_hl("SpellCap", { sp = palette[3], undercurl = true })
  set_hl("SpellRare", { sp = palette[5], undercurl = true })
  set_hl("SpellLocal", { sp = palette[6], undercurl = true })

  -- Match Paren and QuickFix
  set_hl("MatchParen", { fg = palette[15], bg = palette[5], bold = true })
  set_hl("QuickFixLine", { bg = palette[0], bold = true })
  set_hl("qfLineNr", { fg = palette[8] })
  set_hl("qfError", { fg = palette[1] })
  set_hl("qfFileName", { fg = palette[4] })
  set_hl("qfSeparator", { fg = palette[8] })

  -- Treesitter Highlights
  set_hl("@variable", { fg = palette[15] })
  set_hl("@variable.builtin", { fg = palette[9] })
  set_hl("@variable.parameter", { fg = palette[6] })
  set_hl("@variable.member", { fg = palette[4] })
  -- set_hl("@constant", { fg = palette[6] })
  -- set_hl("@constant.builtin", { fg = palette[6] })
  -- set_hl("@constant.macro", { fg = palette[3] })
  -- set_hl("@module", { fg = palette[4] })
  -- set_hl("@module.builtin", { fg = palette[4] })
  -- set_hl("@function", { fg = palette[12] })
  -- set_hl("@function.builtin", { fg = palette[12] })
  -- set_hl("@function.call", { fg = palette[12] })
  -- set_hl("@function.macro", { fg = palette[3] })
  -- set_hl("@function.method", { fg = palette[12] })
  -- set_hl("@function.method.call", { fg = palette[12] })
  -- set_hl("@constructor", { fg = palette[11] })
  -- set_hl("@keyword", { fg = palette[5] })
  -- set_hl("@keyword.coroutine", { fg = palette[5] })
  -- set_hl("@keyword.function", { fg = palette[5] })
  -- set_hl("@keyword.operator", { fg = palette[7] })
  -- set_hl("@keyword.import", { fg = palette[3] })
  -- set_hl("@keyword.storage", { fg = palette[11] })
  -- set_hl("@keyword.repeat", { fg = palette[5] })
  -- set_hl("@keyword.return", { fg = palette[5] })
  -- set_hl("@keyword.debug", { fg = palette[9] })
  -- set_hl("@keyword.exception", { fg = palette[5] })
  -- set_hl("@type", { fg = palette[11] })
  -- set_hl("@type.builtin", { fg = palette[11] })
  -- set_hl("@type.definition", { fg = palette[11] })
  -- set_hl("@type.qualifier", { fg = palette[11] })
  -- set_hl("@property", { fg = palette[4] })
  -- set_hl("@attribute", { fg = palette[3] })
  -- set_hl("@attribute.builtin", { fg = palette[3] })
  -- set_hl("@field", { fg = palette[4] })
  -- set_hl("@punctuation", { fg = palette[7] })
  -- set_hl("@punctuation.bracket", { fg = palette[7] })
  -- set_hl("@punctuation.special", { fg = palette[9] })
  -- set_hl("@punctuation.delimiter", { fg = palette[7] })
  -- set_hl("@string", { fg = palette[2] })
  -- set_hl("@string.documentation", { fg = palette[2], italic = true })
  -- set_hl("@string.escape", { fg = palette[9] })
  -- set_hl("@string.special", { fg = palette[9] })
  -- set_hl("@string.special.symbol", { fg = palette[9] })
  -- set_hl("@string.special.url", { fg = palette[4], underline = true })
  set_hl("@tag", { fg = palette[6] })
  -- set_hl("@tag.attribute", { fg = palette[3] })
  -- set_hl("@tag.delimiter", { fg = palette[7] })
  -- set_hl("@tag.builtin", { fg = palette[9] })
  -- set_hl("@text", { fg = colors.fg })
  -- set_hl("@text.strong", { bold = true })
  -- set_hl("@text.emphasis", { italic = true })
  -- set_hl("@text.underline", { underline = true })
  -- set_hl("@text.strike", { strikethrough = true })
  -- set_hl("@text.title", { fg = palette[12], bold = true })
  -- set_hl("@text.literal", { fg = palette[2] })
  -- set_hl("@text.uri", { fg = palette[4], underline = true })
  -- set_hl("@text.math", { fg = palette[6] })
  -- set_hl("@text.environment", { fg = palette[11] })
  -- set_hl("@text.environment.name", { fg = palette[11] })
  -- set_hl("@text.reference", { fg = palette[4] })
  -- set_hl("@text.todo", { fg = palette[15], bg = palette[1] })
  -- set_hl("@text.note", { fg = palette[15], bg = palette[6] })
  -- set_hl("@text.warning", { fg = palette[0], bg = palette[3] })
  -- set_hl("@text.danger", { fg = palette[15], bg = palette[1] })
  -- set_hl("@text.diff.add", { fg = palette[2] })
  -- set_hl("@text.diff.delete", { fg = palette[1] })

  -- LSP Semantic Tokens
  set_hl("@lsp.type.class", { fg = palette[11] })
  set_hl("@lsp.type.decorator", { fg = palette[12] })
  set_hl("@lsp.type.enum", { fg = palette[11] })
  set_hl("@lsp.type.enumMember", { fg = palette[6] })
  set_hl("@lsp.type.function", { fg = palette[12] })
  set_hl("@lsp.type.interface", { fg = palette[11] })
  set_hl("@lsp.type.macro", { fg = palette[3] })
  set_hl("@lsp.type.method", { fg = palette[12] })
  set_hl("@lsp.type.namespace", { fg = palette[4] })
  set_hl("@lsp.type.parameter", { fg = palette[6] })
  set_hl("@lsp.type.property", { fg = palette[4] })
  set_hl("@lsp.type.struct", { fg = palette[11] })
  set_hl("@lsp.type.type", { fg = palette[11] })
  set_hl("@lsp.type.typeParameter", { fg = palette[11] })
  set_hl("@lsp.type.variable", { fg = palette[15] })
  set_hl("@lsp.type.keyword", { fg = palette[5] })
  set_hl("@lsp.type.number", { fg = palette[6] })
  set_hl("@lsp.type.string", { fg = palette[2] })
  set_hl("@lsp.type.operator", { fg = palette[7] })
  set_hl("@lsp.type.comment", { fg = palette[8], italic = true })
  set_hl("@lsp.mod.deprecated", { strikethrough = true })
  set_hl("@lsp.type.event", { fg = palette[6] })

  -- LazyVim Default Plugins
  -- Neo-tree (File Explorer)
  set_hl("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  set_hl("NeoTreeNormalNC", { fg = palette[7], bg = colors.inactive_bg })
  set_hl("NeoTreeDirectoryName", { fg = palette[4] })
  set_hl("NeoTreeDirectoryIcon", { fg = palette[4] })
  set_hl("NeoTreeGitAdded", { fg = palette[2] })
  set_hl("NeoTreeGitModified", { fg = palette[3] })
  set_hl("NeoTreeGitDeleted", { fg = palette[1] })
  set_hl("NeoTreeGitRenamed", { fg = palette[13] })
  set_hl("NeoTreeGitUntracked", { fg = palette[6] })
  set_hl("NeoTreeRootName", { fg = palette[7], bold = true })
  set_hl("NeoTreeFloatBorder", { fg = palette[8], bg = palette[0] })
  set_hl("NeoTreeFloatTitle", { fg = palette[12], bg = palette[0] })
  set_hl("NeoTreeFileNameOpened", { fg = palette[12], bold = true })
  set_hl("NeoTreeIndentMarker", { fg = palette[8] })
  set_hl("NeoTreeSymbolicLinkTarget", { fg = palette[6], underline = true })

  -- Telescope (Fuzzy Finder)
  set_hl("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
  set_hl("TelescopeBorder", { fg = palette[8] })
  set_hl("TelescopePromptBorder", { fg = palette[7] })
  set_hl("TelescopeResultsBorder", { fg = palette[8] })
  set_hl("TelescopePreviewBorder", { fg = palette[8] })
  set_hl("TelescopeSelection", { fg = colors.sel_fg, bg = colors.sel_bg })
  set_hl("TelescopeSelectionCaret", { fg = palette[12], bg = colors.sel_bg })
  set_hl("TelescopeMultiSelection", { fg = palette[9] })
  set_hl("TelescopeMatching", { fg = palette[11], bold = true })
  set_hl("TelescopePromptPrefix", { fg = palette[12] })
  set_hl("TelescopePromptTitle", { fg = palette[15], bg = palette[12] })
  set_hl("TelescopeResultsTitle", { fg = palette[15], bg = palette[8] })
  set_hl("TelescopePreviewTitle", { fg = palette[15], bg = palette[4] })

  -- Which-key (Keybinding Hints)
  set_hl("WhichKey", { fg = palette[12] })
  set_hl("WhichKeyGroup", { fg = palette[4] })
  set_hl("WhichKeyDesc", { fg = palette[7] })
  set_hl("WhichKeySeparator", { fg = palette[8] })
  set_hl("WhichKeyFloat", { bg = palette[0] })
  set_hl("WhichKeyValue", { fg = palette[6] })

  -- Gitsigns (Git Integration)
  set_hl("GitSignsAdd", { fg = palette[2], bg = colors.bg })
  set_hl("GitSignsChange", { fg = palette[3], bg = colors.bg })
  set_hl("GitSignsDelete", { fg = palette[1], bg = colors.bg })
  set_hl("GitSignsChangedelete", { fg = palette[5], bg = colors.bg })
  set_hl("GitSignsTopdelete", { fg = palette[1], bg = colors.bg })
  set_hl("GitSignsUntracked", { fg = palette[6], bg = colors.bg })

  -- Bufferline (Buffer Tabs)
  set_hl("BufferLineBackground", { fg = palette[8], bg = palette[0] })
  set_hl("BufferLineBufferSelected", { fg = palette[15], bg = colors.bg, bold = true })
  set_hl("BufferLineBufferVisible", { fg = palette[7], bg = palette[0] })
  set_hl("BufferLineSeparator", { fg = palette[8], bg = palette[0] })
  set_hl("BufferLineIndicatorSelected", { fg = palette[12] })
  set_hl("BufferLineModified", { fg = palette[3] })
  set_hl("BufferLineModifiedSelected", { fg = palette[3], bg = colors.bg })
  set_hl("BufferLineModifiedVisible", { fg = palette[3], bg = palette[0] })
  set_hl("BufferLineCloseButton", { fg = palette[1], bg = palette[0] })
  set_hl("BufferLineCloseButtonSelected", { fg = palette[1], bg = colors.bg })
  set_hl("BufferLineTab", { fg = palette[8], bg = palette[0] })
  set_hl("BufferLineTabSelected", { fg = palette[15], bg = colors.bg })
  set_hl("BufferLineFill", { bg = palette[0] })

  -- nvim-cmp (Completion)
  set_hl("CmpItemAbbr", { fg = palette[7] })
  set_hl("CmpItemAbbrDeprecated", { fg = palette[8], strikethrough = true })
  set_hl("CmpItemAbbrMatch", { fg = palette[12], bold = true })
  set_hl("CmpItemAbbrMatchFuzzy", { fg = palette[12], underline = true })
  set_hl("CmpItemKind", { fg = palette[11] })
  set_hl("CmpItemKindClass", { fg = palette[11] })
  set_hl("CmpItemKindFunction", { fg = palette[12] })
  set_hl("CmpItemKindMethod", { fg = palette[12] })
  set_hl("CmpItemKindVariable", { fg = palette[15] })
  set_hl("CmpItemKindField", { fg = palette[15] })
  set_hl("CmpItemKindProperty", { fg = palette[15] })
  set_hl("CmpItemKindText", { fg = palette[2] })
  set_hl("CmpItemKindEnum", { fg = palette[11] })
  set_hl("CmpItemKindEnumMember", { fg = palette[6] })
  set_hl("CmpItemKindConstant", { fg = palette[6] })
  set_hl("CmpItemKindStruct", { fg = palette[11] })
  set_hl("CmpItemKindEvent", { fg = palette[9] })
  set_hl("CmpItemKindOperator", { fg = palette[7] })
  set_hl("CmpItemKindTypeParameter", { fg = palette[11] })
  set_hl("CmpItemKindSnippet", { fg = palette[9] })
  set_hl("CmpItemMenu", { fg = palette[8] })

  -- Indent-blankline (Indent Guides)
  set_hl("IndentBlanklineChar", { fg = palette[8], nocombine = true })
  set_hl("IndentBlanklineSpaceChar", { fg = palette[8], nocombine = true })
  set_hl("IndentBlanklineContextChar", { fg = palette[12], nocombine = true })
  set_hl("IndentBlanklineContextStart", { sp = palette[12], underline = true })
  set_hl("IndentBlanklineIndent1", { fg = palette[8], nocombine = true })
  set_hl("IndentBlanklineIndent2", { fg = palette[7], nocombine = true })

  -- Mini Plugins (mini.statusline, mini.tabline, mini.starter, etc.)
  set_hl("MiniStatuslineModeNormal", { fg = palette[0], bg = palette[4], bold = true })
  set_hl("MiniStatuslineModeInsert", { fg = palette[0], bg = palette[2], bold = true })
  set_hl("MiniStatuslineModeVisual", { fg = palette[0], bg = palette[5], bold = true })
  set_hl("MiniStatuslineModeReplace", { fg = palette[15], bg = palette[1], bold = true })
  set_hl("MiniStatuslineModeCommand", { fg = palette[0], bg = palette[3], bold = true })
  set_hl("MiniStatuslineFileinfo", { fg = palette[7], bg = palette[0] })
  set_hl("MiniStatuslineDevinfo", { fg = palette[8], bg = palette[0] })
  set_hl("MiniTablineCurrent", { fg = palette[15], bg = colors.bg, bold = true })
  set_hl("MiniTablineVisible", { fg = palette[7], bg = palette[0] })
  set_hl("MiniTablineHidden", { fg = palette[8], bg = palette[0] })
  set_hl("MiniTablineModifiedCurrent", { fg = palette[3], bg = colors.bg })
  set_hl("MiniTablineModifiedVisible", { fg = palette[3], bg = palette[0] })
  set_hl("MiniTablineModifiedHidden", { fg = palette[3], bg = palette[0] })
  set_hl("MiniStarterHeader", { fg = palette[12], bold = true })
  set_hl("MiniStarterFooter", { fg = palette[8] })
  set_hl("MiniStarterItem", { fg = colors.fg })
  set_hl("MiniStarterItemBullet", { fg = palette[7] })
  set_hl("MiniStarterQuery", { fg = palette[11], bold = true })
  set_hl("MiniStarterSection", { fg = palette[4] })
  set_hl("MiniIndentscopeSymbol", { fg = palette[12] })
  set_hl("MiniIndentscopePrefix", { fg = palette[8], nocombine = true })
  set_hl("MiniCursorword", { bg = colors.sel_bg })
  set_hl("MiniTrailspace", { bg = palette[1] })

  -- Noice (Command Line and Notifications)
  set_hl("NoiceCmdline", { fg = colors.fg, bg = palette[0] })
  set_hl("NoiceCmdlineIcon", { fg = palette[12] })
  set_hl("NoiceCmdlinePopupBorder", { fg = palette[8] })
  set_hl("NoiceCmdlinePrompt", { fg = palette[11], bold = true })
  set_hl("NoiceCompletionItemKind", { fg = palette[11] })
  set_hl("NoiceConfirmBorder", { fg = palette[8] })
  set_hl("NoicePopup", { fg = colors.fg, bg = palette[0] })
  set_hl("NoicePopupBorder", { fg = palette[8] })
  set_hl("NoiceScrollbar", { bg = palette[8] })
  set_hl("NoiceScrollbarThumb", { bg = palette[7] })

  -- Notify (Notifications)
  set_hl("NotifyERRORBorder", { fg = palette[1] })
  set_hl("NotifyWARNBorder", { fg = palette[3] })
  set_hl("NotifyINFOBorder", { fg = palette[4] })
  set_hl("NotifyDEBUGBorder", { fg = palette[8] })
  set_hl("NotifyTRACEBorder", { fg = palette[6] })
  set_hl("NotifyERRORIcon", { fg = palette[1] })
  set_hl("NotifyWARNIcon", { fg = palette[3] })
  set_hl("NotifyINFOIcon", { fg = palette[4] })
  set_hl("NotifyDEBUGIcon", { fg = palette[8] })
  set_hl("NotifyTRACEIcon", { fg = palette[6] })
  set_hl("NotifyERRORTitle", { fg = palette[1], bold = true })
  set_hl("NotifyWARNTitle", { fg = palette[3], bold = true })
  set_hl("NotifyINFOTitle", { fg = palette[4], bold = true })
  set_hl("NotifyDEBUGTitle", { fg = palette[8], bold = true })
  set_hl("NotifyTRACETitle", { fg = palette[6], bold = true })
  set_hl("NotifyBackground", { bg = palette[0] })

  -- Trouble (Diagnostics List)
  set_hl("TroubleText", { fg = colors.fg })
  set_hl("TroubleCount", { fg = palette[12], bg = palette[0] })
  set_hl("TroubleNormal", { fg = colors.fg, bg = colors.bg })
  set_hl("TroubleError", { fg = palette[1] })
  set_hl("TroubleWarning", { fg = palette[3] })
  set_hl("TroubleInformation", { fg = palette[4] })
  set_hl("TroubleHint", { fg = palette[7] })
  set_hl("TroubleFoldIcon", { fg = palette[8] })
  set_hl("TroubleIndent", { fg = palette[8] })

  -- Flash (Search Enhanced)
  set_hl("FlashLabel", { fg = palette[15], bg = palette[9], bold = true })
  set_hl("FlashMatch", { fg = colors.fg, bg = colors.sel_bg })
  set_hl("FlashCurrent", { fg = palette[15], bg = palette[11], bold = true })
  set_hl("FlashBackdrop", { fg = palette[8] })

  -- Lualine (Statusline - LazyVim uses it optionally)
  -- set_hl("LuaLineA", { fg = palette[15], bg = palette[4], bold = true })
  -- set_hl("LuaLineB", { fg = palette[7], bg = palette[0] })
  -- set_hl("LuaLineC", { fg = palette[8], bg = palette[0] })
  -- set_hl("LuaLineX", { fg = palette[8], bg = palette[0] })
  -- set_hl("LuaLineY", { fg = palette[7], bg = palette[0] })
  -- set_hl("LuaLineZ", { fg = palette[15], bg = palette[4], bold = true })

  -- Terminal colors
  vim.g.terminal_color_0 = palette[0]
  vim.g.terminal_color_1 = palette[1]
  vim.g.terminal_color_2 = palette[2]
  vim.g.terminal_color_3 = palette[3]
  vim.g.terminal_color_4 = palette[4]
  vim.g.terminal_color_5 = palette[5]
  vim.g.terminal_color_6 = palette[6]
  vim.g.terminal_color_7 = palette[7]
  vim.g.terminal_color_8 = palette[8]
  vim.g.terminal_color_9 = palette[9]
  vim.g.terminal_color_10 = palette[10]
  vim.g.terminal_color_11 = palette[11]
  vim.g.terminal_color_12 = palette[12]
  vim.g.terminal_color_13 = palette[13]
  vim.g.terminal_color_14 = palette[14]
  vim.g.terminal_color_15 = palette[15]
end

return M
