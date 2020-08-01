//
//  SampleChargeState.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

let sampleChargeState = ChargeStateResponse(
    batteryHeaterOn: false,
    batteryLevel: 43,
    batteryRange: 127.81,
    chargeCurrentRequest: 32,
    chargeCurrentRequestMax: 32,
    chargeEnableRequest: true,
    chargeEnergyAdded: 14.35,
    chargeLimitSoc: 81,
    chargeLimitSocMax: 100,
    chargeLimitSocMin: 50,
    chargeLimitSocStd: 90,
    chargeMilesAddedIdeal: 58.5,
    chargeMilesAddedRated: 58.5,
    chargePortColdWeatherMode: false,
    chargePortDoorOpen: true,
    chargePortLatch: "Engaged",
    chargeRate: 29.7,
    chargeToMaxRange: false,
    chargerPhases: 1,
    chargerActualCurrent: 32,
    chargerPilotCurrent: 1,
    chargerPower: 8,
    chargerVoltage: 240,
    chargingState: "Charging",
    connChargeCable: "SAE",
    estBatteryRange: 139.21,
    fastChargerBrand: "<invalid>",
    fastChargerPresent: false,
    fastChargerType: "MCSingleWireCAN",
    idealBatteryRange: 127.81,
    managedChargingActive: false,
    managedChargingStartTime: nil,
    managedChargingUserCanceled: false,
    maxRangeChargeCounter: 1,
    minutesToFullCharge: 220,
    notEnoughPowerToHeat: nil,
    scheduledChargingPending: false,
    scheduledChargingStartTime: nil,
    timeToFullCharge: 3.67,
    timestamp: 1594835962433,
    tripCharging: false,
    usableBatteryLevel: 43,
    userChargeEnableRequest: nil
)
