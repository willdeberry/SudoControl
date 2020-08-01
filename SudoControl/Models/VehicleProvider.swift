//
//  VehicleStateObject.swift
//  Control
//
//  Created by Will DeBerry on 7/30/20.
//

import Foundation

class VehicleProvider: ObservableObject {
    @Published var state: VehicleStateResponse? = nil
    @Published var chargeState: ChargeStateResponse? = nil
    @Published var isFetchingState: Bool = true
    @Published var isFetchingChargingState: Bool = true
    private var appModel: AppModel = AppModel()
    private var vehicle: Vehicle

    init(vehicle: Vehicle) {
        self.vehicle = vehicle
        getVehicleState()
        getChargeData()
    }

    private func getVehicleState() {
        isFetchingState = true
        appModel.api.getVehicleState(id: vehicle.idS) { vehicleState in
            if let vehicleState = vehicleState {
                DispatchQueue.main.async {
                    self.state = vehicleState
                    self.isFetchingState = false
                }
            }
        }
    }

    private func getChargeData() {
        isFetchingChargingState = true
        appModel.api.getChargeState(id: vehicle.idS) { chargeState in
            if let chargeState = chargeState {
                DispatchQueue.main.async {
                    self.chargeState = chargeState
                    self.isFetchingChargingState = false
                }
            }
        }
    }
}
