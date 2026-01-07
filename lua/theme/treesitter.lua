local c = require("theme.colors")

return {
	-- String escape sequences and format specifiers
	["@string.escape"] = { fg = c.ui.text_active }, -- or link = "@variable"
	["@string.special"] = { fg = c.ui.text_active },
	["@string.special.symbol"] = { fg = c.ui.text_active },

	-- Variables
	["@variable"] = { fg = c.ui.text_active },
	["@variable.builtin"] = { fg = c.syntax.orange }, -- self, this, etc.
	["@variable.parameter"] = { fg = c.syntax.text, italic = true },
	["@variable.member"] = { fg = c.syntax.cyan }, -- field/property
	["@variable.member.key"] = { fg = c.syntax.cyan },

	-- Modules
	["@module"] = { fg = c.syntax.red },

	-- Constants
	["@constant"] = { fg = c.syntax.orange },
	["@constant.builtin"] = { fg = c.syntax.orange },
	["@constant.macro"] = { fg = c.syntax.purple },

	-- Strings
	["@string"] = { fg = c.syntax.green },
	["@string.regex"] = { fg = c.syntax.yellow },

	-- Numbers / Characters
	["@number"] = { fg = c.syntax.orange },
	["@number.float"] = { fg = c.syntax.orange },
	["@character"] = { fg = c.syntax.green },

	-- Annotations / Attributes
	["@annotation"] = { fg = c.syntax.yellow },
	["@attribute"] = { fg = c.syntax.cyan },

	-- Keywords
	["@keyword"] = { fg = c.syntax.purple },
	["@keyword.function"] = { fg = c.syntax.purple },
	["@keyword.return"] = { fg = c.syntax.purple },
	["@keyword.operator"] = { fg = c.syntax.purple },
	["@keyword.import"] = { link = "Include" },
	["@keyword.conditional"] = { fg = c.syntax.purple },
	["@keyword.conditional.ternary"] = { fg = c.syntax.purple },
	["@keyword.repeat"] = { fg = c.syntax.purple },
	["@keyword.storage"] = { fg = c.syntax.purple },
	["@keyword.directive"] = { fg = c.syntax.purple },
	["@keyword.directive.define"] = { fg = c.syntax.purple },
	["@keyword.exception"] = { fg = c.syntax.purple },

	-- Functions
	["@function"] = { fg = c.syntax.blue },
	["@function.builtin"] = { fg = c.syntax.blue },
	["@function.macro"] = { fg = c.syntax.purple },
	["@function.call"] = { fg = c.syntax.blue },
	["@function.method"] = { fg = c.syntax.blue },
	["@function.method.call"] = { fg = c.syntax.blue },

	-- Constructors / Types
	["@constructor"] = { fg = c.syntax.cyan },
	["@type.builtin"] = { fg = c.syntax.cyan },

	-- Operators / Punctuation
	["@operator"] = { fg = c.syntax.text },
	["@punctuation.bracket"] = { fg = c.ui.text_active },
	["@punctuation.delimiter"] = { fg = c.ui.text_active },

	-- Tags (HTML/JSX etc.)
	["@tag"] = { fg = c.syntax.red },
	["@tag.attribute"] = { fg = c.syntax.cyan },
	["@tag.delimiter"] = { fg = c.ui.none_text },

	-- Properties / References
	["@property"] = { fg = c.syntax.cyan },
	["@reference"] = { fg = c.ui.text_active },

	-- Text / Markup
	["@text"] = { fg = c.ui.text_active },
	["@text.emphasis"] = { fg = c.syntax.orange, italic = true },
	["@text.strike"] = { fg = c.ui.text_active, strikethrough = true },
	["@markup.heading"] = { fg = c.ui.accent, bold = true },
	["@markup.link"] = { fg = c.syntax.red },
	["@markup.link.url"] = { fg = c.ui.blue, underline = true },
	["@markup.link.label"] = { fg = c.syntax.cyan },
	["@markup.list"] = { fg = c.syntax.purple },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },

	-- Comments & TODOs
	["@comment"] = { link = "Comment" },
	["@comment.todo"] = { fg = c.ui.base, bg = c.syntax.yellow, bold = true },
	["@comment.warning"] = { fg = c.ui.base, bg = c.ui.yellow, bold = true },
	["@comment.note"] = { fg = c.ui.base, bg = c.ui.blue, bold = true },
	["@comment.danger"] = { fg = c.ui.base, bg = c.ui.red, bold = true },

	-- Diff
	["@diff.plus"] = { fg = c.ui.green },
	["@diff.minus"] = { fg = c.ui.red },
	["@diff.delta"] = { fg = c.ui.blue },

	-- Error
	["@error"] = { fg = c.ui.red },
}
