//
//  VehiclesRow.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import SwiftUI

struct VehiclesRow: View {
    var vehicle: Vehicle
    @State private var vehicleConfig: VehicleConfig? = nil
    @Binding var model: String

    var body: some View {
        HStack {
            Image(systemName: "car")
                .padding([.leading, .trailing], 5)
            Divider()
            VStack(alignment: .leading) {
                Text(model)
                Text(vehicle.vin)
                    .font(.caption2)
            }
            .padding([.leading, .trailing], 5)
            Spacer()
        }
        .onAppear(perform: parseVehiceInfo)
    }

    private func parseVehiceInfo() {
        let options = vehicle.optionCodes.components(separatedBy: ",")
        if options.contains("MDLS") || options.contains("MS03") || options.contains("MS04") {
            model = "Model S"
        } else if options.contains("MDLX") {
            model = "Model X"
        } else if options.contains("MDL3") {
            model = "Model 3"
        } else if options.contains("MDLY") {
            model = "Model Y"
        }
    }
}

struct VehiclesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VehiclesRow(vehicle: vehicle1, model: .constant("Model 3"))
            VehiclesRow(vehicle: vehicle2, model: .constant("Model S"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
