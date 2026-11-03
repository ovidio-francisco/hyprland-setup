
-- local NORMAL_GAPS_IN  = 4
-- local NORMAL_GAPS_OUT = 8


local config = require('config')

hl.config({
    general = {
        gaps_in  = config.NORMAL_GAPS_IN,
        gaps_out = config.NORMAL_GAPS_OUT,
	}
})




local gapsDisabled = {}

hl.bind("SUPER + F12", function()
    local ws = hl.get_active_workspace()
    if not ws then return end

    local id = tostring(ws.id)
    gapsDisabled[id] = not gapsDisabled[id]

    hl.workspace_rule({
        workspace = id,
        gaps_in = gapsDisabled[id] and 0 or config.NORMAL_GAPS_IN,
        gaps_out = gapsDisabled[id] and 0 or config.NORMAL_GAPS_OUT,
    })
end)


