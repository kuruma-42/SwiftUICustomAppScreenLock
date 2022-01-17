//
//  AppCustomScreenLockSwiftUIApp.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//

import SwiftUI

@main
struct AppCustomScreenLockSwiftUIApp: App {
    @StateObject var stateManager = StateManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(stateManager)
        }
    }
}
