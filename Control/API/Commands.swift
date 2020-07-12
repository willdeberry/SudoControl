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
}