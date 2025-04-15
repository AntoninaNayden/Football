//
//  FootballApp.swift
//  Football
//
//  Created by Antonina on 12.12.24.
//

import SwiftUI
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var orientationLock: UIInterfaceOrientationMask = .portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
}


@main
struct FootballApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }
        }
    }
}
