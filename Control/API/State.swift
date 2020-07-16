//
//  State.swift
//  Control
//
//  Created by Will DeBerry on 7/8/20.
//

import Foundation

extension Api {
    func getChargeState(id: String, completion: @escaping (ChargeStateResponse?) -> Void) {
        sendCommand(method: "GET", api: "/vehicles/\(id)/data_request/charge_state", id: id, payload: nil) { result in
            switch result {
            case .success(let data):
                guard let chargeState = try? newJSONDecoder().decode(ChargeState.self, from: data) else {
                    NSLog("Failed to decode chargeState")
                    completion(nil)
                    return
                }
                completion(chargeState.response)
            case .failure(let error):
                NSLog("Failed to get vehicle config, Error \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

    func getVehicleConfig(id: String, completion: @escaping (VehicleConfigResponse?) -> Void) {
        sendCommand(method: "GET", api: "/vehicles/\(id)/data_request/vehicle_config", id: id, payload: nil) { result in
            switch result {
            case .success(let data):
                guard let vehicleConfig = try? newJSONDecoder().decode(VehicleConfig.self, from: data) else {
                    NSLog("Failed to decode vehicleConfig")
                    completion(nil)
                    return
                }
                completion(vehicleConfig.response)
            case .failure(let error):
                NSLog("Failed to get vehicle config, Error \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

    func getVehicleState(id: String, completion: @escaping (VehicleStateResponse?) -> Void) {
        sendCommand(method: "GET", api: "/vehicles/\(id)/data_request/vehicle_state", id: id, payload: nil) { result in
            switch result {
            case .success(let data):
                guard let vehicleState = try? newJSONDecoder().decode(VehicleState.self, from: data) else {
                    NSLog("Failed to decode vehicleState")
                    completion(nil)
                    return
                }
                completion(vehicleState.response)
            case .failure(let error):
                NSLog("Failed to get vehicle staet, Error \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
