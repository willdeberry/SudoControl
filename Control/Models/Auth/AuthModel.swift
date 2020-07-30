//
//  AuthData.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import Foundation
import KeychainSwift

class AuthModel {
    let keychain = KeychainSwift()

    var token: AuthData? {
        get {
            guard let token = keychain.getData("token"),
                  let authData = try? newJSONDecoder().decode(AuthData.self, from: token) else {
                return nil
            }
            return authData
        }

        set(newValue) {
            if newValue == nil {
                NSLog("Deleting token")
                keychain.delete("token")
            } else {
                NSLog("Setting token")
                guard let encoded = try? JSONEncoder().encode(newValue) else {
                    print("Failed to encode auth params")
                    return
                }
                keychain.set(encoded, forKey: "token")
            }
        }
    }

    var email: String {
        get {
            guard let email = UserDefaults.standard.string(forKey: "email") else { return "" }
            return email
        }

        set(newEmail) {
            if newEmail.isEmpty {
                NSLog("Deleting email")
                UserDefaults.standard.removeObject(forKey: "email")
            } else {
                NSLog("Setting email")
                UserDefaults.standard.setValue(newEmail, forKey: "email")
            }
        }
    }

    var password: String {
        get {
            guard let password = keychain.get("password") else { return "" }
            return password
        }

        set(newPassword) {
            if newPassword.isEmpty {
                NSLog("Deleting password")
                keychain.delete("password")
            } else {
                NSLog("Setting password")
                keychain.set(newPassword, forKey: "password")
            }
        }
    }
}
