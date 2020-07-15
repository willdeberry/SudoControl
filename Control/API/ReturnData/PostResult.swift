//
//  PostResult.swift
//  Control
//
//  Created by Will DeBerry on 7/12/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postResult = try? newJSONDecoder().decode(PostResult.self, from: jsonData)

import Foundation

// MARK: - PostResult
struct PostResult: Codable {
    let response: PostResultResponse
}

// MARK: - Response
struct PostResultResponse: Codable {
    let reason: String
    let result: Bool
}
