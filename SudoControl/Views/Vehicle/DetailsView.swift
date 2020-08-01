//
//  DetailsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct DetailsView: View {
    var vehicle: Vehicle
    @Binding var state: VehicleStateResponse?

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Software Version:")
                    .bold()

                state.map({
                    Text("\($0.carVersion)")
                        .font(.subheadline)
                        .padding([.bottom], 10)
                })
            }

            Group {
                Text("Odometer:")
                    .bold()

                state.map({
                    Text("\(String(format: "%.2f", $0.odometer))")
                        .font(.subheadline)
                        .padding([.bottom], 10)
                })
            }

            Group {
                Text("VIN:")
                    .bold()
                Text(vehicle.vin)
                    .font(.subheadline)
            }
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(vehicle: vehicle1, model: "Model 3")
//            .environmentObject(
//                ControlModel(
//                    isLoading: false,
//                    vehicles: [vehicle1, vehicle2],
//                    chargeState: sampleChargeState,
//                    vehicleState: sampleVehicleState
//                )
//            )
//    }
//}
