
hl.on("hyprland.start", function()
	hl.exec_cmd("wl-clip-persist --clipboard regular")
    -- hl.exec_cmd("wl-paste --type text --watch cliphist store")
	
	-- hl.exec_cmd("$HOME/.local/bin/cclipd -s 2 -t 'image/png' -t 'image/*' -t 'text/plain;charset=utf-8' -t 'text/*'")
	-- hl.exec_cmd("$HOME/.local/bin/cclipd -s 2 -t 'image/*' -t 'text/*'")
end)
