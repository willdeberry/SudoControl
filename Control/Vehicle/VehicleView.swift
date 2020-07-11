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

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text(model)
                        .font(.largeTitle)
                        .bold()
                    Text(vehicle.vin)
                        .font(.caption)
                }
                Spacer()
                BatteryProgress(chargeState: $chargeState)
                    .frame(width: 130.0, height: 130.0)
                    .padding([.leading, .trailing, .bottom], 30)
                Spacer()
            }

            Divider()

            ActionsView(chargeState: $chargeState)

            Spacer()
        }
        .onAppear(perform: getChargeData)
    }

    private func getChargeData() {
        let api = Api(vehicle: vehicle)
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
