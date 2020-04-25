//
//  CallInterfaceView.swift
//
//  Created by Jaesung Lee on 2020/04/25.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import SwiftUI

struct CallInterfaceView: View {
    @EnvironmentObject var callManager: CallManager
    
    @Binding var hasActivateCall: Bool
    @Binding var callID: UUID?
    @State var isMuted: Bool = false
    
    var body: some View {
        HStack {
            Button(action: self.muteAudio) {
                Image(systemName: self.isMuted ? "mic.fill" : "mic.slash.fill")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 24)
            
            Button(action: self.endCall) {
                Image(systemName: "phone.down.fill")
                    .foregroundColor(.red)
            }
            .padding(.horizontal, 24)
        }
    }
    
    func muteAudio() {
        self.isMuted.toggle()
        guard let callID = self.callID else { return }
        self.callManager.muteCall(with: callID, muted: self.isMuted) { error in
            if let error = error { print(error.localizedDescription) }
            else { print("Audio On/Off state has been cahnged successfully") }
        }
    }
    
    func endCall() {
        guard let callID = self.callID else { return }
        self.callManager.endCall(with: callID) { error in
            if let error = error { print(error.localizedDescription) }
            else { self.hasActivateCall = false }
        }
    }
}
