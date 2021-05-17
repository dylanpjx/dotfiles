local poweroff_text_icon = ""
local reboot_text_icon = ""
local suspend_text_icon = ""

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

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  menu_terminal,
                }
    })
end

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()


-- {{{ Shutdown Menu
shutdownmenu = {
  { poweroff_text_icon .. " Shutdown", function() awful.spawn.with_shell("poweroff") end },
  { reboot_text_icon .. " Restart", function() awful.spawn.with_shell("reboot") end },
  { suspend_text_icon .. " Sleep", function() awful.spawn.with_shell("systemctl suspend") end }
}
-- }}}

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = shutdownmenu })
