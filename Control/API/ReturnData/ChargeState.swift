//
//  File.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chargeState = try? newJSONDecoder().decode(ChargeState.self, from: jsonData)

import Foundation

// MARK: - ChargeState
struct ChargeState: Codable {
    let response: ChargeStateResponse
}

// MARK: - Response
struct ChargeStateResponse: Codable {
    let batteryHeaterOn: Bool
    let batteryLevel: Int
    let batteryRange: Double
    let chargeCurrentRequest, chargeCurrentRequestMax: Int
    let chargeEnableRequest: Bool
    let chargeEnergyAdded: Double
    let chargeLimitSoc, chargeLimitSocMax, chargeLimitSocMin, chargeLimitSocStd: Int
    let chargeMilesAddedIdeal, chargeMilesAddedRated: Double
    let chargePortColdWeatherMode, chargePortDoorOpen: Bool
    let chargePortLatch: String
    let chargeRate: Double
    let chargeToMaxRange: Bool
    let chargerPhases: Int?
    let chargerActualCurrent, chargerPilotCurrent, chargerPower: Int
    let chargerVoltage: Int
    let chargingState, connChargeCable: String
    let estBatteryRange: Double
    let fastChargerBrand: String
    let fastChargerPresent: Bool
    let fastChargerType: String
    let idealBatteryRange: Double
    let managedChargingActive: Bool
    let managedChargingStartTime: JSONNull?
    let managedChargingUserCanceled: Bool
    let maxRangeChargeCounter, minutesToFullCharge: Int
    let notEnoughPowerToHeat: JSONNull?
    let scheduledChargingPending: Bool
    let scheduledChargingStartTime: JSONNull?
    let timeToFullCharge: Double
    let timestamp: Int
    let tripCharging: Bool
    let usableBatteryLevel: Int
    let userChargeEnableRequest: JSONNull?

    enum CodingKeys: String, CodingKey {
        case batteryHeaterOn = "battery_heater_on"
        case batteryLevel = "battery_level"
        case batteryRange = "battery_range"
        case chargeCurrentRequest = "charge_current_request"
        case chargeCurrentRequestMax = "charge_current_request_max"
        case chargeEnableRequest = "charge_enable_request"
        case chargeEnergyAdded = "charge_energy_added"
        case chargeLimitSoc = "charge_limit_soc"
        case chargeLimitSocMax = "charge_limit_soc_max"
        case chargeLimitSocMin = "charge_limit_soc_min"
        case chargeLimitSocStd = "charge_limit_soc_std"
        case chargeMilesAddedIdeal = "charge_miles_added_ideal"
        case chargeMilesAddedRated = "charge_miles_added_rated"
        case chargePortColdWeatherMode = "charge_port_cold_weather_mode"
        case chargePortDoorOpen = "charge_port_door_open"
        case chargePortLatch = "charge_port_latch"
        case chargeRate = "charge_rate"
        case chargeToMaxRange = "charge_to_max_range"
        case chargerActualCurrent = "charger_actual_current"
        case chargerPhases = "charger_phases"
        case chargerPilotCurrent = "charger_pilot_current"
        case chargerPower = "charger_power"
        case chargerVoltage = "charger_voltage"
        case chargingState = "charging_state"
        case connChargeCable = "conn_charge_cable"
        case estBatteryRange = "est_battery_range"
        case fastChargerBrand = "fast_charger_brand"
        case fastChargerPresent = "fast_charger_present"
        case fastChargerType = "fast_charger_type"
        case idealBatteryRange = "ideal_battery_range"
        case managedChargingActive = "managed_charging_active"
        case managedChargingStartTime = "managed_charging_start_time"
        case managedChargingUserCanceled = "managed_charging_user_canceled"
        case maxRangeChargeCounter = "max_range_charge_counter"
        case minutesToFullCharge = "minutes_to_full_charge"
        case notEnoughPowerToHeat = "not_enough_power_to_heat"
        case scheduledChargingPending = "scheduled_charging_pending"
        case scheduledChargingStartTime = "scheduled_charging_start_time"
        case timeToFullCharge = "time_to_full_charge"
        case timestamp
        case tripCharging = "trip_charging"
        case usableBatteryLevel = "usable_battery_level"
        case userChargeEnableRequest = "user_charge_enable_request"
    }
}
