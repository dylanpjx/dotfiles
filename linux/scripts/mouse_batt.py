from openrazer.client import DeviceManager

device_manager = DeviceManager()

print(str(device_manager.devices[0].battery_level) + "%")
