-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


-- {{{ Key bindings
globalkeys = gears.table.join(
    -- System/Awesome
    awful.key({ modkey }, "F1",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    awful.key({ modkey, "Control"}, "l", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control" }, "q", function () awful.spawn.with_shell("systemctl poweroff") end,
              {description = "shutdown", group = "awesome"}),
    awful.key({ modkey, "Control" }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", function () awful.spawn.with_shell("reboot") end,
              {description = "restart", group = "system"}),
    awful.key({ modkey, "Control" }, "s", function() awful.spawn.with_shell("systemctl suspend") end,
              {description = "sleep", group = "system"}),

    -- Default applications
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "Return", function () awful.spawn(terminal.." -e tmux") end,
              {description = "open a terminal with tmux", group = "launcher"}),
    awful.key({ modkey }, "b", function () awful.spawn(browser) end,
              {description = "open a browser", group = "launcher"}),
    awful.key({ modkey }, "e", function () awful.spawn(explorer_cmd) end,
              {description = "open a file manager", group = "launcher"}),

    -- Focus
    awful.key({ modkey }, "n",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "p",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    awful.key ({ modkey }, "h", 
      function() 
        awful.client.focus.global_bydirection("left", nil, true)
      end,
      {description = "focus left", group = "client"}
    ),
    awful.key ({ modkey }, "j", 
      function() 
        awful.client.focus.global_bydirection("down", nil, true)
      end,
      {description = "focus down", group = "client"}
    ),
    awful.key ({ modkey }, "k", 
      function() 
        awful.client.focus.global_bydirection("up", nil, true)
      end,
      {description = "focus up", group = "client"}
    ),
    awful.key ({ modkey }, "l", 
      function() 
        awful.client.focus.global_bydirection("right", nil, true)
      end,
      {description = "focus right", group = "client"}
    ),

    -- Moving windows
    awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "p", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "h",     function () awful.client.swap.global_bydirection("left") end,
              {description = "swap with client on the left", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "j",     function () awful.client.swap.global_bydirection("down") end,
              {description = "swap with client on the bottom", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "k",     function () awful.client.swap.global_bydirection("up") end,
              {description = "swap with client on the top", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.client.swap.global_bydirection("right") end,
              {description = "swap with client on the right", group = "layout"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    -- Adjusting layout
    awful.key({ modkey }, "Left",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey }, "Right",     function () awful.tag.incmwfact(0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey }, "Up",     function () awful.client.incwfact( 0.05)          end,
              {description = "increase master height factor", group = "layout"}),
    awful.key({ modkey }, "Down",     function () awful.client.incwfact(-0.05)          end,
              {description = "decrease master height factor", group = "layout"}),


    awful.key({ modkey }, "space", function () awful.layout.inc(1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    -- rofi
    awful.key({ modkey }, "d", function () awful.spawn.with_shell("rofi -modi drun,window -show window", false) end,
              {description = "rofi window", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "d", function () awful.spawn.with_shell("rofi -modi drun,window -show drun", false) end,
              {description = "rofi run", group = "launcher"}),

    -- Screenshots
    awful.key({ modkey }, "s", nil, function () awful.spawn.with_shell(script_path .. "screenshot.sh") end,
        {description = "take screenshot of area", group = "screenshots"}),

    -- Brightness
    awful.key({ modkey }, "Page_Up", function () awful.spawn.with_shell(script_path .. "increase_brightness.sh") end,
        {description = "increase brightness", group = "brightness"}),
    awful.key({ modkey }, "Page_Down", function () awful.spawn.with_shell(script_path .. "decrease_brightness.sh") end,
        {description = "decrease brightness", group = "brightness"}),

    -- Media
    awful.key({ modkey }, "'", function () awful.spawn("pavucontrol") end,
        {description = "open audio mixer", group = "audio"}),
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn.with_shell("amixer set Master 5%+") end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn.with_shell("amixer set Master 5%-") end),
    awful.key({}, "XF86AudioMute", function() awful.spawn.with_shell("amixer -D pulse set Master toggle") end),

    -- Tablet
    awful.key({},  "F10", function () awful.spawn.with_shell(script_path .. "tablet.sh") end,
        {description = "restrict tablet area", group = "tablet"}),

    -- iBus
    awful.key({ modkey },  "c", function ()
      awful.spawn.with_shell(script_path .. "ibus_switch.sh")
    end,
        {description = "change input language", group = "ibus"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey }, "q", function (c) c:kill() end,
              {description = "close", group = "client"}),
    awful.key({ modkey }, "g",  awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey }, ";", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey }, "o", function (c) c:move_to_screen() end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey }, "x",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey, "Control" }, "x",
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
    awful.key({ modkey }, "m",
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
        {description = "(un)maximize horizontally", group = "client"})
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
