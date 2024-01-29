local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")

require('appearance').setup(config)
require('links').setup(config)

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.underline_thickness = 2

config.font_size = 12
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.warn_about_missing_glyphs = false

return config
