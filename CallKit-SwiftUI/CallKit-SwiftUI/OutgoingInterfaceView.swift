//
//  OutgoingInterfaceView.swift
//
//  Created by Jaesung Lee on 2020/04/25.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import SwiftUI

struct OutgoingInterfaceView: View {
    @EnvironmentObject var callManager: CallManager
    
    @Binding var receiverID: String
    @Binding var hasActivateCall: Bool
    @Binding var callID: UUID?
    
    var body: some View {
        HStack {
            // MARK: Voice Call
            Button(action: {
                self.startCall(to: self.$receiverID.wrappedValue, hasVideo: false)
            }) {
                Image(systemName: "phone.fill.arrow.up.right")
            }
        }
    }
    
    func startCall(to receiverID: String, hasVideo: Bool) {
        let uuid = UUID()
        self.callID = uuid
        
        self.callManager.startCall(with: uuid, receiverID: receiverID, hasVideo: hasVideo) { error in
            if let error = error { print(error.localizedDescription) }
            else { self.hasActivateCall = true }
        }
    }
}
