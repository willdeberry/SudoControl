//
//  VehiclesData.swift
//  Control
//
//  Created by Will DeBerry on 7/7/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vehicles = try? newJSONDecoder().decode(Vehicles.self, from: jsonData)

import Foundation

// MARK: - Vehicles
struct VehiclesData: Codable {
    let vehicles: [Vehicle]
    let count: Int

    enum CodingKeys: String, CodingKey {
        case vehicles = "response"
        case count
    }
}

// MARK: - Vehicles
struct Vehicle: Codable {
    let id: Double
    let vehicleID: Int
    let vin, displayName, optionCodes: String
    let color: JSONNull?
    let tokens: [String]
    let state: String
    let inService: Bool
    let idS: String
    let calendarEnabled: Bool
    let apiVersion: Int
    let backseatToken, backseatTokenUpdatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case vehicleID = "vehicle_id"
        case vin
        case displayName = "display_name"
        case optionCodes = "option_codes"
        case color, tokens, state
        case inService = "in_service"
        case idS = "id_s"
        case calendarEnabled = "calendar_enabled"
        case apiVersion = "api_version"
        case backseatToken = "backseat_token"
        case backseatTokenUpdatedAt = "backseat_token_updated_at"
    }
}
