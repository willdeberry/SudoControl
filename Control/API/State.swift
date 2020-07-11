//
//  State.swift
//  Control
//
//  Created by Will DeBerry on 7/8/20.
//

import Foundation

extension Api {
    func getChargeState(completion: @escaping (ChargeStateResponse?) -> Void) {
        guard let id = vehicle?.idS else { return }
        sendCommand(method: "GET", api: "/vehicles/\(id)/data_request/charge_state", payload: nil) { result in
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

    func getVehicleConfig(completion: @escaping (VehicleConfigResponse?) -> Void) {
        guard let id = vehicle?.idS else { return }
        sendCommand(method: "GET", api: "/vehicles/\(id)/data_request/vehicle_config", payload: nil) { result in
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
}
