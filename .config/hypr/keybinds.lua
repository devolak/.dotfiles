-------------------------------
--- VARIABLES AND FUNCTIONS ---
-------------------------------

local mainMod = "SUPER"
local uwsm = "uwsm app -- "

local function layout_bind(bind_table)
  return function ()
    local workspace = hl.get_active_special_workspace() or
                      hl.get_active_workspace()

    if not workspace then
      return
    end

    local layout = workspace.tiled_layout

    if bind_table[layout] then
      hl.dispatch(bind_table[layout])
    end
  end
end

hl.bind(mainMod .. " + SPACE", function ()
  local layouts = { "master", "scrolling", "monocle" }
  local workspace = hl.get_active_workspace()
  if hl.get_active_special_workspace() then
    workspace = hl.get_active_special_workspace()
  end

  local next_layout = "master"

  if not workspace then
    return
  end

  for i = 1, #layouts do
    if layouts[i] == workspace.tiled_layout then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx]
      break
    end
  end

  if workspace.special then
    hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
  else
    hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
  end
end)


-----------------------
--- ESSENTIAL BINDS ---
-----------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + R", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
-- hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 2, action = "toggle" }))

-- Window focus
hl.bind(mainMod .. " + J", layout_bind({
  master = hl.dsp.layout("cyclenext"),
  monocle = hl.dsp.layout("cyclenext"),
  scrolling = hl.dsp.layout("move +col"),
}))

hl.bind(mainMod .. " + K", layout_bind({
  master = hl.dsp.layout("cycleprev"),
  monocle = hl.dsp.layout("cycleprev"),
  scrolling = hl.dsp.layout("move -col"),
}))

-- Window manipulation
hl.bind(mainMod .. " + SHIFT + J", layout_bind({
  master = hl.dsp.layout("swapnext"),
  scrolling = hl.dsp.layout("swapcol r"),
}))

hl.bind(mainMod .. " + SHIFT + K", layout_bind({
  master = hl.dsp.layout("swapprev"),
  scrolling = hl.dsp.layout("swapcol l"),
}))

hl.bind(mainMod .. " + H", layout_bind({
  master = hl.dsp.layout("mfact -0.025"),
  scrolling = hl.dsp.layout("colresize -conf"),
}))

hl.bind(mainMod .. " + L", layout_bind({
  master = hl.dsp.layout("mfact +0.025"),
  scrolling = hl.dsp.layout("colresize +conf"),
}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Layout specific binds
hl.bind(mainMod .. " + I", layout_bind({
  master = hl.dsp.layout("swapwithmaster"),
}))

hl.bind(mainMod .. " + O", layout_bind({
  master = hl.dsp.layout("orientationcycle left center top"),
}))

hl.bind(mainMod .. " + G", layout_bind({
  master = hl.dsp.layout("focusmaster"),
}))


---------------------
--- UTILITY BINDS ---
---------------------

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(uwsm .. menu))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(uwsm .. terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(uwsm .. filemanager))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -- foot yazi"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(uwsm .. browser))
-- hl.bind(mainMod .. " + SHIFT + ESCAPE", hl.dsp.exec_cmd(uwsm .. powermenu))
hl.bind(mainMod .. " + SHIFT + ESCAPE", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(uwsm .. lockscreen))
-- hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(uwsm .. quicksettings))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center bluetooth"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center network"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center audio"))
-- hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(uwsm .. barreload))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(uwsm .. "makoctl restore"))
hl.bind("Print", hl.dsp.exec_cmd(uwsm .. "grimblast edit area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(uwsm .. "grimblast edit output"))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))

-- Multimedia binds
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0 && volumenotification"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.0 && volumenotification"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.0"), { locked = true, repeating = true })
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && volumenotification"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Screen brightness binds
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })


-----------------------
--- WORKSPACE BINDS ---
-----------------------

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. " + Z", hl.dsp.focus({ workspace = 29 }))
hl.bind(mainMod .. " + X", hl.dsp.focus({ workspace = 30 }))
hl.bind(mainMod .. " + F1", hl.dsp.focus({ workspace = 31 }))
hl.bind(mainMod .. " + F2", hl.dsp.focus({ workspace = 32 }))

hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = 29 }))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = 30 }))
hl.bind(mainMod .. " + SHIFT + F1", hl.dsp.window.move({ workspace = 31 }))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.window.move({ workspace = 32 }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:276", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse:275", hl.dsp.focus({ workspace = "e-1" }))


