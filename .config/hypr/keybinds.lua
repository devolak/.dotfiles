-------------------------------
--- VARIABLES AND FUNCTIONS ---
-------------------------------

local mainMod = "SUPER"

local function layout_aware_dispatch(actions)
  local active_ws = hl.get_active_workspace()

  if active_ws and active_ws.tiled_layout == "master" and actions.master ~= nil then
    hl.dispatch(hl.dsp.layout(actions.master))
  elseif active_ws and active_ws.tiled_layout == "monocle" and actions.monocle ~= nil then
    hl.dispatch(hl.dsp.layout(actions.monocle))
  elseif active_ws and active_ws.tiled_layout == "scrolling" and actions.scrolling ~= nil then
    hl.dispatch(hl.dsp.layout(actions.scrolling))
  end
end


-----------------------
--- ESSENTIAL BINDS ---
-----------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + R", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Window focus
hl.bind(mainMod .. " + J", function() layout_aware_dispatch({ master = "cyclenext", monocle = "cyclenext", scrolling = "move +col" }) end)
hl.bind(mainMod .. " + K", function() layout_aware_dispatch({ master = "cycleprev", monocle = "cycleprev", scrolling = "move -col" }) end)

-- Window manipulation
hl.bind(mainMod .. " + SHIFT + J", function() layout_aware_dispatch({ master = "swapnext", scrolling = "swapcol r" }) end)
hl.bind(mainMod .. " + SHIFT + K", function() layout_aware_dispatch({ master = "swapprev", scrolling = "swapcol l" }) end)
hl.bind(mainMod .. " + H", function() layout_aware_dispatch({ master = "mfact -0.025", scrolling = "colresize -conf" }) end)
hl.bind(mainMod .. " + L", function() layout_aware_dispatch({ master = "mfact +0.025", scrolling = "colresize +conf" }) end)

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Layout specific binds
hl.bind(mainMod .. " + I", function() layout_aware_dispatch({ master = "swapwithmaster" }) end)
hl.bind(mainMod .. " + O", function() layout_aware_dispatch({ master = "orientationcycle left center" }) end)
hl.bind(mainMod .. " + G", function() layout_aware_dispatch({ master = "focusmaster" }) end)


---------------------
--- UTILITY BINDS ---
---------------------

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + ESCAPE", hl.dsp.exec_cmd(powermenu))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(lockscreen))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(quicksettings))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(barreload))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("makoctl restore"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast edit area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast edit output"))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist-fuzzel-img"))

-- Multimedia binds
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0 && volumenotification"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1.0 && volumenotification"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && volumenotification"), { locked = true })
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


