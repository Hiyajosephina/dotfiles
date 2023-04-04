--     ___                                        
--    /   |_      _____  _________  ________  ___ 
--   / /| | | /| / / _ \/ ___/ __ \/ __  __ \/ _ \
--  / ___ | |/ |/ /  __(__  ) /_/ / / / / / /  __/
-- /_/  |_|__/|__/\___/____/\____/_/ /_/ /_/\___/ 
-- AWESOME CONFIG (~/.config/awesome/rc.lua)
-------------------------------------------------------
-- Hide tmux keybinds from the hotkeys popup
package.loaded['awful.hotkeys_popup.keys.tmux'] = {}

-- Importing libraries
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local wibox = require("wibox")
local beautiful = require('beautiful')
local keys = require('keys')
local lain = require('lain')
local dpi = require("beautiful.xresources").apply_dpi

-- Loading the widgets from awesome-wm-widgets (github.com/streetturtle/awesome-wm-widgets)
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local brightness_widget = require(
                              "awesome-wm-widgets.brightness-widget.brightness")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local logout_menu_widget = require(
                               "awesome-wm-widgets.logout-menu-widget.logout-menu")
local net_speed_widget =
    require("awesome-wm-widgets.net-speed-widget.net-speed")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local pacman_widget = require("awesome-wm-widgets.pacman-widget.pacman")
-- Loading the theme
local theme_path = string.format('%s/.config/awesome/themes/%s/theme.lua',
                                 os.getenv('HOME'), 'Morning')
beautiful.init(theme_path)

local interval = 1.0

-- Set the wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

-- {{{ Variable definitions
local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
local mytextclock = wibox.widget.textclock(
                        markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") ..
                            markup("#de5e1e", " %H:%M:%S "))
mytextclock.font = beautiful.font
mytextclock.refresh = interval

-- Coretemp
local tempicon = wibox.widget.imagebox(beautiful.widget_temp)
local temp = wibox.widget.textbox()

awful.widget.watch('sensors', interval, function(widget, stdout)
    local temp_now = stdout:match("Package id 0:%s+%+(%d+%.%d)°C")
    if temp then
        widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f",
                                        temp_now .. "°C "))
    else
        widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f", "N/A "))
    end
end, temp)

-- Battery
local baticon = wibox.widget.imagebox(beautiful.widget_batt)
local bat = wibox.widget.textbox()

awful.widget.watch('acpi', interval, function(widget, stdout)
    local is_charging = stdout:match("Charging")
    local not_charging = stdout:match("Not charging")
    local bat_perc = stdout:match("(%d?%d?%d)%%")

    if not_charging ~= nil then
        widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f",
                                        bat_perc .. "% "))
    elseif is_charging ~= nil then
        widget:set_markup(markup.fontfg(beautiful.font, "#7493d2",
                                        bat_perc .. "% "))
    else
        if tonumber(bat_perc) <= 25 then
            widget:set_markup(markup.fontfg(beautiful.font, "#ff0000",
                                            bat_perc .. "% "))
        else
            widget:set_markup(markup.fontfg(beautiful.font, "#e33a6e",
                                            bat_perc .. "% "))
        end
    end
end, bat)

-- ALSA volume
local volicon = wibox.widget.imagebox(beautiful.widget_vol)
local volume = wibox.widget.textbox()

awful.widget.watch('amixer sget Master', interval, function(widget, stdout)
    local vol_now = stdout:match("%[(%d?%d?%d)%%%]")
    -- Check if the volume is muted
    local is_muted = stdout:match("%[(o%D%D?)%]")
    if is_muted ~= "on" then
        widget:set_markup(markup.fontfg(beautiful.font, "#ff0000", "Muted "))
    else
        widget:set_markup(markup.fontfg(beautiful.font, "#7493d2",
                                        vol_now .. "% "))
    end
end, volume)

-- Package symbol
local package_symbol = wibox.widget.textbox()
package_symbol:set_markup(markup.fontfg(beautiful.font, "#87af5f", "📦 "))

-- Fan Speed
local fsicon = wibox.widget.imagebox(beautiful.widget_fs)
local fan_speed = wibox.widget.textbox()
awful.widget.watch('sensors', interval, function(widget, stdout)
    local fan_now = stdout:match("fan1:%s+(%d+)")
    if fan_now then
        widget:set_markup(markup.fontfg(beautiful.font, "#6fb1b0",
                                        fan_now .. "RPM "))
    else
        widget:set_markup(markup.fontfg(beautiful.font, "#6fb1b0", "N/A "))
    end
end, fan_speed)

local my_table = gears.table
awful.screen.connect_for_each_screen(function(s)
    s.quake = lain.util.quake({app = awful.util.terminal})

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 2,
                       function() awful.layout.set(awful.layout.layouts[1]) end),
                                        awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function() awful.layout.inc(1) end), awful.button(
                                            {}, 5,
                                            function()
            awful.layout.inc(-1)
        end)))

    -- Taglist
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all,
                                       awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter
                                             .currenttags,
                                         awful.util.tasklist_buttons)

    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(20),
        bg = ""
    })
    -- Add widgets to the wibar
    s.mywibox:setup{
        -- curved_wibox,
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            net_speed_widget,
            volicon,
            volume_widget {
                widget_type = 'horizontal_bar',
                step = 5,
                main_color = "#7493d2",
                mute_color = "#e54c62",
                margins = 5,
                tooltip = true
            },
            brightness_widget {
                type = 'arc',
                program = 'xbacklight',
                step = 5,
                rmb_set_max = true
            },
            ram_widget({
                color_used = "#ffaa55",
                -- mild green color for free memory 
                -- more green than a3be8c
                --
                color_free = "#73ff88",
                --
                widget_show_buf = true
            }),
            pacman_widget({
                interval = 600, -- Refresh every 10 minutes
                polkit_agent_path = '/usr/bin/pkaction'
            }),
            package_symbol,
            fsicon,
            fan_speed,
            cpu_widget({
                width = 50,
                step_width = 2,
                step_spacing = 0,
                color = "#e54c62"
            }),
            -- fsicon,
            -- beautiful.fs.widget,
            -- weathericon,
            -- beautiful.weather.widget,
            tempicon,
            temp,
            baticon,
            bat,
            clockicon,
            mytextclock,
            logout_menu_widget({
                onlock = function()
                    awful.spawn.with_shell("~/scripts/lock.sh")
                end
            })
        }
    }

    -- -- Create the bottom wibox
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(10), bg = "#00000000", fg = "#00000000", font = 'Terminus 5' })
    --
    -- -- Add widgets to the bottom wibox
    -- s.mybottomwibox:setup {
    --     layout = wibox.layout.align.horizontal,
    --     { -- Left widgets
    --         layout = wibox.layout.fixed.horizontal,
    --     },
    --     s.mytasklist, -- Middle widget
    --     { -- Right widgets
    --         layout = wibox.layout.fixed.horizontal,
    --     },
    -- }

end)

-- Create a wibox for each screen and add it
-- awful.screen.connect_for_each_screen(function (s) beautiful.at_screen_connect(s) end)
for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile, awful.layout.suit.fair, awful.layout.suit.floating,
    awful.layout.suit.max, awful.layout.suit.magnifier
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

awful.screen.connect_for_each_screen(function(s)
    local tagTable = {'', '🌐', '', '📚', '', '🎬', '🎮'}

    --[[ Uncomment this if not using custom tag names (no. of tags will be derived from `tags` variable set in keys.lua)
    -- Also uncomment `keys.tags = tags` line in the Variables section in keys.lua!
    local tagTable = {}
    for i = 1, keys.tags do
        table.insert(tagTable, tostring(i))
    end
    ]]

    awful.tag(tagTable, s, awful.layout.layouts[1])
end)

awful.rules.rules = {
    -- All windows
    {
        rule = {},
        except_any = {class = {'Polybar'}}, -- Don't put border colors on polybar
        properties = {
            border_width = beautiful.border_width,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }, -- Floating exceptions
    {
        rule_any = {
            class = {'Lxappearance', 'qt5ct'},
            name = {'Event Tester'}, -- xev
            role = {'pop-up', 'GtkFileChooserDialog'},
            type = {'dialog'}
        },
        properties = {floating = true}
    }
}

-- Enable sloppy focus
client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', {raise = false})
end)

-- Colored borders
client.connect_signal('focus',
                      function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus',
                      function(c) c.border_color = beautiful.border_normal end)

-- Rounded corners
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
end)
client.connect_signal("property::fullscreen", function(c)
    if c.fullscreen then
        c.shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 0)
        end
    else
        c.shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 10)
        end
    end

end)

-- Autostart
-- awful.spawn.with_shell('~/.config/polybar/launch.sh')
awful.spawn.with_shell('picom')
awful.spawn.with_shell('dunst')
awful.spawn.with_shell(
    'feh --bg-scale ~/.config/awesome/themes/Morning/wallpaper.png')
awful.spawn.with_shell(
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1')
awful.spawn.with_shell('~/scripts/autolock.sh')
-- awful.spawn.with_shell('easyeffects --gapplication-service')
awful.spawn.with_shell('libinput-gestures-setup start')
awful.spawn.with_shell('/usr/lib/geoclue-2.0/demos/agent &')
awful.spawn.with_shell('redshift -x && redshift -l &')
-- Garbage Collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)

-- Padding
--  
