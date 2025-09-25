from barpyrus import hlwm
from barpyrus import widgets as W
from barpyrus import customwidgets as CW
from barpyrus import trayer as Tray
from barpyrus.core import Theme
from barpyrus import lemonbar
import sys

# set up a connection to herbstluftwm in order to get events
# and in order to call herbstclient commands
hc = hlwm.connect()

# get the geometry of the monitor
monitor = int(sys.argv[1] if len(sys.argv) >= 2 else 0)
(x, y, monitor_w, monitor_h) = hc.monitor_rect(monitor)
font = '-*-fixed-medium-*-*-*-14-*-*-*-*-*-iso10646-1'
height = 20 # height of the panel
width = monitor_w # width of the panel
hc(['pad', str(monitor), str(height)]) # get space for the panel

# you can define custom themes
grey_frame = Theme(bg = '#101010', fg = '#f0f0f0', padding = (3,3))

trayer_args = {
    'tint': '0x101010',
    'distance': '136',
    'distancefrom': 'right',
    'monitor': '1',
    'margin': '5'
}

# Widget configuration:
bar = lemonbar.Lemonbar(font=font, geometry=(x,y,width,height))
if (monitor == 0):
    bar.widget = W.ListLayout([
        W.RawLabel('%{l}'),
        grey_frame(hlwm.HLWMWindowTitle(hc)),
        W.RawLabel('%{c}'),
        hlwm.HLWMTags(hc, monitor),
        W.RawLabel('%{r}'),
        grey_frame(CW.Audio()),
        W.RawLabel('\ue1b1'),
        grey_frame(CW.Wifi()),
        W.RawLabel('\ue1b1'),
        grey_frame(CW.DateTime()),
    ])
else:
    bar.widget = W.ListLayout([
        W.RawLabel('%{l}'),
        grey_frame(hlwm.HLWMWindowTitle(hc, maxlen=20)),
        W.RawLabel('%{c}'),
        hlwm.HLWMTags(hc, monitor),
        W.RawLabel('%{r}'),
        W.RawLabel('\ue1b1'),
        grey_frame(CW.DateTime()),
    ])
