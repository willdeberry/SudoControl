//
//  Vehicles.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

extension Api {
    func getVehicles(completion: @escaping ([Vehicle]?) -> Void) {
        sendCommand(method: "GET", api: "vehicles", id: nil, payload: nil) { result in
            switch result {
            case .success(let data):
                guard let vehiclesData = try? newJSONDecoder().decode(VehiclesData.self, from: data) else {
                    NSLog("Failed to decode vehiclesData")
                    completion(nil)
                    return
                }

                completion(vehiclesData.vehicles)
            case .failure(let error):
                NSLog("Failed to send command, Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
