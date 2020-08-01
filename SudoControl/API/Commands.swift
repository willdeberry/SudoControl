//
//  Commands.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import Foundation

extension Api {
    func sendWake(id: String, completion: @escaping (Bool) -> Void) {
        sendCommand(method: "POST", api: "/vehicles/\(id)/wake_up", id: id, payload: nil) { result in
            switch result {
            case .success:
                completion(true)
            case .failure(let error):
                NSLog("Failed to send wake command, Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }

    func toggleChargePort(id: String, open: Bool, completion: @escaping (Bool) -> Void) {
        var api = "/vehicles/\(id)/command/charge_port_door_close"

        if open {
            api = "/vehicles/\(id)/command/charge_port_door_open"
        }

        sendCommand(method: "POST", api: api, id: id, payload: nil) { result in
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

    func toggleWindows(id: String, open: Bool, completion: @escaping (Bool) -> Void) {
        var payload = ["command": "vent"]

        if open {
            payload = ["command": "close"]
        }

        sendCommand(method: "POST", api: "/vehicles/\(id)/command/window_control", id: id, payload: payload) { result in
            switch result {
            case .success:
                completion(true)
            case .failure(let error):
                NSLog("Failed to send vent comment, Error \(error.localizedDescription)")
                completion(false)
            }
        }
    }

    func toggleDoorLocks(id: String, open: Bool, completion: @escaping (Bool) -> Void) {
        var api = "/vehicles/\(id)/command/door_lock"

        if open {
            api = "/vehicles/\(id)/command/door_unlock"
        }

        sendCommand(method: "POST", api: api, id: id, payload: nil) { result in
            switch result {
            case .success:
                completion(true)
            case .failure(let error):
                NSLog("Failed to send door lock command, Error: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
