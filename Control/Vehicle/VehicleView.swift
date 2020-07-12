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
    let api: Api
    @State private var chargeState: ChargeStateResponse? = nil

    init(vehicle: Vehicle, model: String) {
        self.vehicle = vehicle
        self.model = model
        self.api = Api(vehicle: vehicle)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    DetailsView(vehicle: vehicle, model: model)
                        .padding([.leading, .bottom], 30)
                        .padding([.trailing], 15)
                    Spacer()
                    BatteryProgress(chargeState: $chargeState)
                        .frame(width: 125.0, height: 125.0)
                        .padding([.trailing, .bottom], 30)
                        .padding([.leading], 15)
                        .shadow(radius: 10.0, x: 10, y: 10)
                }

                Divider()

                ActionsView(chargeState: $chargeState)
            }
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

//struct VehiclesItem_Previews: PreviewProvider {
//    static var previews: some View {
//        VehicleView()
//    }
//}
