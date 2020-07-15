//
//  Vehicles.swift
//  Control
//
//  Created by Will DeBerry on 7/6/20.
//

import SwiftUI
//import SwiftUIPullToRefresh

struct VehiclesView: View {
    @Binding var showSelf: Bool
    @State var vehicles: [Vehicle] = [Vehicle]()
    @State private var model: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(vehicles, id: \.id) { vehicle in
                    NavigationLink(destination: VehicleView(vehicle: vehicle, model: model)) {
                        VehiclesRow(vehicle: vehicle, model: $model)
                    }
                }
            }
            .navigationBarTitle(Text("Vehicles"))
            .navigationBarItems(leading:
                Button(action: {
                    Login().logout()
                    showSelf = false
                }) {
                    Image(systemName: "person.crop.circle")
                }
                , trailing:
                Button(action: {
                    getVehicles()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
        }
        .onAppear(perform: getVehicles)
    }

    private func getVehicles() {
        let api = Api(vehicle: nil)
        api.getVehicles() { vehicles in
            if let vehicles = vehicles {
                self.vehicles = vehicles
            }
        }
    }
}

struct Vehicles_Previews: PreviewProvider {
    static var previews: some View {
        VehiclesView(showSelf: .constant(true), vehicles: [vehicle1, vehicle2])
    }
}
