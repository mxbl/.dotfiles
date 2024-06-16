local gears = require("gears")
local awful = require("awful")

local M = {}

M.globalkeys = function(modkey)
    return gears.table.join(
        awful.key({modkey}, "u", awful.tag.viewprev, {description = "view previous", group = "tag"}),
        awful.key({modkey}, "i", awful.tag.viewnext, {description = "view next", group = "tag"}),

        -- j/k
        awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end,
            {description = "focus next by index", group = "client"}),
        awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end,
            {description = "focus previous by index", group = "client"}),
        awful.key({modkey, "Shift"}, "j", function() awful.client.swap.byidx(1) end,
            {description = "swap with next client by index", group = "client"}),
        awful.key({modkey, "Shift"}, "k", function() awful.client.swap.byidx(-1) end,
            {description = "swap with previous client by index", group = "client"}),

        -- resizing windows
        awful.key({modkey}, "l", function() awful.tag.incmwfact(0.02) end,
            {description = "increase master width factor", group = "layout"}),
        awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.02) end,
            {description = "decrease master width factor", group = "layout"}),

        -- Next screen
        awful.key({modkey}, ",",
            function()
                awful.screen.focus_relative(1)
            end,
            {description = "focus the next screen", group = "screen"}
        ),

        awful.key({modkey,  "Shift"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),

        awful.key({modkey}, "p", function()
            awful.spawn("dmenu_run -m " .. awful.screen.focused().index - 1)
            --awful.spawn("rofi -show run -m " .. awful.screen.focused().index - 1)
        end, {description = "Launch dmenu on the current screen", group = "launcher"}),

        awful.key({modkey, "Shift"}, "q", awesome.quit,
            {description = "quit awesome", group = "awesome"}),

        awful.key({modkey}, "space", function() mykeyboardlayout.next_layout(); end)
    )
end

M.clientkeys = function(modkey)
    return gears.table.join(
        awful.key({modkey}, "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}
        ),
        awful.key({modkey}, "q",
            function(c)
                c:kill()
            end,
            {description = "close", group = "client"}
        ),

        awful.key({modkey, "Shift"}, "f",
            awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}
        ),

        awful.key({modkey, "Control"}, "Return",
            function(c)
                c:swap(awful.client.getmaster())
            end,
            {description = "move to master", group = "client"}
        ),

        awful.key({modkey, "Shift"}, ",",
            function(c)
                c:move_to_screen()
            end,
            {description = "move to screen", group = "client"}
        ),

        awful.key({modkey}, "t",
            function(c)
                --c.ontop = not c.ontop
                if awful.layout.getname() == "tile" then
                    awful.layout.set(awful.layout.suit.tile.left)
                else
                    awful.layout.set(awful.layout.suit.tile)
                end
            end,
            {description = "toggle keep on top", group = "client"}
        ),

        -- awful.key({modkey}, "n",
        --     function(c)
        --         -- The client currently has the input focus, so it cannot be
        --         -- minimized, since minimized clients can't have the focus.
        --         c.minimized = true
        --     end,
        --     {description = "minimize", group = "client"}
        -- ),

        awful.key({modkey}, "m",
            function(c)
                --c.maximized = not c.maximized
                --c:raise()
                if awful.layout.getname() == "max" then
                    awful.layout.set(awful.layout.suit.tile)
                else
                    awful.layout.set(awful.layout.suit.max)
                end
            end,
            {description = "(un)maximize", group = "client"}
        ),

        -- TODO: needed ??
        awful.key({modkey, "Control"}, "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end,
            {description = "(un)maximize vertically", group = "client"}
        ),
        awful.key({modkey, "Shift"}, "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end,
            {description = "(un)maximize horizontally", group = "client"}
        )
    )
end

return M
