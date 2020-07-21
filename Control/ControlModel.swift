//
//  ControlModel.swift
//  Control
//
//  Created by Will DeBerry on 7/15/20.
//

import Foundation

class ControlModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var vehicles: [Vehicle]
    @Published var chargeState: ChargeStateResponse?
    @Published var vehicleState: VehicleStateResponse?
    let authModel: AuthModel = AuthModel()
    let api: Api
    var login: Login

    init(isLoading: Bool, vehicles: [Vehicle] = [Vehicle](), chargeState: ChargeStateResponse? = nil, vehicleState: VehicleStateResponse? = nil) {
        api = Api(authModel: authModel)
        login = Login(authModel: authModel)

        self.isLoading = isLoading
        self.vehicles = vehicles
        self.chargeState = chargeState
        self.vehicleState = vehicleState
    }
}
