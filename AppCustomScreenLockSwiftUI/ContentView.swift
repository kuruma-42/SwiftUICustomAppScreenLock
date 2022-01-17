//
//  ContentView.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var stateManager : StateManager
    @StateObject var appScreenLockModel : AppScreenLockViewModel = AppScreenLockViewModel()
    var body: some View {
        
        ZStack{
            // ScreenLock이 설정되어있는 경우
            if appScreenLockModel.appScreenLockMode == .OnScreenLock {
                // ScreenLock View
                AppScreenLockView().environmentObject(appScreenLockModel)
            } else {
                VStack{
                    // 비밀번호 세팅 화면 뷰
                    Button {
                        stateManager.isPasswordSettingView.toggle()
                    } label: {
                        Text("비밀번호 설정")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .sheet(isPresented: $stateManager.isPasswordSettingView, onDismiss: {
                                appScreenLockModel.checkIsUserSetScreenLockPassword()
                            }) {
                                PasswordSettingView()
                            }
                    }
                    
                }
                .ignoresSafeArea()
            }
        }
        .onAppear{
            appScreenLockModel.checkIsUserSetScreenLockPassword()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
