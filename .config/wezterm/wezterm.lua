local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.log_info("reloading")

require('appearance').setup(config)
require('links').setup(config)
require('keybinds').setup(config)

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.underline_thickness = 2

config.font_size = 12
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.warn_about_missing_glyphs = false

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_decorations = "RESIZE"

config.check_for_updates_interval_seconds = 8640000  -- 100 days

-- -- dark mode?
-- config.window_background_opacity = 0.4
-- config.text_background_opacity = 0.4

return config
