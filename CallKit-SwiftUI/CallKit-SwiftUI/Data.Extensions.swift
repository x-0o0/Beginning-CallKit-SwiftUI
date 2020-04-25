//
//  Data.Extensions.swift
//
//  Created by Jaesung Lee on 2020/04/24.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import Foundation

extension Data {
    func toHexString() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
}
