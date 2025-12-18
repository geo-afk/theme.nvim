local c = require("theme.colors")

-- Default highlight groups (always applied)
local highlights = {
	TelescopeNormal = { bg = c.ui.float },
	TelescopeBorder = { fg = c.ui.border, bg = c.ui.float },
	TelescopePromptBorder = { fg = c.ui.border, bg = c.ui.float },
	TelescopeResultsBorder = { fg = c.ui.border, bg = c.ui.float },
	TelescopePreviewBorder = { fg = c.ui.border, bg = c.ui.float },

	TelescopePromptNormal = { fg = c.ui.text_active, bg = c.ui.float },
	TelescopePromptPrefix = { fg = c.ui.accent, bg = c.ui.float },

	TelescopeSelection = { fg = c.ui.text_active, bg = c.ui.menu_selection, bold = true },
	TelescopeSelectionCaret = { fg = c.ui.accent, bg = c.ui.menu_selection },

	TelescopeMatching = { fg = c.ui.accent, bold = true },

	TelescopePreviewTitle = { fg = c.ui.base, bg = c.ui.blue, bold = true },
	TelescopePromptTitle = { fg = c.ui.base, bg = c.ui.red, bold = true },
	TelescopeResultsTitle = { fg = c.ui.base, bg = c.ui.green, bold = true },

	-- Diff-like indicators in preview
	TelescopeResultsDiffAdd = { fg = c.ui.green },
	TelescopeResultsDiffChange = { fg = c.ui.yellow },
	TelescopeResultsDiffDelete = { fg = c.ui.red },
}

return highlights
