---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more




-- configurations

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



-- functionalities


hl.bind("ALT + p", hl.dsp.exec_cmd(config.scripts_path .. "rofi-clip-history"))
hl.bind("ALT + r", hl.dsp.exec_cmd(config.scripts_path .. "rofi-recent-files"))

hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(config.scripts_path .. "power-menu"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(config.scripts_path .. "power-menu"))

hl.bind("ALT + SHIFT + 4", hl.dsp.exec_cmd([[grim -g "$(slurp)" "$HOME/Pictures/Screenshots/Screenshot From $(date +'%Y-%m-%d %H-%M-%S').png"]]))
hl.bind("ALT + SHIFT + 3", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))

hl.bind("SUPER + P"         , hl.dsp.exec_cmd("rofi -show drun -drun-match-fields name -theme ojf"))
hl.bind("CTRL  + return"         , hl.dsp.exec_cmd("rofi -show drun -drun-match-fields name -theme ojf"))


-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(config.scripts_path .. "volume-control up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(config.scripts_path .. "volume-control down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(config.scripts_path .. "volume-control mute"), { locked = true, repeating = false })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(config.scripts_path .. "brightness-control up"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(config.scripts_path .. "brightness-control down"),                { locked = true, repeating = true })



-- windows

-- Move focus with super + arrow keys
hl.bind("ALT + h", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + l", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + k", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + j", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + F4", hl.dsp.window.close())

hl.bind("SUPER + O", hl.dsp.window.pseudo())
hl.bind("SUPER + u", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind("ALT + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind("ALT + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))
hl.bind("ALT + SHIFT + k",  hl.dsp.window.swap({ direction = "up" }))
hl.bind("ALT + SHIFT + l",  hl.dsp.window.swap({ direction = "right" }))





hl.bind("SUPER + Tab", function()
	hl.dispatch(hl.dsp.focus({ last = true }))
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)


-- hl.bind("SUPER + SHIFT + Tab", function()
--     hl.dispatch(hl.dsp.window.cycle_next())
--     hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
-- end)


local function cycle_all_workspaces(step)
    local active = hl.get_active_window()
    local wins = {}
    for _, w in ipairs(hl.get_windows()) do
        if w.mapped ~= false and not w.hidden then
            table.insert(wins, w)
        end
    end
    if #wins == 0 then return end

	table.sort(wins, function(a, b)
		if a.workspace.id ~= b.workspace.id then
			return a.workspace.id < b.workspace.id
		end
		return tostring(a.address) < tostring(b.address)
	end)


    local idx = 0
    if active then
        for i, w in ipairs(wins) do
            if w.address == active.address then idx = i break end
        end
    end

    local nxt = wins[((idx - 1 + step) % #wins) + 1]
    hl.dispatch(hl.dsp.focus({ window = nxt }))
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end

hl.bind("SUPER + SHIFT + Tab", function() cycle_all_workspaces(-1) end)  -- -1 do reverse order. +1 normal order






hl.bind("CTRL + apostrophe", hl.dsp.exec_cmd(config.scripts_path .. "window-menu"))



-- workspaces


hl.bind("CTRL + m", hl.dsp.focus({ direction = "left" }))
hl.bind("CTRL + comma", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + N", hl.dsp.exec_cmd(config.scripts_path .. "goto-new-ws"))
hl.bind("CTRL  + 0", hl.dsp.exec_cmd(config.scripts_path .. "goto-new-ws"))



hl.bind("SUPER + X"     , hl.dsp.exec_cmd(config.menu))
hl.bind("SUPER + E"     , hl.dsp.exec_cmd(config.fileManager))
hl.bind("SUPER + Return", hl.dsp.exec_cmd(config.terminal))

-- Switch workspaces with super + [0-9]
-- Move active window to a workspace with super + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with super + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with super + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })


hl.bind("SUPER + h", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind("SUPER + j", hl.dsp.focus({ workspace = "e-2" }))
-- hl.bind("SUPER + k", hl.dsp.focus({ workspace = "e+2" }))
hl.bind("SUPER + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + semicolon", hl.dsp.focus({ workspace = "previous_per_monitor" }))
hl.bind("SUPER + ccedilla", hl.dsp.focus({ workspace = "previous_per_monitor" }))

hl.bind("ALT + SUPER + l", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("ALT + SUPER + h", hl.dsp.window.move({ workspace = "-1" }))



-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
