#!/usr/bin/env python
import bme680

sensor = bme680.BME680()

sensor.set_humidity_oversample(bme680.OS_2X)
sensor.set_pressure_oversample(bme680.OS_4X)
sensor.set_temperature_oversample(bme680.OS_8X)
sensor.set_filter(bme680.FILTER_SIZE_3)

if sensor.get_sensor_data():
	print("{{\"temperature\": {0:.2f}, \"pressure\": {1:.2f}, \"humidity\": {2:.3f} }}".format(sensor.data.temperature, sensor.data.pressure, sensor.data.humidity))

