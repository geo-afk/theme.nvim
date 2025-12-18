local c = require("theme.colors")

return {
	WhichKey = { fg = c.ui.accent }, -- Main key (e.g. the leader key or prefix)
	WhichKeySeparator = { fg = c.ui.none_text }, -- The "->" or separator
	WhichKeyDesc = { fg = c.ui.text_active }, -- Description of the command
	WhichKeyGroup = { fg = c.syntax.cyan }, -- Keymap groups (like <leader>g for git)
	WhichKeyValue = { fg = c.syntax.green }, -- Values (rarely used, but often for actual commands)
}
