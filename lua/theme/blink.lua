local base_30 = {
	white = "#eeeeee",
	black = "#2B2B2B",
	darker_black = "#252525",
	black2 = "#323232",
	one_bg = "#393939",
	one_bg2 = "#404040",
	one_bg3 = "#474747",
	grey = "#555555",
	grey_fg = "#646464",
	grey_fg2 = "#6b6b6b",
	light_grey = "#727272",
	red = "#f43753",
	baby_pink = "#f70067",
	pink = "#b33076",
	line = "#4c4c4c",
	green = "#6A8759",
	vibrant_green = "#98be65",
	nord_blue = "#6897BB",
	blue = "#6FAFBD",
	yellow = "#ffc24b",
	sun = "#d3b987",
	taupe = "#AD9E7D",
	purple = "#9876AA",
	dark_purple = "#b33076",
	teal = "#6897BB",
	orange = "#dc9656",
	cyan = "#00f1f5",
	statusline_bg = "#323232",
	lightbg = "#393939",
	pmenu_bg = "#98be65",
	folder_bg = "#6897BB",
	brown = "#CC7832",
}

local base16 = {
	base00 = "#2B2B2B",
	base01 = "#393939",
	base02 = "#404040",
	base03 = "#474747",
	base04 = "#555555",
	base05 = "#abb2bf",
	base06 = "#a2aab8",
	base07 = "#99a2b1",
	base08 = "#C9D0D3",
	base09 = base_30.purple,
	base0A = base_30.orange,
	base0B = base_30.green,
	base0C = base_30.sun,
	base0D = base_30.taupe,
	base0E = base_30.sun,
	base0F = base_30.brown,
}

local colors = base_30

local hex2rgb = function(hex)
	local hash = string.sub(hex, 1, 1) == "#"
	if string.len(hex) ~= (7 - (hash and 0 or 1)) then
		return nil
	end

	local r = tonumber(hex:sub(2 - (hash and 0 or 1), 3 - (hash and 0 or 1)), 16)
	local g = tonumber(hex:sub(4 - (hash and 0 or 1), 5 - (hash and 0 or 1)), 16)
	local b = tonumber(hex:sub(6 - (hash and 0 or 1), 7 - (hash and 0 or 1)), 16)
	return r, g, b
end

local rgb2hex = function(r, g, b)
	return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

local mixcolors = function(first, second, strength)
	if strength == nil then
		strength = 0.5
	end

	local s = strength / 100
	local r1, g1, b1 = hex2rgb(first)
	local r2, g2, b2 = hex2rgb(second)

	if r1 == nil or r2 == nil then
		return first
	end

	if s == 0 then
		return first
	elseif s == 1 then
		return second
	end

	local r3 = r1 * (1 - s) + r2 * s
	local g3 = g1 * (1 - s) + g2 * s
	local b3 = b1 * (1 - s) + b2 * s

	return rgb2hex(r3, g3, b3)
end

local rgb2hsl = function(r, g, b)
	local min, max, l, s, maxcolor, h
	r, g, b = r / 255, g / 255, b / 255

	min = math.min(r, g, b)
	max = math.max(r, g, b)
	maxcolor = 1 + (max == b and 2 or (max == g and 1 or 0))

	if maxcolor == 1 then
		h = (g - b) / (max - min)
	elseif maxcolor == 2 then
		h = 2 + (b - r) / (max - min)
	elseif maxcolor == 3 then
		h = 4 + (r - g) / (max - min)
	end

	if not rawequal(type(h), "number") then
		h = 0
	end

	h = h * 60

	if h < 0 then
		h = h + 360
	end

	l = (min + max) / 2

	if min == max then
		s = 0
	else
		if l < 0.5 then
			s = (max - min) / (max + min)
		else
			s = (max - min) / (2 - max - min)
		end
	end

	return h, s, l
end

local hex2hsl = function(hex)
	local r, g, b = hex2rgb(hex)
	return rgb2hsl(r, g, b)
end

local hsl2rgb_helper = function(p, q, a)
	if a < 0 then
		a = a + 6
	end
	if a >= 6 then
		a = a - 6
	end
	if a < 1 then
		return (q - p) * a + p
	elseif a < 3 then
		return q
	elseif a < 4 then
		return (q - p) * (4 - a) + p
	else
		return p
	end
end

local hsl2rgb = function(h, s, l)
	local t1, t2, r, g, b

	h = h / 60
	if l <= 0.5 then
		t2 = l * (s + 1)
	else
		t2 = l + s - (l * s)
	end

	t1 = l * 2 - t2
	r = hsl2rgb_helper(t1, t2, h + 2) * 255
	g = hsl2rgb_helper(t1, t2, h) * 255
	b = hsl2rgb_helper(t1, t2, h - 2) * 255

	return r, g, b
end

local hsl2hex = function(h, s, l)
	local r, g, b = hsl2rgb(h, s, l)
	return rgb2hex(r, g, b)
end
local change_hex_lightness = function(hex, percent)
	local h, s, l = hex2hsl(hex)
	l = l + (percent / 100)
	if l > 1 then
		l = 1
	end
	if l < 0 then
		l = 0
	end
	return hsl2hex(h, s, l)
end

local generate_color = change_hex_lightness

local black2_l = generate_color(colors.black2, 6)
local black2_d = generate_color(colors.black2, -6)

local highlights = {
	BlinkCmpMenu = { bg = colors.black },
	BlinkCmpMenuBorder = { fg = colors.grey_fg },
	BlinkCmpMenuSelection = { link = "PmenuSel", bold = true },
	BlinkCmpScrollBarThumb = { bg = colors.grey },
	BlinkCmpScrollBarGutter = { bg = colors.black2 },
	BlinkCmpLabel = { fg = colors.white },
	BlinkCmpLabelDeprecated = { fg = colors.red, strikethrough = true },
	BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
	BlinkCmpLabelDetail = { fg = colors.light_grey },
	BlinkCmpLabelDescription = { fg = colors.light_grey },
	BlinkCmpSource = { fg = colors.grey_fg },
	BlinkCmpGhostText = { fg = colors.grey_fg },
	BlinkCmpDoc = { bg = colors.black },
	BlinkCmpDocBorder = { fg = colors.grey_fg },
	BlinkCmpDocSeparator = { fg = colors.grey },
	BlinkCmpDocCursorLine = { bg = colors.one_bg },
	BlinkCmpSignatureHelp = { bg = colors.black },
	BlinkCmpSignatureHelpBorder = { fg = colors.grey_fg },
	BlinkCmpSignatureHelpActiveParameter = { fg = colors.blue, bold = true },
}

-- Kind highlights
local kinds = {
	Constant = base16.base09,
	Function = base16.base0D,
	Identifier = base16.base08,
	Field = base16.base08,
	Variable = base16.base0E,
	Snippet = colors.red,
	Text = base16.base0B,
	Structure = base16.base0E,
	Type = base16.base0A,
	Keyword = base16.base07,
	Method = base16.base0D,
	Constructor = colors.blue,
	Folder = base16.base07,
	Module = base16.base0A,
	Property = base16.base08,
	Enum = colors.blue,
	Unit = base16.base0E,
	Class = colors.teal,
	File = base16.base07,
	Interface = colors.green,
	Color = colors.white,
	Reference = base16.base05,
	EnumMember = colors.purple,
	Struct = base16.base0E,
	Value = colors.cyan,
	Event = colors.yellow,
	Operator = base16.base05,
	TypeParameter = base16.base08,
	Copilot = colors.green,
	Codeium = colors.vibrant_green,
	TabNine = colors.baby_pink,
	SuperMaven = colors.yellow,
}

for kind, color in pairs(kinds) do
	highlights["BlinkCmpKind" .. kind] = { fg = color }
end

local styles = {
	default = {
		BlinkCmpMenuBorder = { fg = colors.grey_fg },
	},

	atom = {
		BlinkCmpMenu = { bg = colors.black2 },
		BlinkCmpDoc = { bg = colors.darker_black },
		BlinkCmpDocBorder = { fg = colors.darker_black, bg = colors.darker_black },
	},

	atom_colored = {
		BlinkCmpMenu = { bg = colors.black2 },
		BlinkCmpDoc = { bg = colors.darker_black },
		BlinkCmpDocBorder = { fg = colors.darker_black, bg = colors.darker_black },
	},

	flat_light = {
		BlinkCmpMenu = { bg = colors.black2 },
		BlinkCmpDoc = { bg = colors.darker_black },
		BlinkCmpMenuBorder = { fg = colors.black2, bg = colors.black2 },
		BlinkCmpDocBorder = { fg = colors.darker_black, bg = colors.darker_black },
	},

	flat_dark = {
		BlinkCmpMenu = { bg = colors.darker_black },
		BlinkCmpDoc = { bg = colors.black2 },
		BlinkCmpMenuBorder = { fg = colors.darker_black, bg = colors.darker_black },
		BlinkCmpDocBorder = { fg = colors.black2, bg = colors.black2 },
	},
}

local cmp_ui = {
	style = "atom",
}

-- atom style: add bg to kinds
if cmp_ui.style == "atom" then
	for kind, _ in pairs(kinds) do
		local hl_name = "BlinkCmpKind" .. kind
		highlights[hl_name] = vim.tbl_deep_extend("force", highlights[hl_name] or {}, {
			bg = vim.o.bg == "dark" and black2_l or black2_d,
		})
	end
end

-- atom_colored: mix fg with black for bg
if cmp_ui.style == "atom_colored" then
	for kind, _ in pairs(kinds) do
		local hl_name = "BlinkCmpKind" .. kind
		local fg = highlights[hl_name] and highlights[hl_name].fg or colors.white
		highlights[hl_name] = {
			fg = fg,
			bg = mixcolors(fg, colors.black, 70),
		}
	end
end

-- merge style overrides
highlights = vim.tbl_deep_extend("force", highlights, styles[cmp_ui.style] or {})

return highlights
