//
//  SampleVehicleState.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

let sampleVehicleState = VehicleStateResponse(
    apiVersion: 8,
    autoparkStateV3: "standby",
    autoparkStyle: "dead_man",
    calendarSupported: true,
    carVersion: "2020.24.6.4 b9a45d992a14",
    centerDisplayState: 0,
    df: 0,
    dr: 0,
    fdWindow: 0,
    fpWindow: 0,
    ft: 0,
    isUserPresent: false,
    lastAutoparkError: "no_error",
    locked: true,
    mediaState: sampleMediaState,
    notificationsSupported: true,
    odometer: 16205.267015,
    parsedCalendarSupported: true,
    pf: 0,
    pr: 0,
    rdWindow: 0,
    remoteStart: false,
    remoteStartEnabled: true,
    remoteStartSupported: true,
    rpWindow: 0,
    rt: 0,
    sentryMode: false,
    sentryModeAvailable: true,
    smartSummonAvailable: true,
    softwareUpdate: sampleSoftwareUpdate,
    speedLimitMode: sampleSpeedLimitMode,
    summonStandbyModeEnabled: true,
    timestamp: 1594840369756,
    valetMode: false,
    valetPinNeeded: true,
    vehicleName: ""
)

let sampleMediaState = MediaState(remoteControlEnabled: true)
let sampleSoftwareUpdate = SoftwareUpdate(downloadPerc: 0, expectedDurationSEC: 2700, installPerc: 1, status: "", version: "")
let sampleSpeedLimitMode = SpeedLimitMode(active: false, currentLimitMph: 85.0, maxLimitMph: 90, minLimitMph: 90, pinCodeSet: false)
