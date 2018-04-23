# Proximity-Detector
Proximity detector is a proof of concept I created that allows you to activate practically anything when entering an area using iBeacons.

It is similar to what Tesla is doing with the phone key with the Model 3. It appears to be using iBeacons and triggers when entering and exiting regions.

## Setup
So how do I make this work???

1. Go to Back4App.com and create an account if you don't already have one
2. Create a new app and name it whatever you want
3. In "My Apps", click the server settings button, then enter core settings
4. Here you can find the App and client key as well as the server address (it's under Parse API Address)
5. Put that information in the AppDelegate in the applicable variables in the didFinishLaunchingWithOptions function
6. Go to the dashboard and create a class called "RangedBeacons"
7. Add 2 columns, "UUID" which is a string, and "entering" which is a boolean
8. Run it with an iBeacon near you, then enter and exit the area. It should put the data in your dashboard


### Other notes
It takes some time when exiting for the information to appear on the dashboard, however, when entering, it's usually very quick
