//
//  DialView.swift
//
//  Created by Jaesung Lee on 2020/04/25.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import SwiftUI

struct DialView: View {
    // Access `CallManager.shared` singleton
    @EnvironmentObject var callManager: CallManager
    
    @State var hasActivateCall: Bool = false
    @State var callID: UUID? = nil
    @State var receiverID: String = ""
    
    var body: some View {
        VStack {
            Text("CallKit + SwiftUI")
                .font(.title)
                .bold()
                .padding(.vertical, 112)
            
            HStack {
                Image(systemName: "person").foregroundColor(.gray)
                TextField("Receiver ID", text: self.$receiverID)
                    .font(.body)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
            
            
            if self.hasActivateCall {
                
                // MARK: Handle a call
                
                Color(.black)
                    .frame(width: 176, height: 64)
                    .cornerRadius(32)
                    .overlay(
                        CallInterfaceView(hasActivateCall: self.$hasActivateCall, callID: self.$callID)
                )
                
            }
            else {
                // MARK: Make a call
                
                HStack {
                    Color(.black)
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                        .overlay(
                            OutgoingInterfaceView(receiverID: self.$receiverID,
                                                  hasActivateCall: self.$hasActivateCall,
                                                  callID: self.$callID)
                                .foregroundColor(.green)
                    )
                        .padding(.horizontal, 24)
                    
                    Color(.black)
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                        .overlay(
                            IncomingInterfaceView(hasActivateCall: self.$hasActivateCall,
                                                  callID: self.$callID)
                                .foregroundColor(.green)
                    )
                        .padding(.horizontal, 24)
                }
            }
            
            Spacer()
        }
    }
}

struct DialView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}
