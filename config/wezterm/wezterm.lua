local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 8 do
    table.insert(mykeys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action {ActivateTab = i - 1}
    })
end

table.insert(mykeys, {
    key = "v",
    mods = "ALT",
    action = wezterm.action {SplitVertical = {domain = "CurrentPaneDomain"}}
})
table.insert(mykeys, {
    key = "s",
    mods = "ALT",
    action = wezterm.action {SplitHorizontal = {domain = "CurrentPaneDomain"}}
})

table.insert(mykeys, {
    key = "h",
    mods = "ALT",
    action = wezterm.action {ActivatePaneDirection = "Left"}
})
table.insert(mykeys, {
    key = "l",
    mods = "ALT",
    action = wezterm.action {ActivatePaneDirection = "Right"}
})
table.insert(mykeys, {
    key = "k",
    mods = "ALT",
    action = wezterm.action {ActivatePaneDirection = "Up"}
})
table.insert(mykeys, {
    key = "j",
    mods = "ALT",
    action = wezterm.action {ActivatePaneDirection = "Down"}
})

return {
    font = wezterm.font_with_fallback({
        "Fira Code Retina", "Hack Nerd Font", "Fira Code", "JetBrains Mono"
    }),
    font_dirs = {"/Users/mengwangk/Library/fonts"},
    font_size = 12.0,
    line_height = 1.0,

    bold_brightens_ansi_colors = true,
    inactive_pane_hsb = {hue = 1.0, saturation = 0.7, brightness = 0.8},

    color_scheme = "JetBrains Darcula",

    launch_menu = {{args = {"btm"}}},

    keys = mykeys,

    window_background_opacity = 1.0,
    text_background_opacity = 1.0,

    exit_behavior = "Close"
}
