# NoViz-Vibrate

This repository hosts all the code for the NoViz-Vibrate prototype. This prototype explored using the haptics of an Apple Watch to give users security notifications.  

**_NotificationServer_**: This is a Node.js server, it has a route "/notify", if you send a "GET" request to this route, it will emit an event over Socket.io that will cause the Apple Watch to vibrate.  

**_NotifyWatch_**: This is where the iOS/WatchOS code is that is responsible for listening for a Socket.io event and causing the Apple Watch to vibrate.  

**_SSLExtension_**: This is a Firefox browser extension that will check if the website you're on has a valid SSL certificate, if not it will notify the Node.js server.  

**_URLExtension_**: This is a Firefox browser extension that will check if the URL you're currently on is part of an allowlist if not, it will notify the Node.js server.  

=== Credits ===

Credits go to Daniela Napoli and Sebastian Navas for the layout of this README file and SSLExtension.

## Documentation

### For this project you will need:

Software:  
[Xcode](https://developer.apple.com/xcode/), [Firefox Browser](https://www.mozilla.org/en-CA/firefox/new/), [NodeJS](https://nodejs.org/en/) 

Hardware:
1 [Apple Watch](https://www.apple.com/ca/watch/), 1 [iPhone](https://www.apple.com/ca/iphone/), 1 [USB-C to Lightning Cable](https://www.apple.com/ca/shop/product/MX0K2AM/A/usb-c-to-lightning-cable-1-m)

### To set up the repository

1. `git clone https://github.com/choruslab/NoVizVibrate.git`
2. `cd NoVizVibrate/NotifyServer`
3. `npm install`
4. `npm start`

### To set up the extension

1. Open your Firefox Browser
1. In the search bar type: `about:debugging`
1. On the left of the screen, click on the **_This Firefox_** button
1. Click on the **_Load temporary Add-on..._** button
    - This will pop-up your file system
1. Use the pop-up to navigate to our repository
1. Inside the repository, you will find two folderd called **_URLExtension_** and **_SSLExtension_**
1. Pick the file called **_manifest.json_** in either of the two folders
1. Click on the **_open_** button

### To set up the Apple Watch

1. Connect your Apple Watch to an iPhone
2. Connect your iPhone to a MacOS device (iMac or MacBook) using a USB-C to Lightning cable
3. Make sure Xcode is installed and up-to-date
4. Open the **_NotifyWatch_** folder in Xcode
5. In Xcode you will need to setup a "Team"
6. In Xcode you will need to "Sign" the app to run it on the iPhone and Apple Watch
    - For steps 5 and 6, I used this here to get it to work: https://developer.apple.com/forums/thread/89783?answerId=275342022#275342022 
7. Under the Device dropdown select your iPhone
8. Build the App
9. Run the App on the iPhone as well as the Apple Watch
10. Now the Apple Watch will vibrate once an event is emited by the Node.js server
