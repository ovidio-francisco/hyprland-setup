
--------------------
---- WORKSPACES ----
--------------------

local config = require('config')


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


-- hl.bind("SUPER + SPACE", hl.dsp.window.float({ action = "toggle" }))
