//
//  ControlModel.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

class AppModel: ObservableObject {
    @Published var vehicles: [Vehicle] = [Vehicle]()
    let authModel: AuthModel = AuthModel()
    let api: Api
    var login: Login

    init() {
        api = Api(authModel: authModel)
        login = Login(authModel: authModel)

        getVehicles()
    }

    public func refresh() {
        getVehicles()
    }

    private func getVehicles() {
        NSLog("Getting vehicles")
        api.getVehicles() { vehicles in
            if let vehicles = vehicles {
                DispatchQueue.main.async {
                    self.vehicles = vehicles
                }
            }
        }
    }
}
