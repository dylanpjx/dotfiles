#!/usr/bin/env python3
from openrazer.client import DeviceManager

device_manager = DeviceManager()

try:
    print("%3d%%" % (device_manager.devices[0].battery_level))
except:
    print("  0%")
