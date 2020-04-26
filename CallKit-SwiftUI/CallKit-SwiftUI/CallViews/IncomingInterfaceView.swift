//
//  IncomingInterfaceView.swift
//
//  Created by Jaesung Lee on 2020/04/25.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import SwiftUI
import CallKit

struct IncomingInterfaceView: View {
    @EnvironmentObject var callManager: CallManager
    
    @Binding var hasActivateCall: Bool
    @Binding var callID: UUID?
    @State var providerDelegate: ProviderDelegate?
    
    let acceptPublishser = NotificationCenter.default
        .publisher(for: Notification.Name.DidCallAccepted)
    
    var body: some View {
        HStack {
            // MARK: Voice Call
            Button(action: {
                self.receiveCall(from: "Jaesung Lee", hasVideo: false)
            }) {
                Image(systemName: "phone.arrow.down.left")
            }
        }
        .onReceive(self.acceptPublishser) { _ in
            self.hasActivateCall = true
            self.providerDelegate?.connectedCall(with: self.callID!)
        }
    }
    
    func receiveCall(from callerID: String, hasVideo: Bool) {
        providerDelegate = ProviderDelegate(callManager: callManager)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: callerID)
        let uuid = UUID()
        self.callID = uuid
        
        self.providerDelegate?.reportIncomingCall(with: uuid, remoteUserID: callerID, hasVideo: hasVideo) { error in
            if let error = error { print(error.localizedDescription) }
            else { print("Ring Ring...") }
        }
    }
}
