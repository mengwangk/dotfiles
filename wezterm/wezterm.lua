local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 9 do
    table.insert(mykeys, {
        key = tostring(i),
        mods = "CTRL|SHIFT",
        action = wezterm.action {ActivateTab = i - 1}
    })

    table.insert(mykeys, {
        key = "F" .. tostring(i),
        action = wezterm.action {ActivateTab = i - 1}
    })

end

table.insert(mykeys, {
    key = "[",
    mods = "CTRL",
    action = wezterm.action {ActivateTabRelative = -1}
})
table.insert(mykeys, {
    key = "]",
    mods = "CTRL",
    action = wezterm.action {ActivateTabRelative = 1}
})

table.insert(mykeys, {
    key = "V",
    mods = "ALT",
    action = wezterm.action {SplitVertical = {domain = "CurrentPaneDomain"}}
})
table.insert(mykeys, {
    key = "H",
    mods = "ALT",
    action = wezterm.action {SplitHorizontal = {domain = "CurrentPaneDomain"}}
})

table.insert(mykeys, {
    key = "b",
    mods = "LEADER",
    action = wezterm.action {SplitVertical = {domain = "CurrentPaneDomain"}}
})
table.insert(mykeys, {
    key = "n",
    mods = "LEADER",
    action = wezterm.action {SplitHorizontal = {domain = "CurrentPaneDomain"}}
})

-- Pane activation when in split panes mode
table.insert(mykeys, {
    key = "j",
    mods = "LEADER",
    action = wezterm.action {ActivatePaneDirection = "Down"}
})
table.insert(mykeys, {
    key = "k",
    mods = "LEADER",
    action = wezterm.action {ActivatePaneDirection = "Up"}
})
table.insert(mykeys, {
    key = "h",
    mods = "LEADER",
    action = wezterm.action {ActivatePaneDirection = "Left"}
})
table.insert(mykeys, {
    key = "l",
    mods = "LEADER",
    action = wezterm.action {ActivatePaneDirection = "Right"}
})

-- Pane sizes
table.insert(mykeys, {
    key = "H",
    mods = "LEADER|SHIFT",
    action = wezterm.action {AdjustPaneSize = {"Left", 5}}
})
table.insert(mykeys, {
    key = "J",
    mods = "LEADER|SHIFT",
    action = wezterm.action {AdjustPaneSize = {"Down", 5}}
})
table.insert(mykeys, {
    key = "K",
    mods = "LEADER|SHIFT",
    action = wezterm.action {AdjustPaneSize = {"Up", 5}}
})
table.insert(mykeys, {
    key = "L",
    mods = "LEADER|SHIFT",
    action = wezterm.action {AdjustPaneSize = {"Right", 5}}
})
table.insert(mykeys, {
    key = "LeftArrow",
    mods = "CTRL",
    action = wezterm.action {AdjustPaneSize = {"Left", 5}}
})
table.insert(mykeys, {
    key = "DownArrow",
    mods = "CTRL",
    action = wezterm.action {AdjustPaneSize = {"Down", 5}}
})
table.insert(mykeys, {
    key = "UpArrow",
    mods = "CTRL",
    action = wezterm.action {AdjustPaneSize = {"Up", 5}}
})
table.insert(mykeys, {
    key = "RightArrow",
    mods = "CTRL",
    action = wezterm.action {AdjustPaneSize = {"Right", 5}}
})

-- clear
table.insert(mykeys, {
    key = "K",
    mods = "CTRL|SHIFT",
    action = wezterm.action {ClearScrollback = "ScrollbackAndViewport"}
})

return {
    -- Fonts
    font = wezterm.font("Iosevka SS05"),
    font_size = 15.0,
    line_height = 1.2,

    -- Colors
    bold_brightens_ansi_colors = true,
    inactive_pane_hsb = {hue = 1.0, saturation = 0.7, brightness = 0.8},
    -- UI
    color_scheme = "JetBrains Darcula",

    -- Keybindings
    leader = {key = "m", mods = "CTRL"},
    keys = mykeys,

    -- Commands configuration
    launch_menu = {{args = {"btm"}}}
}
