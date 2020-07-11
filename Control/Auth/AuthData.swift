//
//  AuthData.swift
//  Control
//
//  Created by Will DeBerry on 7/6/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authData = try? newJSONDecoder().decode(AuthData.self, from: jsonData)

import Foundation

// MARK: - LoginData
struct AuthData: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case createdAt = "created_at"
    }
}
