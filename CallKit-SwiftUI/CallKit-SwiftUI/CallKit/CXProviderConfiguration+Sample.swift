//
//  CXProviderConfiguration+Sample.swift
//
//  Created by Jaesung Lee on 2020/04/10.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import UIKit
import CallKit

extension CXProviderConfiguration {
    
    static var custom: CXProviderConfiguration {
        let configuration = CXProviderConfiguration(localizedName: "App Name Here")
        
        // Native call log shows video icon if it was video call.
        configuration.supportsVideo = true
        configuration.maximumCallsPerCallGroup = 1
        
        // Support generic type to handle *User ID*
        configuration.supportedHandleTypes = [.generic]
        
        // Icon image forwarding to app in CallKit View
        if let iconImage = UIImage(named: "App Icon") {
            configuration.iconTemplateImageData = iconImage.pngData()
        }
        
        // Ringing sound
        configuration.ringtoneSound = "Rington.caf"
        
        return configuration
    }
}
