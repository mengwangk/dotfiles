local wezterm = require 'wezterm';

return {
    -- Fonts
    font = wezterm.font_with_fallback({
        "Fira Code Retina", "Hack Nerd Font", "Fira Code", "JetBrains Mono"
    }),
    font_dirs = {"/Users/mengwangk/Library/fonts"},
    font_size = 15.0,
    line_height = 1.2,

    -- Colors
    bold_brightens_ansi_colors = true,
    inactive_pane_hsb = {hue = 1.0, saturation = 0.7, brightness = 0.8},

    -- UI
    color_scheme = "JetBrains Darcula",

    -- Commands configuration
    launch_menu = {{args = {"btm"}}},

    -- Exit behaviar
    exit_behavior = "Close"
}
