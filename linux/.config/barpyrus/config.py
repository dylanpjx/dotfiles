from barpyrus import hlwm
from barpyrus import widgets as W
from barpyrus.core import Theme
from barpyrus import lemonbar
from barpyrus import trayer
import sys

# Copy this config to ~/.config/barpyrus/config.py

# set up a connection to herbstluftwm in order to get events
# and in order to call herbstclient commands
hc = hlwm.connect()

# get the geometry of the monitor
monitor = sys.argv[1] if len(sys.argv) >= 2 else 0
(x, y, monitor_w, monitor_h) = hc.monitor_rect(monitor)
height = 16 # height of the panel
width = monitor_w # width of the panel
hc(['pad', str(monitor), str(height)]) # get space for the panel

# you can define custom themes
grey_frame = Theme(bg = '#303030', fg = '#EFEFEF', padding = (3,3))

# Widget configuration:
font = '-*-fixed-medium-*-*-*-14-*-*-*-*-*-iso10646-1'
symbol_font = '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'
bar = lemonbar.Lemonbar(
        geometry = (x,y,width,height),
        font=font,
        symbol_font=symbol_font,
        )
update_interval = '1'
bar.widget = W.ListLayout([
    W.RawLabel('%{l}'),
    hlwm.HLWMTags(hc, monitor),

    W.RawLabel('%{c}'),
    grey_frame(hlwm.HLWMWindowTitle(hc)),

    W.RawLabel('%{r}'),
    grey_frame(W.DateTime('%d. %B, %H:%M')),

    W.RawLabel('  '),
    trayer.TrayerWidget(),
])


