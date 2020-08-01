//
//  VehiclesRow.swift
//  Control
//
//  Created by Will DeBerry on 7/9/20.
//

import SwiftUI

struct VehiclesRow: View {
    var vehicle: Vehicle
    var model: String

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
    }
}

//struct VehiclesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            VehiclesRow(vehicle: vehicle1, model: "Model S")
//            VehiclesRow(vehicle: vehicle2, model: "Model 3")
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
