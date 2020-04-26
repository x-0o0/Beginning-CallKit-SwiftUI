# Beginning-CallKit-SwiftUI
This public repository provides basic CallKit project in SwiftUI

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/blob/master/LICENSE)

## Introduction

![Image - App Icon](https://github.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/blob/master/CallKit-SwiftUI/CallKit-SwiftUI/callkit-swiftui-icon.png)

CallKit-SwiftUI project is a SwiftUI project provding examples of CallKit based on [Apple WWDC16 CallKit](https://github.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/blob/master/CallKit-SwiftUI/CallKit-SwiftUI/callkit-swiftui-icon.png).  

## What's CallKit?

  CallKit is an Apple framework that lets your VoIP app integrate tightly with the native Phone UI. Because CallKit provides only system UI, it doesn't connect caller to receiver.

## How to connect caller to receiver?

  To connect both users, you need to figure out their IP addresses. However, because of firewall, you can't figure out the addresses directly, but you can via WebRTC framework which is developed by Google. To download and implement your VoIP service, please refer to my pages: [WebRTC](https://chic0815.gitbook.io/jaesung/webrtc)

## Is there better way to implement VoIP service instead using WebRTC directly?

  Using WebRTC may take a long time to implement your VoIP service. You also need its server. To save your time, use VoIP framework that you don't need to implement WebRTC actons and server. There are a lot of VoIP frameworks such as [SendBirdCalls](https://sendbird.com/features/voice-and-video), [Twilio](https://www.twilio.com/voice), [TokBox](https://www.vonage.com/communications-apis/?icmp=mainnav_products_communicationsapis) and [Voxeet](https://www.voxeet.com).
  
## Is there any sample using VoIP framework with CallKit?

  There are some samples using [SendBirdCalls](https://sendbird.com/features/voice-and-video) with CallKit.
  
  - [SendBird Official Sample](https://github.com/sendbird/quickstart-calls-ios) - © SendBird, Inc.
  
  - [SendBirdCalls + SwiftUI (WIP)](https://github.com/jaesung-wwdc/Calls-SwiftUI) - © Jaesung Lee
  
  

![Image - Make Call](https://raw.githubusercontent.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/master/screenshots/makeCall.PNG)

![Image - Handle Call](https://raw.githubusercontent.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/master/screenshots/handleCall.PNG)

![Image - CallKit UI](https://raw.githubusercontent.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/master/screenshots/callkitUI.PNG)

![Image - Incoming Call](https://raw.githubusercontent.com/jaesung-wwdc/Beginning-CallKit-SwiftUI/master/screenshots/incomingCall.PNG)
