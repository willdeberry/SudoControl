//
//  Commands.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import Foundation

extension Api {
    func sendWake(completion: @escaping (Bool) -> Void) {
        guard let id = vehicle?.idS else { return }
        sendCommand(method: "POST", api: "/vehicles/\(id)/wake_up", payload: nil) { result in
            switch result {
            case .success:
                completion(true)
            case .failure(let error):
                NSLog("Failed to send wake command, Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }

    func toggleChargePort(open: Bool, completion: @escaping (Bool) -> Void) {
        guard let id = vehicle?.idS else { return }
        var api = "/vehicles/\(id)/command/charge_port_door_close"

        if open {
            api = "/vehicles/\(id)/command/charge_port_door_open"
        }

        sendCommand(method: "POST", api: api, payload: nil) { result in
            switch result {
            case .success(let data):
                guard let postResult = try? newJSONDecoder().decode(PostResult.self, from: data) else {
                    NSLog("Failed to decode postResult")
                    completion(false)
                    return
                }
                if !postResult.response.result {
                    completion(false)
                    return
                }
                completion(true)
            case .failure(let error):
                NSLog("Failed to send charge port command, Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
