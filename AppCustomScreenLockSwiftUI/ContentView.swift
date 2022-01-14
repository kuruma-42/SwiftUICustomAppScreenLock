//
//  ContentView.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appScreenLockModel : AppScreenLockViewModel = AppScreenLockViewModel()
    var body: some View {

        ZStack{
            
            if appScreenLockModel.appScreenLockMode == .NoScreenLock {
                AppScreenLockView().environmentObject(appScreenLockModel)
            } else {
                VStack{
                    Text("화면잠금 테스트 ")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
