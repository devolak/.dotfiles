--  /\ \/\ \                       /\_ \                      /\ \
--  \ \ \_\ \  __  __  _____   _ __\//\ \      __      ___    \_\ \
--   \ \  _  \/\ \/\ \/\ '__`\/\`'__\\ \ \   /'__`\  /' _ `\  /'_` \
--    \ \ \ \ \ \ \_\ \ \ \L\ \ \ \/  \_\ \_/\ \L\.\_/\ \/\ \/\ \L\ \
--     \ \_\ \_\/`____ \ \ ,__/\ \_\  /\____\ \__/.\_\ \_\ \_\ \___,_\
--      \/_/\/_/`/___/> \ \ \/  \/_/  \/____/\/__/\/_/\/_/\/_/\/__,_ /
--                 /\___/\ \_\
--                 \/__/  \/_/

local active_border_color = "rgba(c8c093ff)"
local inactive_border_color = "rgba(54546dff)"
local shadow_color = "rgba(16161dff)"


----------------
--- MONITORS ---
----------------

hl.monitor({
  output = "DP-3",
  mode = "2560x1440@180",
  position = "auto",
  scale = "1",
})

hl.monitor({
  output = "DP-2",
  mode = "1920x1080@60",
  position = "auto-left",
  scale = "1",
})


----------------
--- PROGRAMS ---
----------------

menu = "fuzzel"
lockscreen = "hyprlock"
screenshot = "hyprshot"
powermenu = "powermenu"
quicksettings = "quicksettings"

terminal = "foot"
filemanager = terminal .. " yazi"
browser = "zen-browser"


-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("xrandr --output DP-3 --primary")
  hl.exec_cmd("hyprctl dispatch workspace 1")

  hl.exec_cmd("waybar")
  hl.exec_cmd("mako")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
  hl.exec_cmd("xwayland")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)


---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 12,

    border_size = 3,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },

    resize_on_border = false,

    allow_tearing = true,

    layout = "master",
  },

  decoration = {
    rounding = 2,
    rounding_power = 4,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      ignore_opacity = true,
      noise = 0,
      brightness = 0.90,
    },

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = shadow_color,
      offset = {3, 3},
    },
  },
})

hl.config({
  animations = { enabled = true }
})

hl.curve("easeOutQuint",  { type = "bezier", points = { {0.22, 1},  {0.36, 1}   } })
hl.curve("linear",        { type = "bezier", points = { {0, 0},     {1, 1}      } })
hl.curve("almostLinear",  { type = "bezier", points = { {0.5, 0.5}, {0.75, 1}   } })
hl.curve("quick",         { type = "bezier", points = { {0.15, 0},  {0.1, 1}    } })

hl.animation({ leaf = "global",               enabled = true, speed = 10,   bezier = "default" })

hl.animation({ leaf = "windows",              enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",            enabled = true, speed = 4.1,  bezier = "easeOutQuint",  style = "popin 87%" })
hl.animation({ leaf = "windowsOut",           enabled = true, speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "windowsMove",          enabled = true, speed = 2.7,  bezier = "easeOutQuint" })

hl.animation({ leaf = "layers",               enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",             enabled = true, speed = 2,    bezier = "easeOutQuint",  style = "slide" })
hl.animation({ leaf = "layersOut",            enabled = true, speed = 1.5,  bezier = "linear",        style = "slide" })

hl.animation({ leaf = "fade",                 enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn",               enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",              enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn",         enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",        enabled = true, speed = 1.39, bezier = "almostLinear" })

hl.animation({ leaf = "border",               enabled = true, speed = 5.39, bezier = "easeOutQuint" })

hl.animation({ leaf = "workspaces",           enabled = true, speed = 2.7,  bezier = "easeOutQuint" })
hl.animation({ leaf = "specialWorkspace",     enabled = true, speed = 2.7,  bezier = "easeOutQuint" })
hl.animation({ leaf = "specialWorkspaceIn",   enabled = true, speed = 2.7,  bezier = "easeOutQuint",  style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut",  enabled = true, speed = 1.5,  bezier = "easeOutQuint",  style = "slide bottom 50%" })

hl.config({
  master = {
    new_status = "slave",
    new_on_top = false,
    mfact = 0.55,
  },

  scrolling = {
    fullscreen_on_one_column = true,
    column_width = 0.667,
    focus_fit_method = 1,
    explicit_column_widths = "0.25, 0.333, 0.5, 0.667, 0.75, 0.99",
  },
})

hl.config({
  misc = {
    disable_hyprland_logo = true,
    font_family = "JetBrainsMono",
    splash_font_family = "JetBrainsMono",
    force_default_wallpaper = 0,

    vrr = 1,

    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,

    middle_click_paste = false,
    focus_on_activate = true,
  }
})


-------------
--- INPUT ---
-------------

hl.config({
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = 0.0,
    accel_profile = "flat",
  }
})

hl.device({
  name = "sony-interactive-entertainment-wireless-controller-touchpad",
  enabled = false,
})

hl.device({
  name = "wireless-controller-touchpad",
  enabled = false,
})


-------------------
--- KEYBINDINGS ---
-------------------

require("keybinds")


------------------------------
--- WORKSPACES AND WINDOWS ---
------------------------------

hl.workspace_rule({ workspace = "1", monitor = "DP-3", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", persistent = true,layout = "master" })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "5", monitor = "DP-3", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "29", monitor = "DP-3", default_name = "steam", layout = "scrolling" })
hl.workspace_rule({ workspace = "30", monitor = "DP-3", default_name = "games", layout = "monocle" })

hl.workspace_rule({ workspace = "6", monitor = "DP-2", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "7", monitor = "DP-2", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2", persistent = true, layout = "master" })
hl.workspace_rule({ workspace = "31", monitor = "DP-2", default_name = "discord", layout = "scrolling" })
hl.workspace_rule({ workspace = "32", monitor = "DP-2", default_name = "music", layout = "master", on_created_empty = "youtube-music" })

hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })

hl.window_rule({ match = { class = terminal }, opacity = 0.90 })

hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({
  name = "tui_popup",
  match = { class = "tuipopup" },

  float = true,
  center = true,
  stay_focused = true,
  size = { "(monitor_w*0.35)", "(monitor_h*0.45)" },
})

hl.window_rule({
  name = "force_floating_by_class",
  match = { class = "^(com.gabm.satty|hyprland-share-picker)$" },

  float = true,
})

hl.window_rule({
  name = "center_floating",
  match = { float = true },

  center = true,
})

hl.window_rule({
  name = "game_class",
  match = { class = "^(steam_app_.*|steam_proton|streaming_client|gamescope|starcitizen.exe|Terraria.bin.x86_64|Slay the Spire 2|Minecraft.*)$" },

  workspace = 30,
  fullscreen_state = 2,
  idle_inhibit = "always",
})

hl.window_rule({
  name = "game_xdg_tag",
  match = { xdg_tag = "proton-game" },

  workspace = 30,
  fullscreen_state = 2,
  idle_inhibit = "always",
})

hl.window_rule({
  name = "game_class_no_fullscreen",
  match = { class = "^(net-runelite-client-RuneLite)$" },

  workspace = 30,
  idle_inhibit = "always",
})

hl.window_rule({
  name = "music",
  match = { class = "^(com.github.th_ch.youtube_music)$"},

  workspace = 32,
})

hl.window_rule({
  name = "discord",
  match = { class = "^(discord)$" },

  workspace = 31,
})

hl.window_rule({
  name = "game_launcher",
  match = { class = "^(steam|twintaillauncher|bolt-launcher)" },

  workspace = 29,
})


