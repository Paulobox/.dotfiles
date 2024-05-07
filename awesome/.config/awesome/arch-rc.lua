-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local logout = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local lain = require("lain")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")



-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("~/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }
local archLinuxMenu = { "Arch Linux", archMenu }
-- Define the Arch Linux menu entries
local archMenu = {
    { "Accessories", {
        { "Terminal", terminal },
        { "File Manager", "thunar" },
        { "Text Editor", "gedit" },
        -- Add more accessories as needed
    }},
    { "Internet", {
        { "Web Browser", "firefox" },
        { "Email Client", "thunderbird" },
        -- Add more internet-related entries as needed
    }},
    { "Graphics", {
        { "Image Viewer", "feh" },
        { "Screenshot Tool", "gnome-screenshot" },
        -- Add more graphics-related entries as needed
    }},
    -- Add more categories and entries as needed
}

-- Insert Arch Linux menu into the main menu if has_fdo is true
if has_fdo then
    local new_menu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal, archLinuxMenu }
    })
    mymainmenu = new_menu
else
    -- Add Arch Linux menu to the existing mymainmenu
    table.insert(mymainmenu.items, archLinuxMenu)
end

-- custom options start from here----------
-- remove borders if maximized
client.connect_signal("property::maximized", function(c)
    if c.maximized then
        c.border_width = 0
    else
        c.border_width = beautiful.border_width
    end
end)

-- Awesome icon top left
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- Seperator
tbox_seperator = wibox.widget.textbox ("│")

--keyboard emoji
keyboard_emoji = wibox.widget.textbox ("⌨")

-- custom lain widgets
local cpu_widget = lain.widget.cpu {
  settings = function()
    widget:set_markup("CPU " .. cpu_now.usage.. "% ")
  end
}

local ram_widget = lain.widget.mem {
  settings = function()
    widget:set_markup("RAM " .. mem_now.perc.. "% ")
  end
}

local mybattery = lain.widget.bat {
    settings = function()
        widget:set_markup("Battery " .. bat_now.perc .. "%")
    end
}

--calendar widget + time format
mytextclock = wibox.widget.textclock(" %d %B, %a │ %H:%M ")
local cw = calendar_widget({
    theme = 'dark',
    placement = 'top_right',
    start_sunday = false,
    radius = 8,
    week_numbers = false,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    awful.tag({ "1-terminal", "2-www", "3-tmux", "4-kitty", "5-Thunar", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
        -- -- rounder corners of taskilist items
        -- style   = {
        --     -- border_width = 12,
        --     -- border_color = "#777777",
        --     shape        = gears.shape.rounded_bar,
     -- },
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            mylauncher,
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            -- nm_applet_widget,
            tbox_seperator,
            ram_widget,
            tbox_seperator,
            cpu_widget,
            tbox_seperator,
            brightness_widget{
            type = 'icon_and_text',
            program = 'light',
            step = 2,
        },
            tbox_seperator,
            volume_widget{
            widget_type = 'icon_and_text'
        },
            layout = wibox.layout.fixed.horizontal,
            tbox_seperator,
            keyboard_emoji,
            mykeyboardlayout,
            tbox_seperator,
            mybattery,
            tbox_seperator,
            mytextclock,
            tbox_seperator,
            wibox.widget.systray(),
            logout(),
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- -- Disabling mouse scroll on desktop for scrolling through tags
-- {{{ Mouse bindings
-- root.buttons(gears.table.join(
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    -- awful.button({ }, 4, awful.tag.viewnext),
    -- awful.button({ }, 5, awful.tag.viewprev)
-- ))
-- }}}

--toggle border width for current tag only, function modkey+shift+b
local xresources = require("beautiful.xresources")
dpi = xresources.apply_dpi
local function toggle_border_width()
    local t = awful.screen.focused().selected_tag
    if t then
        for _, c in ipairs(t:clients()) do
            if c.border_width == 0 then
                c.border_width = beautiful.border_width or dpi(1)
            else
                c.border_width = dpi(0)
            end
        end
    end
end

----toggle border_width for all tags
--local function toggle_border_width()
--    for _, c in ipairs(client.get()) do
--        if c.border_width == 0 then
--            c.border_width = beautiful.border_width or dpi(1)
--        else
--            c.border_width = dpi(0)
--        end
--    end
--end

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    --           {description = "view previous", group = "tag"}),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    --           {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program -- terminals
    awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control"   }, "t", function () awful.spawn("qterminal") end,
              {description = "open qterminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", function () awful.spawn("rofi -show power-menu -modi power-menu:~/.local/bin/rofi-power-menu") end,
              {description = "powermenu", group = "custom"}),

      -- toggle satus bar alt+b additional mysettings
  -- Show/Hide Wibox
  awful.key({ modkey }, "b", function ()
    for s in screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      end
    end
  end,
    {description = "toggle wibox", group = "awesome"}),

    --screenshot
    awful.key({},            "Print",     function () awful.spawn("flameshot gui") end ),

    -- increase decrease gap size
  awful.key({ modkey, }, "=", function () awful.tag.incgap(1)    end,
    {description = "increase gap", group = "layout"}),
  awful.key({ modkey, }, "-", function () awful.tag.incgap(-1)    end,
    {description = "decrease gap", group = "layout"}),
  awful.key({ modkey, "Shift" }, "=", function () awful.tag.incgap(4)    end,
    {description = "increase gap", group = "layout"}),
  awful.key({ modkey, "Shift" }, "-", function () awful.tag.incgap(-4)    end,
    {description = "decrease gap", group = "layout"}),

   -- other keybindings

  -- volume
  awful.key({}, "XF86MonBrightnessUp", function () brightness_widget:inc() end, {description = "Increase brightness", group = "custom"}),
  awful.key({}, "XF86MonBrightnessDown", function () brightness_widget:dec() end, {description = "Decrease brightness", group = "custom"}),
  awful.key({}, "XF86AudioRaiseVolume", function() volume_widget.inc() end),
  awful.key({}, "XF86AudioLowerVolume", function() volume_widget.dec() end),
  awful.key({}, "XF86AudioMute", function() volume_widget.toggle() end),


  -- rofi menu
  awful.key({ modkey, "Shift" }, "r", function () awful.spawn("rofi -show drun") end,
    {description = "Show Rofi drun menu", group = "launcher"}),
awful.key({ modkey, "Shift" }, "e", function () os.execute("/bin/bash -c '~/.myscripts/unicode'") end,
    {description = "Emoji menu", group = "launcher"}),
awful.key({ modkey, "Shift" }, "t", function () awful.spawn("/usr/bin/env bash -c '~/.myscripts/cedit'") end,
    {description = "Config Edit dmenu", group = "launcher"}),
awful.key({ modkey, "Shift" }, "d", function () awful.spawn("/usr/bin/env bash -c '~/.myscripts/dirjump'") end,
    {description = "Jump to directory dmenu", group = "launcher"}),

--toggle border_width
awful.key({ modkey, "Shift" }, "b", function()
    toggle_border_width()
end),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- -- Disabling original awesome Prompt here
    -- awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
    --           {description = "run prompt", group = "launcher"}),
      -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- Dmenu
    awful.key({ modkey },            "r",     function ()
    awful.util.spawn("dmenu_run") end,
		{description = "run dmenu", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"}),

      -- move floating windows with keyboard
-- awful.key({ modkey }, "Prior", function (c) c:relative_move(-20, -20,  40,  40) end),
-- awful.key({ modkey }, "Next",  function (c) c:relative_move( 20,  20, -40, -40) end),
awful.key({ modkey }, "Next", function (c) c:relative_move(0, 0, -40, 0) end),
awful.key({ modkey, "Shift" }, "Next", function (c) c:relative_move(0, 0, 40, 0) end),
awful.key({ modkey }, "Prior", function (c) c:relative_move(0, 0, 0, -40) end),
awful.key({ modkey, "Shift" }, "Prior", function (c) c:relative_move(0, 0, 0, 40) end),
awful.key({ modkey }, "Down",  function (c) c:relative_move(  0,  20,   0,   0) end),
awful.key({ modkey, "Shift" }, "Down",  function (c) c:relative_move(  0,  60,   0,   0) end),
awful.key({ modkey }, "Up",    function (c) c:relative_move(  0, -20,   0,   0) end),
awful.key({ modkey, "Shift" }, "Up",    function (c) c:relative_move(  0, -60,   0,   0) end),
awful.key({ modkey }, "Left",  function (c) c:relative_move(-20,   0,   0,   0) end),
awful.key({ modkey, "Shift" }, "Left",  function (c) c:relative_move(-70,   0,   0,   0) end),
awful.key({ modkey }, "Right", function (c) c:relative_move( 20,   0,   0,   0) end),
awful.key({ modkey, "Shift" }, "Right", function (c) c:relative_move( 70,   0,   0,   0) end),

awful.key({ modkey, "Shift" }, "y", function () awful.client.incwfact(-0.05) end),
awful.key({ modkey, "Shift" }, "u", function () awful.client.incwfact( 0.05) end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Brave",
          "Kodi",
          "Mousepad",
          "qterminal",
          "Arandr",
          "Alacritty",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "Xfce4-keyboard-settings",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, maximized = false, placement = awful.placement.centered }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Autostart Applications
awful.spawn.with_shell("sleep 0.5 && ~/.fehbg")
awful.spawn.with_shell("setxkbmap -layout 'us,gb' -option 'grp:win_space_toggle'")
awful.spawn.with_shell("clipmenud")
-- awful.spawn.with_shell("sleep 2 && picom --experimental-backends --daemon")
-- awful.spawn.with_shell("sleep 1 && gpick")
-- awful.spawn.with_shell("sleep 1 && flameshot")
-- awful.spawn.with_shell("sleep 2 && nm-applet")
