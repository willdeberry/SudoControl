//
//  DetailsView.swift
//  Control
//
//  Created by Will DeBerry on 7/11/20.
//

import SwiftUI

struct DetailsView: View {
    var vehicle: Vehicle
    var model: String
    @State private var vehicleState: VehicleStateResponse? = nil

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Software Version:")
                    .bold()
                vehicleState.map({Text("\($0.carVersion)")})
                    .font(.subheadline)
                    .padding([.bottom], 10)
            }

            Group {
                Text("Odometer:")
                    .bold()
                vehicleState.map({Text("\(String(format: "%.2f", $0.odometer))")})
                    .font(.subheadline)
                    .padding([.bottom], 10)
            }

            Group {
                Text("VIN:")
                    .bold()
                Text(vehicle.vin)
                    .font(.subheadline)
            }
        }
        .onAppear(perform: getVehicleState)
    }

    private func getVehicleState() {
        let api = Api(vehicle: vehicle)
        api.getVehicleState() { vehicleState in
            if let vehicleState = vehicleState {
                self.vehicleState = vehicleState
            }
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
