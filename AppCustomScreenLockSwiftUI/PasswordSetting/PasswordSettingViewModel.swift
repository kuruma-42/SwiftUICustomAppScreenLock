//
//  PasswordSettingViewModel.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/17.
//

import Foundation
import Combine
import SwiftUI
class PasswordSettingViewModel : ObservableObject {
    @Published var passwordFieldArray : [Int] = []
    @Published var isPasswordRegisterFinish : Bool = false
    fileprivate var APP_SCREEN_LOCK_PASSWORD = "AppScreenLockPassWord"
    var subscription = Set<AnyCancellable>()
    
    
    
    func resetPasswordArray() {
        passwordFieldArray = []
    }
    
    func deleteLastIndexPasswordArray(){
        passwordFieldArray = passwordFieldArray.dropLast()
        print("\(passwordFieldArray)")
    }
    
    func setObserver() {
        let subscriber = $passwordFieldArray
            .removeDuplicates()
            .subscribe(on: DispatchQueue.main)
            .sink { value in
                if value.count == 4 {
                    print("PASSWORD REGISTER")
                    setUD(key: self.APP_SCREEN_LOCK_PASSWORD, value: value)
                    
                    DispatchQueue.main.async { [self] in
                        self.resetPasswordArray()
                        isPasswordRegisterFinish = true
                        print("PASSWORD FINISH")
                    }
                }
                else if value.count > 4 {
                    print("OVER PASSWORD DELETE")
                    DispatchQueue.main.async {
                        let prefixedPassword = value.prefix(4)
                        self.passwordFieldArray = Array(prefixedPassword)
                    }
                    print("\(self.passwordFieldArray)")
                }
            }
            .store(in: &subscription)
    }
}
