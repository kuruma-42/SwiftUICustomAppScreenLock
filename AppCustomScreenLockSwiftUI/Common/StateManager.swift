//
//  StateManager.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/17.
//

import Foundation

/// Mark: - StateManager
/// 앱의 네비게이션 태그나, isPresented와 같이 @State등에 쓰이는 변수들을 모아놓은 곳
/// window 쪽에 @StateObject로 선언되어 앱의 init이나 LifeCycle에 영향받지 않는다.
class StateManager: ObservableObject {

    // AppScreenLockView
    @Published var isForgetPasswordState : Bool = false
    
    // PasswordSettingView
    @Published var isPasswordSettingView : Bool = false
}
