//
//  UserDefaultUtil.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//
import Foundation


func setUD(key: String, value: String) {
    print("UserDefaults set key[\(key)] value[\(value)]")
    UserDefaults.standard.set(value, forKey: key)
}

func getUD(key: String) -> String {
    let value = UserDefaults.standard.string(forKey: key) ?? ""
    print("UserDefaults get key[\(key)] value[\(value)]")
    return value
}

func removeUD(key: String) {
    let value = UserDefaults.standard.string(forKey: key) ?? ""
    print("UserDefaults remove key[\(key)] value[\(value)]")
    UserDefaults.standard.removeObject(forKey: key)
}
