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
                BatteryProgress(vehicle: vehicle)
                    .frame(width: 130.0, height: 130.0)
                    .padding([.leading, .trailing, .bottom], 30)
                Spacer()
            }

            Divider()

            VStack {
                Spacer()
                HStack {
                    Button(action: {}){Text("Button")}
                    Button(action: {}){Text("Button")}
                    Button(action: {}){Text("Button")}
                }
                HStack {
                    Button(action: {}){Text("Button")}
                    Button(action: {}){Text("Button")}
                    Button(action: {}){Text("Button")}
                }
                Spacer()
            }

            Spacer()
        }
    }
}

//struct VehiclesItem_Previews: PreviewProvider {
//    static var previews: some View {
//        VehicleView()
//    }
//}
