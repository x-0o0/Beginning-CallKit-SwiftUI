//
//  CXProvider+Sample.swift
//
//  Created by Jaesung Lee on 2020/04/10.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import CallKit

extension CXProvider {
    // To ensure initializing only at once. Lazy stored property doesn't ensure it.
    static var custom: CXProvider {
        
        // Configure provider with sendbird's customzied configuration.
        let configuration = CXProviderConfiguration.custom
        let provider = CXProvider(configuration: configuration)
        
        return provider
    }
}
