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
    @Published var passwordFieldArray : [Int] = []
    @Published var password : String = ""
    @Published var isWrongPassword : Bool = false
    fileprivate var APP_SCREEN_LOCK_PASSWORD = "AppScreenLockPassWord"
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        setObserver()
    }
    
    func checkIsUserSetScreenLockPassword() {
        let AppScreenLockPassword = getUD(key: APP_SCREEN_LOCK_PASSWORD)
        if AppScreenLockPassword as! [Int] == [] {
            // User Doesn't Set Password
            appScreenLockMode = .NoScreenLock
            appScreenLockMode?.getMessageAppScreenLockMode()
        } else {
            // User Set Password
            appScreenLockMode = .OnScreenLock
            appScreenLockMode?.getMessageAppScreenLockMode()
        }
    }
    
//    func setUserScreenLockPassword(passWord: String) {
//        setUD(key: APP_SCREEN_LOCK_PASSWORD, value: passWord)
//    }
    
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
            .removeDuplicates()
            .subscribe(on: DispatchQueue.main)
            .sink { value in
                if value.count == 4 {
                    print("PASSWORD CHECK")
                    let UserSatScreenLockPassword = getUD(key: self.APP_SCREEN_LOCK_PASSWORD)
                    
                    if value == getUD(key: self.APP_SCREEN_LOCK_PASSWORD) as! [Int] {
                        DispatchQueue.main.async { [self] in
                            self.resetPasswordArray()
                            appScreenLockMode = .OffScreenLock
                        }
                    } else {
                        DispatchQueue.main.async { [self] in
                            self.resetPasswordArray()
                            isWrongPassword = true
                            print("RESET")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                
                                isWrongPassword = false
                            }
                        }
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
