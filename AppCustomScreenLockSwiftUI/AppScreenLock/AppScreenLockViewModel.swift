//
//  AppScreenLockViewModel.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//

import Foundation
import Combine

class AppScreenLockViewModel : ObservableObject {
    
    @Published var appScreenLockMode : AppScreenLockMode?
    @Published var passwordFieldArray : [String] = []
    fileprivate var APP_SCREEN_LOCK_PASSWORD = "AppScreenLockPassWord"
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        setObserver()
    }
    
    func checkIsUserSetScreenLockPassword() {
        let AppScreenLockPassword = getUD(key: APP_SCREEN_LOCK_PASSWORD)
        if AppScreenLockPassword == "" {
            // User Doesn't Set Password
            appScreenLockMode = .NoScreenLock
            appScreenLockMode?.getMessageAppScreenLockMode()
        } else {
            // User Set Password
            appScreenLockMode = .OnScreenLock
            appScreenLockMode?.getMessageAppScreenLockMode()
        }
    }
    
    func setUserScreenLockPassword(passWord: String) {
        setUD(key: APP_SCREEN_LOCK_PASSWORD, value: passWord)
    }
    
    func checkUserEnterPasswordWithUserDefaultPassword(password: String) {
    }
    
    func resetPasswordArray() {
        passwordFieldArray = []
    }
    
    func deleteLastIndexPasswordArray(){
        passwordFieldArray = passwordFieldArray.dropLast()
        print("\(passwordFieldArray)")
    }
    
    func setObserver() {
        let subscriber = $passwordFieldArray
            .subscribe(on: DispatchQueue.main)
            .sink { value in
                if value.count == 4 {
                    print("Password Check")
                }
                else if value.count > 4 {
                    print("DELETE")
                }
            }
            .store(in: &subscription)
    }
    
}
