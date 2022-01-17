//
//  SwiftUIView.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/17.
//

import SwiftUI

struct PasswordFindByEmailView: View {
    @EnvironmentObject var stateManager : StateManager
    var body: some View {
        VStack {
            Button {
                print("CALL E-MAIL SEND API HERE")
                stateManager.isForgetPasswordState.toggle()
            } label: {
                Text("E-MAIL로 비밀번호 찾기 코드 전송")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFindByEmailView()
    }
}
