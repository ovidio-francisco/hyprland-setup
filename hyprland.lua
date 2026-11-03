--               __                     __                __
--              / /_  __  ______  _____/ /___ _____  ____/ /
--             / __ \/ / / / __ \/ ___/ / __ `/ __ \/ __  / 
--            / / / / /_/ / /_/ / /  / / /_/ / / / / /_/ /  
--           /_/ /_/\__, / .___/_/  /_/\__,_/_/ /_/\__,_/   
--                 /____/_/                                 


-------------------
---- AUTOSTART ----
-------------------


hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
	hl.exec_cmd("brightnessctl -n2 set 25%")
end)



require('look_and_feel')
require('windows')
require('gaps')
require('submaps')
require('input')
require('screens')
require('workspaces')
require('keybinds')
require('clipboard')


-- TODO: alt+sup+l - move to next workspace

