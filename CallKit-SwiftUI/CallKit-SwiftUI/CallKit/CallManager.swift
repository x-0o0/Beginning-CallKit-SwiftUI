//
//  CallManager.swift
//
//  Created by Jaesung Lee on 2020/04/10.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import CallKit
import Combine

class CallManager: NSObject, ObservableObject {
    static let shared = CallManager()
    
    let callController = CXCallController()
    private(set) var callIDs: [UUID] = []
    
    // MARK: Actions
    // 1. Make action
    // 2. Make CXTransaction object
    // 3. request the transaction
    
    func startCall(with uuid: UUID, receiverID: String, hasVideo: Bool, completionHandler: ErrorHandler? = nil) {
        let handle = CXHandle(type: .generic, value: receiverID)
        
        let startCallAction = CXStartCallAction(call: uuid, handle: handle)
        startCallAction.isVideo = hasVideo
        
        let transaction = CXTransaction(action: startCallAction)
        self.requestTransaction(transaction, completionHandler: completionHandler)
    }
    
    func endCall(with uuid: UUID, completionHandler: ErrorHandler? = nil) {
        let endCallAction = CXEndCallAction(call: uuid)
        
        let transaction = CXTransaction(action: endCallAction)
        self.requestTransaction(transaction, completionHandler: completionHandler)
    }
    
    func setHeldCall(with uuid: UUID, onHold: Bool, completionHandler: ErrorHandler?) {
        let setHeldCallAction = CXSetHeldCallAction(call: uuid, onHold: onHold)
        
        let transaction = CXTransaction(action: setHeldCallAction)
        self.requestTransaction(transaction, completionHandler: completionHandler)
    }
    
    func muteCall(with uuid: UUID, muted: Bool, completionHandler: ErrorHandler?) {
        let muteCallAction = CXSetMutedCallAction(call: uuid, muted: muted)
        
        let transaction = CXTransaction(action: muteCallAction)
        self.requestTransaction(transaction, completionHandler: completionHandler)
    }
    
    private func requestTransaction(_ transaction: CXTransaction, completionHandler: ErrorHandler?) {
        callController.request(transaction) { error in
            guard error == nil else {
                print("Error requesting transaction: \(error?.localizedDescription ?? "")")
                completionHandler?(error as NSError?)
                return
            }
            print("Requested transaction successfully")
            completionHandler?(nil)
        }
    }
    
    
    // MARK: Call Management
    func addCall(uuid: UUID) {
        self.callIDs.append(uuid)
    }
    
    func removeCall(uuid: UUID) {
        self.callIDs.removeAll { $0 == uuid }
    }
    
    func removeAllCalls() {
        self.callIDs.removeAll()
    }
}
