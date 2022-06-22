local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "/themes/custom"
local old_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "Sans 11"
theme.wallpaper     = themes_path.."/Hamnøy, Norway (Photo credit to Kym Ellis) [6000 x 4000].jpg"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#44475a"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_normal = "#181c24"
theme.border_focus  = "#bdae93"
theme.border_marked = "#91231c"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.menu_submenu_icon = themes_path.."/icons/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.titlebar_close_button_normal = themes_path.."/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."/icons/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."/icons/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."/icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."/icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."/icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."/icons/titlebar/maximized_focus_active.png"


theme.layout_fairh = old_path.."default/layouts/fairhw.png"
theme.layout_fairv = old_path.."default/layouts/fairvw.png"
theme.layout_floating  = old_path.."default/layouts/floatingw.png"
theme.layout_magnifier = old_path.."default/layouts/magnifierw.png"
theme.layout_max = old_path.."default/layouts/maxw.png"
theme.layout_fullscreen = old_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = old_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = old_path.."default/layouts/tileleftw.png"
theme.layout_tile = old_path.."default/layouts/tilew.png"
theme.layout_tiletop = old_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = old_path.."default/layouts/spiralw.png"
theme.layout_dwindle = old_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = old_path.."default/layouts/cornernww.png"
theme.layout_cornerne = old_path.."default/layouts/cornernew.png"
theme.layout_cornersw = old_path.."default/layouts/cornersww.png"
theme.layout_cornerse = old_path.."default/layouts/cornersew.png"


theme.awesome_icon = themes_path.."/icons/awesome.png"

return theme
