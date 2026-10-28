
hl.on("window.open", function(w)
    if string.upper(w.class) == "GOOGLE-CHROME" then
        hl.workspace_rule({
            workspace = tostring(w.workspace.id),
            gaps_in = 0,
            gaps_out = 0,
        })
    end
end)


hl.on("window.close", function(w)
    if string.upper(w.class) == "GOOGLE-CHROME" then
        hl.workspace_rule({
            workspace = tostring(w.workspace.id),
            gaps_in = NORMAL_GAPS_IN,
            gaps_out = NORMAL_GAPS_OUT,
        })
    end
end)



















-- hl.on("window.open", function(w)
--     local ws = w.workspace
--
--     -- Temporary diagnostic: remove once it works
--     hl.notification.create({
--         text = "class=" .. tostring(w.class)
--             .. " workspace=" .. tostring(ws and ws.name),
--         timeout = 4000,
--         icon = "ok",
--     })
--
--     if w.class ~= "google-chrome" or not ws then return end
--
--     local workspace = ws.special and tostring(ws.name) or tostring(ws.id)
--
--     hl.workspace_rule({
--         workspace = workspace,
--         gaps_in = 0,
--         gaps_out = 0,
--     })
--
--     hl.exec_scheduled_prop_refresh_immediately()
-- end)





