# vbox_xti_records2m3u for VBox XTi

   Script for generating m3u playlist witl url to records.
   
   Today we have lots of cheap dvb-t2/c receivers on the market, it supports IPTV via lan or wifi. (selenga hd980d, world vision t625a lan, etc)
   
   VBox XTi automatically generate m3u list directly available for such tuners, but manufacturer doesn't do this for recordings.
   
   This script allow you to fix this issue until VBoxComm will add this feature info firmware.
   

## Features

  - Fetch information about recordings from vbox
  - Save m3u with direct links
  - Save m3u file directly to vbox pub folder
  
### Tech

  Required minimal: 
   - Entware (tested) or linux/openwrt
   - curl
   - xmlstarlet
   - bash 
   - VBox TV Gateway device

Configuration should be done with setting placed at the top of the script.

Check all paths for your system.

By default script works with xupnpd as pair, basically using it only for m3u distributing.
  
### Feedback

  - [Issues](https://github.com/mesb1/vbox_xti_records2m3u/issues)
  - [Telegram group](http://t.me/vboxcomm_chat)
  - [Telegram channel](http://t.me/vboxcomm)
  
### Links

  Checkout this cool things for vbox:
  - [VBRec](https://github.com/mejgun/vbr)
  - [Google Play](https://play.google.com/store/apps/details?id=com.mejsoftware.vbox_recorder)
  - [App Store](https://apps.apple.com/us/app/vbrec-for-vbox-xti/id1477864986)
  - [Web Interface](https://github.com/MymsMan/vbox_webif)




