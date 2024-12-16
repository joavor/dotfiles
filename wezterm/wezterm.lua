local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Functionality
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Window appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 64
config.window_padding = {
  left = "2cell",
  right = "2cell",
  top = "1cell",
  bottom = "1cell",
}
config.hide_tab_bar_if_only_one_tab = true

-- Theme
config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font({
  family = "JetBrainsMono Nerd Font",
  weight = "Regular",
})
config.font_size = 13.0

wezterm.plugin.require("https://github.com/Xarvex/presentation.wez").apply_to_config(config, {
  font_size_multiplier = 1.4,
  font_weight = "Regular",
  presentation = {
    keybind = { key = "p", mods = "SHIFT|SUPER" },
  },
})

return config
