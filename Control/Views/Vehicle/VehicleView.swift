//
//  VehiclesItem.swift
//  Control
//
//  Created by Will DeBerry on 7/7/20.
//

import SwiftUI

struct VehicleView: View {
    var vehicle: Vehicle
    var model: String
    @StateObject private var vehicleProvider: VehicleProvider

    init(vehicle: Vehicle, model: String) {
        self._vehicleProvider = StateObject(wrappedValue: VehicleProvider(vehicle: vehicle))
        self.vehicle = vehicle
        self.model = model
    }

    var body: some View {
        NavigationView {
            if vehicleProvider.isFetchingState, vehicleProvider.isFetchingChargingState {
                VStack {
                    ProgressView("Loading...")
                }
            } else {
                VStack(spacing: 15) {
                    HStack {
                        DetailsView(vehicle: vehicle, state: $vehicleProvider.state)
                            .padding([.leading, .bottom], 30)
                            .padding([.trailing], 15)

                        BatteryProgress(chargeState: $vehicleProvider.chargeState)
                            .frame(width: 125.0, height: 125.0)
                            .padding([.trailing, .bottom], 30)
                            .padding([.leading], 15)
                            .shadow(radius: 10.0, x: 10, y: 10)
                    }
                    Divider()

                    ActionsView(vehicle: vehicle, chargeState: $vehicleProvider.chargeState)
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
        .navigationTitle(model)
    }
}

//struct VehiclesItem_Previews: PreviewProvider {
//    static var previews: some View {
//        VehicleView(vehicle: vehicle1, model: "Model 3")
//    }
//}
