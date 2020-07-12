//
//  VehicleState.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vehicleState = try? newJSONDecoder().decode(VehicleState.self, from: jsonData)

import Foundation

// MARK: - VehicleState
struct VehicleState: Codable {
    let response: VehicleStateResponse
}

// MARK: - Response
struct VehicleStateResponse: Codable {
    let apiVersion: Int
    let autoparkStateV3, autoparkStyle: String
    let calendarSupported: Bool
    let carVersion: String
    let centerDisplayState, df, dr, fdWindow: Int
    let fpWindow, ft: Int
    let isUserPresent: Bool
    let lastAutoparkError: String
    let locked: Bool
    let mediaState: MediaState
    let notificationsSupported: Bool
    let odometer: Double
    let parsedCalendarSupported: Bool
    let pf, pr, rdWindow: Int
    let remoteStart, remoteStartEnabled, remoteStartSupported: Bool
    let rpWindow, rt: Int
    let sentryMode, sentryModeAvailable, smartSummonAvailable: Bool
    let softwareUpdate: SoftwareUpdate
    let speedLimitMode: SpeedLimitMode
    let summonStandbyModeEnabled: Bool
    let timestamp: Int
    let valetMode, valetPinNeeded: Bool
    let vehicleName: String

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case autoparkStateV3 = "autopark_state_v3"
        case autoparkStyle = "autopark_style"
        case calendarSupported = "calendar_supported"
        case carVersion = "car_version"
        case centerDisplayState = "center_display_state"
        case df, dr
        case fdWindow = "fd_window"
        case fpWindow = "fp_window"
        case ft
        case isUserPresent = "is_user_present"
        case lastAutoparkError = "last_autopark_error"
        case locked
        case mediaState = "media_state"
        case notificationsSupported = "notifications_supported"
        case odometer
        case parsedCalendarSupported = "parsed_calendar_supported"
        case pf, pr
        case rdWindow = "rd_window"
        case remoteStart = "remote_start"
        case remoteStartEnabled = "remote_start_enabled"
        case remoteStartSupported = "remote_start_supported"
        case rpWindow = "rp_window"
        case rt
        case sentryMode = "sentry_mode"
        case sentryModeAvailable = "sentry_mode_available"
        case smartSummonAvailable = "smart_summon_available"
        case softwareUpdate = "software_update"
        case speedLimitMode = "speed_limit_mode"
        case summonStandbyModeEnabled = "summon_standby_mode_enabled"
        case timestamp
        case valetMode = "valet_mode"
        case valetPinNeeded = "valet_pin_needed"
        case vehicleName = "vehicle_name"
    }
}

// MARK: - MediaState
struct MediaState: Codable {
    let remoteControlEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case remoteControlEnabled = "remote_control_enabled"
    }
}

// MARK: - SoftwareUpdate
struct SoftwareUpdate: Codable {
    let downloadPerc, expectedDurationSEC, installPerc: Int
    let status, version: String

    enum CodingKeys: String, CodingKey {
        case downloadPerc = "download_perc"
        case expectedDurationSEC = "expected_duration_sec"
        case installPerc = "install_perc"
        case status, version
    }
}

// MARK: - SpeedLimitMode
struct SpeedLimitMode: Codable {
    let active: Bool
    let currentLimitMph, maxLimitMph, minLimitMph: Int
    let pinCodeSet: Bool

    enum CodingKeys: String, CodingKey {
        case active
        case currentLimitMph = "current_limit_mph"
        case maxLimitMph = "max_limit_mph"
        case minLimitMph = "min_limit_mph"
        case pinCodeSet = "pin_code_set"
    }
}
