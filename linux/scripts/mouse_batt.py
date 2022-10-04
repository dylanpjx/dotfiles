#!/usr/bin/env python
from openrazer.client import DeviceManager

device_manager = DeviceManager()

print("%3d%%" % (device_manager.devices[0].battery_level))
