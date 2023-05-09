#!/usr/bin/env python3
from openrazer.client import DeviceManager

device_manager = DeviceManager()

if (device_manager.devices[0]):
    print("%3d%%" % (device_manager.devices[0].battery_level))
else:
    print(" NA")
