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
    @State private var chargeState: ChargeStateResponse? = nil
    let api: Api

    init(vehicle: Vehicle, model: String, chargeState: ChargeStateResponse?) {
        self.vehicle = vehicle
        self.model = model
        self.api = Api(vehicle: vehicle)

        if let chargeState = chargeState {
            self.chargeState = chargeState
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack {
                    DetailsView(vehicle: vehicle, model: model)
                        .padding([.leading, .bottom], 30)
                        .padding([.trailing], 15)

                    BatteryProgress(chargeState: $chargeState)
                        .frame(width: 125.0, height: 125.0)
                        .padding([.trailing, .bottom], 30)
                        .padding([.leading], 15)
                        .shadow(radius: 10.0, x: 10, y: 10)
                }
                Divider()

                ActionsView(vehicle: vehicle, chargeState: $chargeState)
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationTitle(model)
        .onAppear(perform: getChargeData)
    }

    private func getChargeData() {
        api.getChargeState() { chargeState in
            if let chargeState = chargeState {
                self.chargeState = chargeState
            }
        }
    }
}

struct VehiclesItem_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView(vehicle: vehicle1, model: "Model 3", chargeState: sampleChargeState)
    }
}
