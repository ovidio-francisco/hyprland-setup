---------------------
---- KEYBINDINGS ----
---------------------


local config = require('config')


hl.bind("CTRL + space",     hl.dsp.exec_cmd(config.scripts_path .. "set-next-keyboard-layout"))
hl.bind("CTRL + ccedilla",  hl.dsp.exec_cmd(config.scripts_path .. "set-next-keyboard-layout"))
hl.bind("CTRL + semicolon", hl.dsp.exec_cmd(config.scripts_path .. "set-next-keyboard-layout"))


-- 66 is Caps Lock code;
hl.bind("code:66", hl.dsp.exec_cmd("pkill -SIGRTMIN+11 waybar"), {
    release = true,
    ignore_mods = true,
    non_consuming = true
})


hl.bind("ALT + p", hl.dsp.exec_cmd(config.scripts_path .. "rofi-clip-history"))
hl.bind("ALT + r", hl.dsp.exec_cmd(config.scripts_path .. "rofi-recent-files"))

hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(config.scripts_path .. "power-menu"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(config.scripts_path .. "power-menu"))




hl.bind("ALT + SHIFT + 4", hl.dsp.exec_cmd([[grim -g "$(slurp)" "$HOME/Pictures/Screenshots/Screenshot From $(date +'%Y-%m-%d %H-%M-%S').png"]]))
hl.bind("ALT + SHIFT + 3", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))

hl.bind("SUPER + P", hl.dsp.exec_cmd("rofi -show drun -drun-match-fields name -theme ojf"))



-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("SUPER + Return", hl.dsp.exec_cmd(config.terminal))
local closeWindowBind = hl.bind("SUPER + F4", hl.dsp.window.close())

-- closeWindowBind:set_enabled(false)


-- hl.bind("SUPER + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + O", hl.dsp.window.pseudo())
hl.bind("SUPER + u", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind("SUPER + X", hl.dsp.exec_cmd(config.menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(config.fileManager))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness

-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && pkill -RTMIN+1 waybar"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && pkill -RTMIN+1 waybar"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && pkill -RTMIN+1 waybar"),     { locked = true, repeating = false })


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(config.scripts_path .. "volume-control up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(config.scripts_path .. "volume-control down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(config.scripts_path .. "volume-control mute"), { locked = true, repeating = false })



hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(config.scripts_path .. "brightness-control up"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(config.scripts_path .. "brightness-control down"),                { locked = true, repeating = true })




-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/


hl.bind("ALT + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind("ALT + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))
hl.bind("ALT + SHIFT + k",  hl.dsp.window.swap({ direction = "up" }))
hl.bind("ALT + SHIFT + l",  hl.dsp.window.swap({ direction = "right" }))


hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())

hl.bind("SUPER + h", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind("SUPER + j", hl.dsp.focus({ workspace = "e-2" }))
-- hl.bind("SUPER + k", hl.dsp.focus({ workspace = "e-2" }))
hl.bind("SUPER + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + semicolon", hl.dsp.focus({ workspace = "previous_per_monitor" }))
hl.bind("SUPER + ccedilla", hl.dsp.focus({ workspace = "previous_per_monitor" }))


-- Move focus with mainMod + arrow keys
hl.bind("ALT + h", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + l", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + k", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + j", hl.dsp.focus({ direction = "down" }))





