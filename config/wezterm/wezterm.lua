local wezterm = require("wezterm")

local mykeys = {}
for i = 1, 8 do
	table.insert(mykeys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

table.insert(mykeys, {
	key = "v",
	mods = "ALT",
	action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
})
table.insert(mykeys, {
	key = "s",
	mods = "ALT",
	action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
})

table.insert(mykeys, {
	key = "h",
	mods = "ALT",
	action = wezterm.action({ ActivatePaneDirection = "Left" }),
})
table.insert(mykeys, {
	key = "l",
	mods = "ALT",
	action = wezterm.action({ ActivatePaneDirection = "Right" }),
})
table.insert(mykeys, {
	key = "k",
	mods = "ALT",
	action = wezterm.action({ ActivatePaneDirection = "Up" }),
})
table.insert(mykeys, {
	key = "j",
	mods = "ALT",
	action = wezterm.action({ ActivatePaneDirection = "Down" }),
})
table.insert(mykeys, {
	key = "b",
	mods = "ALT",
	action = "ToggleFullScreen",
})
table.insert(mykeys, {
	key = "t",
	mods = "ALT",
	action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
})

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = {
		name,
		"Fira Code",
		"FiraCode Nerd Font Mono",
		"Hack Nerd Font",
		"Fira Code Retina",
		"Source Code Pro",
		"JetBrains Mono",
	}
	return wezterm.font_with_fallback(names, params)
end

return {
	-- font = font_with_fallback("FiraCode Nerd Font"),
	-- font = font_with_fallback("InputMono Nerd Font"),
	font = font_with_fallback("Liga InputMono Nerd Font Ligatures"),
	font_rules = {
		{
			italic = true,
			-- bold = true,
			intensity = "Bold",
			font = font_with_fallback("OperatorMono Nerd Font", { italic = true, bold = true }),
		},
		{
			-- bold = true,
			intensity = "Bold",
			font = font_with_fallback("OperatorMono Nerd Font", { bold = false }),
		},
		{
			italic = true,
			font = font_with_fallback("Operator Mono Book", { italic = true }),
		},
	},
	font_size = 14,
	line_height = 1.0,

	bold_brightens_ansi_colors = true,
	inactive_pane_hsb = { hue = 1.0, saturation = 0.7, brightness = 0.8 },
	color_scheme = "JetBrains Darcula",
	launch_menu = { { args = { "btm" } } },
	keys = mykeys,

	-- window_background_opacity = 0.85,
	window_background_opacity = 1.0,
	text_background_opacity = 1.0,
	hide_tab_bar_if_only_one_tab = true,
	exit_behavior = "Close",
	enable_csi_u_key_encoding = true,
}
