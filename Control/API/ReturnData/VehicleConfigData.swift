//
//  VehicleConfig.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vehicleConfig = try? newJSONDecoder().decode(VehicleConfig.self, from: jsonData)

import Foundation

// MARK: - VehicleConfig
struct VehicleConfig: Codable {
    let response: VehicleConfigResponse
}

// MARK: - Response
struct VehicleConfigResponse: Codable {
    let canAcceptNavigationRequests, canActuateTrunks: Bool
    let carSpecialType, carType, chargePortType: String
    let eceRestrictions, euVehicle: Bool
    let exteriorColor: String
    let hasAirSuspension, hasLudicrousMode: Bool
    let keyVersion: Int
    let motorizedChargePort, plg: Bool
    let rearSeatHeaters: Int
    let rearSeatType: JSONNull?
    let rhd: Bool
    let roofColor: String
    let seatType: JSONNull?
    let spoilerType: String
    let sunRoofInstalled: JSONNull?
    let thirdRowSeats: String
    let timestamp: Int
    let useRangeBadging: Bool
    let wheelType: String

    enum CodingKeys: String, CodingKey {
        case canAcceptNavigationRequests = "can_accept_navigation_requests"
        case canActuateTrunks = "can_actuate_trunks"
        case carSpecialType = "car_special_type"
        case carType = "car_type"
        case chargePortType = "charge_port_type"
        case eceRestrictions = "ece_restrictions"
        case euVehicle = "eu_vehicle"
        case exteriorColor = "exterior_color"
        case hasAirSuspension = "has_air_suspension"
        case hasLudicrousMode = "has_ludicrous_mode"
        case keyVersion = "key_version"
        case motorizedChargePort = "motorized_charge_port"
        case plg
        case rearSeatHeaters = "rear_seat_heaters"
        case rearSeatType = "rear_seat_type"
        case rhd
        case roofColor = "roof_color"
        case seatType = "seat_type"
        case spoilerType = "spoiler_type"
        case sunRoofInstalled = "sun_roof_installed"
        case thirdRowSeats = "third_row_seats"
        case timestamp
        case useRangeBadging = "use_range_badging"
        case wheelType = "wheel_type"
    }
}
