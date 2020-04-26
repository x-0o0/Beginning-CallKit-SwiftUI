//
//  AppDelegate.swift
//
//  Created by Jaesung Lee on 2020/04/24.
//  Copyright © 2020 SweetLab. All rights reserved.
//

import UIKit
import CallKit
import PushKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let pushRegistry = PKPushRegistry(queue: DispatchQueue.main)
    let callManager = CallManager()
    var providerDelegate: ProviderDelegate?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]
        
        providerDelegate = ProviderDelegate(callManager: callManager)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: PKPushRegistryDelegate {
    // MARK: PKPushRegistryDelegate
    func pushRegistry(_ registry: PKPushRegistry, didUpdate credentials: PKPushCredentials, for type: PKPushType) {
        // Store push credentials on server for the active user. If you want `String` value of the token, use `Data().toHexString()`
        // Register device token to your server.
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType) {
        // Handle incoming push with payload
    }
    
    //
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        
        // handle incoming push with payload
        // If Call UUID is invalid, call `reportInvalidIncomingCall(completion:)` method
        completion()
    }
    
    func reportInvalidIncomingCall(completion: () -> Void) {
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "invalid")
        let randomUUID = UUID()
        
        self.providerDelegate?.reportIncomingCall(with: randomUUID)
        completion()
    }
}
