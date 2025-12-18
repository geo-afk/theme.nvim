local c = require("theme.colors")

local highlights = {
	BlinkCmpMenu = { bg = c.ui.float },
	BlinkCmpMenuBorder = { fg = c.ui.border, bg = c.ui.float },
	BlinkCmpMenuSelection = { fg = c.ui.text_active, bg = c.ui.menu_selection, bold = true },
	BlinkCmpScrollBarThumb = { bg = c.ui.accent },
	BlinkCmpScrollBarGutter = { bg = c.ui.highlight },
	BlinkCmpLabel = { fg = c.ui.text_active },
	BlinkCmpLabelDeprecated = { fg = c.ui.red, strikethrough = true },
	BlinkCmpLabelMatch = { fg = c.ui.accent, bold = true },
	BlinkCmpLabelDetail = { fg = c.ui.text_inactive },
	BlinkCmpLabelDescription = { fg = c.ui.text_inactive },
	BlinkCmpSource = { fg = c.syntax.comment },
	BlinkCmpGhostText = { fg = c.syntax.comment },
	BlinkCmpDoc = { bg = c.ui.float },
	BlinkCmpDocBorder = { fg = c.ui.border, bg = c.ui.float },
	BlinkCmpDocSeparator = { fg = c.ui.none_text },
	BlinkCmpDocCursorLine = { bg = c.ui.current_line },
	BlinkCmpSignatureHelp = { bg = c.ui.float },
	BlinkCmpSignatureHelpBorder = { fg = c.ui.border, bg = c.ui.float },
	BlinkCmpSignatureHelpActiveParameter = { fg = c.ui.blue, bold = true },
}

-- Kind highlights
local kinds = {
	Constant = c.syntax.orange,
	Function = c.syntax.blue,
	Identifier = c.syntax.red,
	Field = c.syntax.cyan,
	Variable = c.ui.text_active,
	Snippet = c.syntax.yellow,
	Text = c.syntax.green,
	Structure = c.syntax.cyan,
	Type = c.syntax.cyan,
	Keyword = c.syntax.purple,
	Method = c.syntax.blue,
	Constructor = c.syntax.cyan,
	Folder = c.ui.blue,
	Module = c.syntax.cyan,
	Property = c.syntax.cyan,
	Enum = c.syntax.cyan,
	Unit = c.syntax.orange,
	Class = c.syntax.cyan,
	File = c.ui.text_active,
	Interface = c.syntax.cyan,
	Color = c.ui.text_active,
	Reference = c.ui.text_active,
	EnumMember = c.syntax.purple,
	Struct = c.syntax.cyan,
	Value = c.syntax.orange,
	Event = c.syntax.yellow,
	Operator = c.ui.text_active,
	TypeParameter = c.syntax.cyan,
	Copilot = c.ui.green,
	Codeium = c.syntax.green,
	TabNine = c.ui.purple,
	SuperMaven = c.syntax.yellow,
}

for kind, color in pairs(kinds) do
	highlights["BlinkCmpKind" .. kind] = { fg = color }
end

return highlights
