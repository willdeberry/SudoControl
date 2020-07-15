//
//  SampleVehicles.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

let vehicle1 = Vehicle(
    id: 123.0,
    vehicleID: 123,
    vin: "abc",
    displayName: "vehicle1",
    optionCodes: "MDLS",
    color: nil,
    tokens: ["token1", "token2"],
    state: "Maryland",
    inService: false,
    idS: "123",
    calendarEnabled: true,
    apiVersion: 123,
    backseatToken: nil,
    backseatTokenUpdatedAt: nil
)

let vehicle2 = Vehicle(
    id: 456.0,
    vehicleID: 456,
    vin: "def",
    displayName: "vehicle2",
    optionCodes: "MDL3",
    color: nil,
    tokens: ["token1", "token2"],
    state: "Florida",
    inService: false,
    idS: "456",
    calendarEnabled: true,
    apiVersion: 456,
    backseatToken: nil,
    backseatTokenUpdatedAt: nil
)
