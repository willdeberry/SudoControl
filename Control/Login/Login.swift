//
//  Token.swift
//  Control
//
//  Created by Will DeBerry on 7/6/20.
//

import Foundation

class Login {
    let authModel: AuthModel = AuthModel()

    func generate(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(Tesla.baseUrl)/oauth/token") else {
            completion(false)
            return
        }

        let params = [
            "client_id": "81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384",
            "client_secret": "c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3",
            "email": authModel.email,
            "password": authModel.password,
            "grant_type": "password"
        ]

        guard let encoded = try? JSONEncoder().encode(params) else {
            NSLog("Failed to encode login params")
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                NSLog("No data in login response: \(error?.localizedDescription ?? "Unknown error").")
                completion(false)
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode > 399 {
                    NSLog("Failed to generate token")
                    completion(false)
                    return
                }
            }

            guard let authData = try? newJSONDecoder().decode(AuthData.self, from: data) else {
                NSLog("Failed to decode authData")
                completion(false)
                return
            }

            self.authModel.token = authData
            completion(true)
        }.resume()
    }

    func refresh(completion: @escaping (Bool) -> Void) {
        let now = Date().timeIntervalSince1970
        print(now)
        completion(true)
    }

    func logout() {
        authModel.email = ""
        authModel.password = ""
        authModel.token = nil
    }
}
