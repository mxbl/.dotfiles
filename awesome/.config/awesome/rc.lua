local gears = require("gears")
local gfs = require("gears.filesystem")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

require("signal_handlers")

-- Error handling
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end
-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gfs.get_xdg_config_home() .. "awesome/theme.lua")
beautiful.get().wallpaper = gfs.get_xdg_config_home() .. "awesome/justblack.jpg"

-- Mod4 - windows key; Mod1 - Alt
Mod = "Mod1"

awful.layout.layouts = {
	awful.layout.suit.max,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
}

Keyboardlayout = awful.widget.keyboardlayout()
awful.screen.connect_for_each_screen(function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
	s.mywibox = awful.wibar({ position = "top", screen = s })
	s.mypromptbox = awful.widget.prompt({ fg = beautiful.fg_focus })
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			awful.widget.taglist({
				screen = s,
				filter = awful.widget.taglist.filter.noempty,
			}),
			awful.widget.layoutbox(s),
			wibox.widget.systray(),
			Keyboardlayout,
			wibox.widget.textclock(),
			s.mypromptbox,
		},
	})
end)

Globalkeys = require("bindings").globalkeys(Mod)
Clientkeys = require("bindings").clientkeys(Mod)

for i = 1, 9 do
	Globalkeys = gears.table.join(
		Globalkeys,
		-- View tag only.
		awful.key({ Mod }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		awful.key({ Mod, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),

		awful.key({ Mod, "Control" }, "#" .. i + 9, function()
			local t = client.focus.screen.tags[i]
			awful.prompt.run({
				prompt = "Rename tag: ",
				text = t.name,
				textbox = awful.screen.focused().mypromptbox.widget,
				exe_callback = function(s)
					t.name = s
				end,
			})
		end, { description = "Rename tag #" .. i, group = "tag" })
	)
end

Clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ Mod }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ Mod }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

root.keys(Globalkeys)

awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = Clientkeys,
			buttons = Clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	-- Floating clients.
	{
		rule_any = {
			instance = {},
			class = {
				"Arandr",
			},
			name = {},
			role = {},
		},
		properties = { floating = true },
	},
}

awful.spawn("nm-applet")
awful.spawn("picom -b")
awful.spawn('setxkbmap -layout "us,de"')
