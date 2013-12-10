#!/usr/bin/python2

import forecastio
import urllib2
import json



api_key = "04cbdd6759489babcd9ea3b98a672742"

try:
    req = urllib2.Request('http://freegeoip.net/json/')
    opener = urllib2.build_opener()
    f = opener.open(req)
    string =  f.read()
    location =  json.loads(string)
    latitude = float(location['latitude'])
    longitude = float(location['longitude'])

except:
    print "Unable to geolocate."
    latitude = 42.7959
    longitude = -77.8169


try:
    forecast = forecastio.load_forecast(api_key, latitude, longitude)

    currently = forecast.currently()
    temp = currently.temperature

    byMinute = forecast.minutely()
    print str(byMinute.summary).split('.')[0] + " " + str(temp) + "F"

except:
    print "Error collecting data."
