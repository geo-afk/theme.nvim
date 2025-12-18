local c = require("theme.colors")

return {
	-- LSP References
	LspReferenceText = { bg = c.ui.highlight },
	LspReferenceRead = { bg = c.ui.highlight },
	LspReferenceWrite = { bg = c.ui.highlight },

	-- LSP Diagnostics (override or complement the ones already in init.lua)
	DiagnosticError = { fg = c.ui.red },
	DiagnosticWarn = { fg = c.ui.yellow },
	DiagnosticInfo = { fg = c.ui.blue },
	DiagnosticHint = { fg = c.ui.cyan },

	-- Signature help active parameter
	LspSignatureActiveParameter = { fg = c.ui.text_active, bg = c.ui.menu_selection, bold = true },

	-- Inlay hints (type hints, parameter hints)
	LspInlayHint = {
		fg = c.syntax.comment,
		bg = c.ui.current_line, -- subtle background, matches CursorLine
		italic = true,
	},
}
