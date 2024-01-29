local wezterm = require 'wezterm'

M = {}

local function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return "Catppuccin Mocha"
    else
        return "Catppuccin Macchiato"
    end
end

function M.setup(config)
    config.font = wezterm.font 'JetBrainsMono Nerd Font'
    config.color_scheme = 'OneDark (base16)'
    config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

    config.window_background_opacity = 1
    config.enable_scroll_bar = true

    config.inactive_pane_hsb = {
        saturation = 0.8,
        brightness = 0.7,
    }

    config.hide_tab_bar_if_only_one_tab = true

    config.colors = {
        scrollbar_thumb = "#16161d",
        selection_fg = "#c8c093",
        selection_bg = "#2d4f67",
    }

    M.arrow_solid = ""
    M.arrow_thin = ""
    M.icons = {
        ["C:\\WINDOWS\\system32\\cmd.exe"] = wezterm.nerdfonts.md_console_line,
        ["Topgrade"] = wezterm.nerdfonts.md_rocket_launch,
        ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
        ["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
        ["cargo"] = wezterm.nerdfonts.dev_rust,
        ["curl"] = wezterm.nerdfonts.mdi_flattr,
        ["docker"] = wezterm.nerdfonts.linux_docker,
        ["docker-compose"] = wezterm.nerdfonts.linux_docker,
        ["fish"] = wezterm.nerdfonts.md_fish,
        ["gh"] = wezterm.nerdfonts.dev_github_badge,
        ["git"] = wezterm.nerdfonts.dev_git,
        ["go"] = wezterm.nerdfonts.seti_go,
        ["htop"] = wezterm.nerdfonts.md_chart_areaspline,
        ["btop"] = wezterm.nerdfonts.md_chart_areaspline,
        ["kubectl"] = wezterm.nerdfonts.linux_docker,
        ["kuberlr"] = wezterm.nerdfonts.linux_docker,
        ["lazydocker"] = wezterm.nerdfonts.linux_docker,
        ["lua"] = wezterm.nerdfonts.seti_lua,
        ["make"] = wezterm.nerdfonts.seti_makefile,
        ["node"] = wezterm.nerdfonts.mdi_hexagon,
        ["nvim"] = wezterm.nerdfonts.custom_vim,
        ["pacman"] = wezterm.nerdfonts.md_pac_man,
        ["paru"] = wezterm.nerdfonts.md_pac_man,
        ["psql"] = wezterm.nerdfonts.dev_postgresql,
        ["pwsh.exe"] = wezterm.nerdfonts.md_console,
        ["ruby"] = wezterm.nerdfonts.cod_ruby,
        ["sudo"] = wezterm.nerdfonts.fa_hashtag,
        ["vim"] = wezterm.nerdfonts.dev_vim,
        ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
        ["zsh"] = wezterm.nerdfonts.dev_terminal_bash,
        ["lazygit"] = wezterm.nerdfonts.cod_github,
    }

    return config
end

return M
