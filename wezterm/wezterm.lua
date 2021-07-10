local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 8 do
    table.insert(mykeys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action {ActivateTab = i - 1}
    })
end

return {
    font = wezterm.font_with_fallback({
        "Fira Code Retina", "Hack Nerd Font", "Fira Code", "JetBrains Mono"
    }),
    font_dirs = {"/Users/mengwangk/Library/fonts"},
    font_size = 15.0,
    line_height = 1.2,

    bold_brightens_ansi_colors = true,
    inactive_pane_hsb = {hue = 1.0, saturation = 0.7, brightness = 0.8},

    color_scheme = "JetBrains Darcula",

    launch_menu = {{args = {"btm"}}},

    keys = mykeys,

    window_background_opacity = 1.0,
    text_background_opacity = 1.0,

    exit_behavior = "Close"
}
