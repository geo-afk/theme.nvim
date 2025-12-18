local M = {}

local c = require("theme.colors")
local blink_highlights = require("theme.blink")
function M.setup()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "cd-theme"

	local hl = vim.api.nvim_set_hl
	local link = function(name, target)
		hl(0, name, { link = target })
	end

	local function set(name, opts)
		hl(0, name, opts)
	end

	-- ===========================
	-- Editor UI
	-- ===========================
	set("Normal", { fg = c.ui.text_active, bg = c.ui.base })
	set("NormalFloat", { fg = c.ui.text_active, bg = c.ui.float })
	set("NormalNC", { fg = c.ui.text_inactive, bg = c.ui.base })

	set("CursorLine", { bg = c.ui.current_line }) -- Subtle highlight restored
	set("CursorColumn", { bg = c.ui.current_line })
	set("ColorColumn", { bg = c.ui.current_line })
	set("CursorLineNr", { fg = c.ui.text_active, bold = true })
	set("LineNr", { fg = c.ui.none_text })

	set("Visual", { bg = c.ui.selection })
	set("VisualNOS", { bg = c.ui.selection })

	set("WinSeparator", { fg = c.ui.border })
	set("VertSplit", { fg = c.ui.split, bg = c.ui.split })
	set("SignColumn", { bg = c.ui.base })
	set("FoldColumn", { fg = c.ui.none_text, bg = c.ui.base })
	set("Folded", { fg = c.ui.text_inactive, bg = c.ui.highlight })

	set("StatusLine", { fg = c.ui.text_active, bg = c.ui.base })
	set("StatusLineNC", { fg = c.ui.text_inactive, bg = c.ui.base })
	set("TabLine", { fg = c.ui.text_inactive, bg = c.ui.tabline })
	set("TabLineFill", { bg = c.ui.tabline })
	set("TabLineSel", { fg = c.ui.accent, bg = c.ui.base, bold = true })

	set("FloatBorder", { fg = c.ui.border, bg = c.ui.float })
	set("FloatTitle", { fg = c.ui.blue, bg = c.ui.float, bold = true })

	set("Pmenu", { fg = c.ui.text_active, bg = c.ui.float })
	set("PmenuSel", { fg = c.ui.text_active, bg = c.ui.menu_selection, bold = true })
	set("PmenuSbar", { bg = c.ui.highlight })
	set("PmenuThumb", { bg = c.ui.accent })

	set("Search", { fg = c.ui.base, bg = c.syntax.yellow, bold = true })
	set("IncSearch", { fg = c.ui.base, bg = c.syntax.orange, bold = true })
	set("CurSearch", { fg = c.ui.base, bg = c.ui.red, bold = true })

	set("MatchParen", { fg = c.ui.accent, bg = c.ui.highlight, bold = true })
	set("NonText", { fg = c.ui.none_text })
	set("EndOfBuffer", { fg = c.ui.base })

	-- Diff
	set("DiffAdd", { fg = c.ui.base, bg = c.ui.green })
	set("DiffChange", { fg = c.ui.base, bg = c.ui.blue })
	set("DiffDelete", { fg = c.ui.base, bg = c.ui.red })
	set("DiffText", { fg = c.ui.base, bg = c.ui.cyan, bold = true })

	-- Spell
	set("SpellBad", { undercurl = true, sp = c.ui.red })
	set("SpellCap", { undercurl = true, sp = c.ui.yellow })
	set("SpellLocal", { undercurl = true, sp = c.ui.cyan })
	set("SpellRare", { undercurl = true, sp = c.ui.purple })

	-- ===========================
	-- Syntax (legacy)
	-- ===========================
	set("Comment", { fg = c.syntax.comment, italic = true })

	set("Constant", { fg = c.syntax.orange })
	set("String", { fg = c.syntax.green })
	set("Number", { fg = c.syntax.orange })
	set("Boolean", { fg = c.syntax.orange })

	set("Identifier", { fg = c.syntax.red })
	set("Function", { fg = c.syntax.blue })

	set("Statement", { fg = c.syntax.purple })
	set("Keyword", { fg = c.syntax.purple })
	set("Conditional", { fg = c.syntax.purple })
	set("Repeat", { fg = c.syntax.purple })
	set("Operator", { fg = c.syntax.text })

	set("PreProc", { fg = c.syntax.cyan })
	set("Type", { fg = c.syntax.cyan })
	set("Special", { fg = c.syntax.yellow })

	set("Error", { fg = c.ui.red, bold = true })
	set("Todo", { fg = c.syntax.yellow, bold = true })

	-- ===========================
	-- Treesitter
	-- ===========================
	link("@comment", "Comment")
	link("@string", "String")
	link("@string.regex", "Special")
	link("@string.escape", "Special")
	link("@function", "Function")
	link("@function.builtin", "Special")
	link("@function.macro", "Macro")
	link("@keyword", "Keyword")
	link("@keyword.function", "Keyword")
	link("@keyword.return", "Keyword")
	link("@type", "Type")
	link("@type.builtin", "Type")
	link("@constant", "Constant")
	link("@constant.builtin", "Constant")
	link("@punctuation.delimiter", "Normal")
	link("@punctuation.bracket", "Normal")

	-- Better variable distinction
	set("@variable", { fg = c.ui.text_active })
	set("@variable.builtin", { fg = c.syntax.orange }) -- self, this, etc.
	set("@parameter", { fg = c.syntax.text, italic = true })
	set("@property", { fg = c.syntax.cyan })

	set("@constructor", { fg = c.syntax.cyan })
	set("@text.title", { fg = c.ui.accent, bold = true })
	set("@text.uri", { fg = c.ui.blue, underline = true })

	-- ===========================
	-- LSP / Diagnostics
	-- ===========================
	set("DiagnosticError", { fg = c.ui.red })
	set("DiagnosticWarn", { fg = c.ui.yellow })
	set("DiagnosticInfo", { fg = c.ui.blue })
	set("DiagnosticHint", { fg = c.ui.cyan })

	set("DiagnosticVirtualTextError", { fg = c.ui.red })
	set("DiagnosticVirtualTextWarn", { fg = c.ui.yellow })
	set("DiagnosticVirtualTextInfo", { fg = c.ui.blue })
	set("DiagnosticVirtualTextHint", { fg = c.ui.cyan })

	set("DiagnosticUnderlineError", { undercurl = true, sp = c.ui.red })
	set("DiagnosticUnderlineWarn", { undercurl = true, sp = c.ui.yellow })
	set("DiagnosticUnderlineInfo", { undercurl = true, sp = c.ui.blue })
	set("DiagnosticUnderlineHint", { undercurl = true, sp = c.ui.cyan })

	set("LspInlayHint", { fg = c.syntax.comment })

	-- ===========================
	-- Plugin-specific
	-- ===========================
	-- GitSigns
	set("GitSignsAdd", { fg = c.ui.green })
	set("GitSignsChange", { fg = c.ui.blue })
	set("GitSignsDelete", { fg = c.ui.red })

	-- Telescope
	set("TelescopeBorder", { fg = c.ui.border, bg = c.ui.float })
	set("TelescopeNormal", { bg = c.ui.float })
	set("TelescopeSelection", { fg = c.ui.text_active, bg = c.ui.menu_selection })
	set("TelescopeMatching", { fg = c.ui.accent, bold = true })

	-- NvimTree
	set("NvimTreeNormal", { bg = c.ui.float })
	set("NvimTreeRootFolder", { fg = c.ui.accent, bold = true })
	set("NvimTreeFolderName", { fg = c.ui.blue })
	set("NvimTreeOpenedFolderName", { fg = c.ui.blue, bold = true })
	set("NvimTreeGitNew", { fg = c.ui.green })
	set("NvimTreeGitDeleted", { fg = c.ui.red })

	-- blink-cmp
	set("CmpItemAbbrMatch", { fg = c.ui.accent, bold = true })
	set("CmpItemKindFunction", { fg = c.syntax.blue })
	set("CmpItemKindMethod", { fg = c.syntax.blue })
	set("CmpItemKindVariable", { fg = c.syntax.red })
	set("CmpItemKindKeyword", { fg = c.syntax.purple })

	-- indent-blankline
	set("IblIndent", { fg = c.ui.none_text, nocombine = true })
	set("IblScope", { fg = c.ui.border, nocombine = true })

	-- Rainbow Delimiters (modern names)
	set("RainbowDelimiter1", { fg = c.ui.red })
	set("RainbowDelimiter2", { fg = c.ui.orange })
	set("RainbowDelimiter3", { fg = c.ui.yellow })
	set("RainbowDelimiter4", { fg = c.ui.green })
	set("RainbowDelimiter5", { fg = c.ui.cyan })
	set("RainbowDelimiter6", { fg = c.ui.blue })
	set("RainbowDelimiter7", { fg = c.ui.purple })

	-- Terminal
	vim.g.terminal_color_0 = c.ui.base
	vim.g.terminal_color_1 = c.ui.red
	vim.g.terminal_color_2 = c.ui.green
	vim.g.terminal_color_3 = c.ui.yellow
	vim.g.terminal_color_4 = c.ui.blue
	vim.g.terminal_color_5 = c.ui.purple
	vim.g.terminal_color_6 = c.ui.cyan
	vim.g.terminal_color_7 = c.ui.text_active
	vim.g.terminal_color_8 = c.ui.gray
	vim.g.terminal_color_9 = c.syntax.red
	vim.g.terminal_color_10 = c.syntax.green
	vim.g.terminal_color_11 = c.syntax.yellow
	vim.g.terminal_color_12 = c.syntax.blue
	vim.g.terminal_color_13 = c.syntax.purple
	vim.g.terminal_color_14 = c.syntax.cyan
	vim.g.terminal_color_15 = c.ui.text_active

	for group, opts in pairs(blink_highlights) do
		hl(0, group, opts)
	end
end

return M
