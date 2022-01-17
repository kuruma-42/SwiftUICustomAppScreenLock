//
//  UserDefaultUtil.swift
//  AppCustomScreenLockSwiftUI
//
//  Created by Yong Jun Cha on 2022/01/14.
//
import Foundation


func setUD(key: String, value: [Int]) {
    print("UserDefaults set key[\(key)] value[\(value)]")
    UserDefaults.standard.set(value, forKey: key)
}

func getUD(key: String) -> [Any] {
    let value = UserDefaults.standard.array(forKey: key) ?? []
    print("UserDefaults get key[\(key)] value[\(value)]")
    return value
}

func removeUD(key: String) {
    let value = UserDefaults.standard.string(forKey: key) ?? ""
    print("UserDefaults remove key[\(key)] value[\(value)]")
    UserDefaults.standard.removeObject(forKey: key)
}

//Append Issue Key
private func appendIssueKeyToUserDefault(issueKey: String){
    // IssueKey 저장
    let userDefaults = UserDefaults.standard
    // 이미 문의를 했던 경우
    if userDefaults.stringArray(forKey: "issueKeys") != nil{
        var issuekeyArray = userDefaults.stringArray(forKey: "issueKeys") ?? []
        issuekeyArray.append(issueKey)
        userDefaults.set(issuekeyArray, forKey: "issueKeys")
        print("append issueKey to UserDefault : \(issueKey)")
    } else {
        // 문의를 처음 하는 경우
        let array = [issueKey]
        userDefaults.set(array, forKey: "issueKeys")
        print("create issueKey to UserDefault : \(issueKey)")
    }
}

func setAppScreenPassword() {
    
}
