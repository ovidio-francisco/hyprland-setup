--               __                     __                __
--              / /_  __  ______  _____/ /___ _____  ____/ /
--             / __ \/ / / / __ \/ ___/ / __ `/ __ \/ __  / 
--            / / / / /_/ / /_/ / /  / / /_/ / / / / /_/ /  
--           /_/ /_/\__, / .___/_/  /_/\__,_/_/ /_/\__,_/   
--                 /____/_/                                 




local scripts_path = "~/.config/hypr/scripts/"
local NORMAL_GAPS_IN  = 4
local NORMAL_GAPS_OUT = 8


hl.config({
    input = {
        kb_layout = "us,br",
        kb_variant = ",abnt2",
        kb_options = "lv3:rwin_switch",
        resolve_binds_by_sym = true,
        touchpad = {
            -- tap_to_click = false,
            disable_while_typing = true,
        },
    },
})



hl.on("window.open", function(w)
    if w.class == "google-chrome" then
        hl.workspace_rule({
            workspace = tostring(w.workspace.id),
            gaps_in = 0,
            gaps_out = 0,
        })
    end
end)


-- hl.on("window.open_early", function(w)
--     if w.class ~= "google-chrome" then return end
--
--     hl.workspace_rule({
--         workspace = tostring(w.workspace.id),
--         gaps_in = 0,
--         gaps_out = 0,
--     })
-- end)
--


hl.on("window.close", function(w)
    if w.class == "google-chrome" then
        hl.workspace_rule({
            workspace = tostring(w.workspace.id),
            gaps_in = NORMAL_GAPS_IN,
            gaps_out = NORMAL_GAPS_OUT,
        })
    end
end)


hl.bind("CTRL + space",     hl.dsp.exec_cmd(scripts_path .. "set-next-keyboard-layout"))
hl.bind("CTRL + ccedilla",  hl.dsp.exec_cmd(scripts_path .. "set-next-keyboard-layout"))
hl.bind("CTRL + semicolon", hl.dsp.exec_cmd(scripts_path .. "set-next-keyboard-layout"))


-- 66 is Caps Lock code;
hl.bind("code:66", hl.dsp.exec_cmd("pkill -SIGRTMIN+11 waybar"), {
    release = true,
    ignore_mods = true,
    non_consuming = true
})



hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(scripts_path .. "power-menu"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(scripts_path .. "power-menu"))

hl.bind("ALT + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind("ALT + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))
hl.bind("ALT + SHIFT + k",  hl.dsp.window.swap({ direction = "up" }))
hl.bind("ALT + SHIFT + l",  hl.dsp.window.swap({ direction = "right" }))



hl.bind("ALT + p", hl.dsp.exec_cmd(scripts_path .. "rofi-clip-history"))
hl.bind("ALT + r", hl.dsp.exec_cmd(scripts_path .. "rofi-recent-files"))


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "nautilus"
local menu        = "hyprlauncher"


-------------------
---- AUTOSTART ----
-------------------


hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
	hl.exec_cmd("brightnessctl -n2 set 25%")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
    -- hl.exec_cmd("wl-paste --type text --watch cliphist store")
	-- hl.exec_cmd("$HOME/.local/bin/cclipd -s 2 -t 'image/png' -t 'image/*' -t 'text/plain;charset=utf-8' -t 'text/*'")
	hl.exec_cmd("$HOME/.local/bin/cclipd -s 2 -t 'image/*' -t 'text/*'")
end)



-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = NORMAL_GAPS_IN,
        gaps_out = NORMAL_GAPS_OUT,

        border_size = 0,

        col = {
            -- active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            active_border   = { colors = {"rgba(33ccffee)"}, angle = 45 },
			inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,

        layout = "dwindle",
    },

    decoration = {
		rounding       = 10,
		rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
-- hl.curve("easy",           { type = "spring", mass = 1, stiffness = 638, dampening = 30 })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 638, dampening = 40 })

hl.animation({ leaf = "global",        enabled = false,   speed = 10,   bezier = "default" })

hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy", style = "slide", })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 4.1,  spring = "easy", })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, spring = "easy", style = "slide" })
-- hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })

-- hl.animation({ leaf = "fadeIn",        enabled = false,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = false,  speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade",          enabled = false,  speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers",        enabled = false,  speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn",      enabled = false,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut",     enabled = false,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn",  enabled = false,  speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = false,  speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces",    enabled = false,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = false,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = false,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor",    enabled = false,  speed = 7,    bezier = "quick" })
-- hl.animation({ leaf = "border",        enabled = false,  speed = 5.39, bezier = "easeOutQuint" })



---------------
---- INPUT ----
---------------

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------


hl.bind("ALT + SHIFT + 4", hl.dsp.exec_cmd([[grim -g "$(slurp)" "$HOME/Pictures/Screenshots/Screenshot From $(date +'%Y-%m-%d %H-%M-%S').png"]]))
hl.bind("ALT + SHIFT + 3", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))

hl.bind("SUPER + P", hl.dsp.exec_cmd("rofi -show drun -drun-match-fields name -theme ojf"))


local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local alt = "ALT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + F4", hl.dsp.window.close())

-- closeWindowBind:set_enabled(false)


-- hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + u", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness

-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && pkill -RTMIN+1 waybar"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && pkill -RTMIN+1 waybar"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && pkill -RTMIN+1 waybar"),     { locked = true, repeating = false })


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts_path .. "volume-control up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts_path .. "volume-control down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(scripts_path .. "volume-control mute"), { locked = true, repeating = false })



hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(scripts_path .. "brightness-control up"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(scripts_path .. "brightness-control down"),                { locked = true, repeating = true })




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

hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next())

hl.bind(mainMod .. " + h", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind(mainMod .. " + j", hl.dsp.focus({ workspace = "e-2" }))
-- hl.bind(mainMod .. " + k", hl.dsp.focus({ workspace = "e-2" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + semicolon", hl.dsp.focus({ workspace = "previous_per_monitor" }))
hl.bind(mainMod .. " + ccedilla", hl.dsp.focus({ workspace = "previous_per_monitor" }))


-- Move focus with mainMod + arrow keys
hl.bind(alt .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(alt .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(alt .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(alt .. " + j", hl.dsp.focus({ direction = "down" }))


hl.bind("SUPER + m", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + comma", hl.dsp.focus({ direction = "right" }))



hl.bind("SUPER + N", hl.dsp.exec_cmd(scripts_path .. "goto-new-ws"))


hl.config({
    binds = {
		workspace_back_and_forth = true,
    },
    
	dwindle = {
        preserve_split = true,
    },
})


local FLOAT_WIDTH = 1000
local FLOAT_HEIGHT = 640

hl.bind("SUPER + SPACE", function()
    local w = hl.get_active_window()
    if w == nil then return end

    if w.floating then
        hl.dispatch(hl.dsp.window.float({ action = "unset", window = w }))
    else
        hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
        hl.dispatch(hl.dsp.window.resize({
            x = FLOAT_WIDTH,
            y = FLOAT_HEIGHT,
            window = w
        }))
        hl.dispatch(hl.dsp.window.center({ window = w }))
    end
end)


