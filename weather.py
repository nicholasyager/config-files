#!/usr/bin/python2

import forecastio

api_key = "04cbdd6759489babcd9ea3b98a672742"
latitude = 42.8307
longitude = -78.8269

forecast = forecastio.load_forecast(api_key, latitude, longitude)

currently = forecast.currently()
temp = currently.temperature

byMinute = forecast.minutely()
print str(byMinute.summary).split('.')[0] + " " + str(temp) + "F"

