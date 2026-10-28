
local laptop = "eDP-1"
local projector = "HDMI-A-1"
local mirrored = false

hl.bind("SUPER + F8", function()
    mirrored = not mirrored

    if mirrored then
        hl.monitor({
            output = projector,
            mode = "preferred",
            position = "auto",
            scale = 1,
            mirror = laptop,
        })
    else
        hl.monitor({
            output = projector,
            mode = "preferred",
            position = "auto-right",
            scale = 1,
            mirror = "",
        })
    end
end)
